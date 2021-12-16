import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/const/collection_name.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

abstract class TeamRepository {
  Future<Team?> getTeam({required String userId, required String teamId});
  Future<List<Team>> getTeams(
      {required String userId, required int limitNum, required Team? lastTeam});
  Future<String> createTeam({required String userId, required Team team});
  Future<void> updateTeam({required String userId, required Team team});
  Future<void> deleteTeam({required String userId, required Team team});
}

final teamRepositoryProvider = Provider((ref) => TeamRepositoryImpl(ref.read));

class TeamRepositoryImpl implements TeamRepository {
  final Reader _read;

  TeamRepositoryImpl(this._read);

  @override
  Future<List<Team>> getTeams(
      {required String userId,
      required int limitNum,
      required Team? lastTeam}) async {
    final userRef = _read(firebaseFirestoreProvider).getUserDocRef(userId);
    final teamsRef = userRef
        .collection(CollectionName.teams)
        .orderBy('createdAt', descending: true)
        .limit(limitNum);

    QuerySnapshot<Map<String, dynamic>> snap;
    if (lastTeam == null) {
      snap = await teamsRef.get();
    } else {
      snap = await teamsRef
          .startAfter([Timestamp.fromDate(lastTeam.createdAt!)]).get();
    }

    return snap.docs
        .map((doc) => Team.fromJsonWithId(json: doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<String> createTeam(
      {required String userId, required Team team}) async {
    final userRef = _read(firebaseFirestoreProvider).getUserDocRef(userId);
    final teamRef =
        await userRef.collection(CollectionName.teams).add(team.toJson());
    return teamRef.id;
  }

  @override
  Future<Team?> getTeam(
      {required String userId, required String teamId}) async {
    final userRef = _read(firebaseFirestoreProvider).getUserDocRef(userId);
    final teamDoc =
        await userRef.collection(CollectionName.teams).doc(teamId).get();
    final teamDocData = teamDoc.data();
    if (teamDoc.exists && teamDocData != null)
      return Team.fromJsonWithId(json: teamDocData, id: teamDoc.id);
  }

  @override
  Future<void> updateTeam({required String userId, required Team team}) async {
    final userRef = _read(firebaseFirestoreProvider).getUserDocRef(userId);
    await userRef
        .collection(CollectionName.teams)
        .doc(team.id)
        .update(team.toJson());
  }

  @override
  Future<void> deleteTeam({required String userId, required Team team}) async {
    final batch = _read(firebaseFirestoreProvider).batch();

    final userRef = _read(firebaseFirestoreProvider).getUserDocRef(userId);
    final teamRef = userRef.collection(CollectionName.teams).doc(team.id);
    final buildCollRef = teamRef.collection(CollectionName.builds);
    final buildDocs = (await buildCollRef.get()).docs;
    for (final buildDoc in buildDocs) {
      batch.delete(buildDoc.reference);
    }
    batch.delete(teamRef);

    await batch.commit();
  }
}

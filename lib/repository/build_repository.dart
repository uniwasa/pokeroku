import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/const/collection_name.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

abstract class BuildRepository {
  Future<String> createBuild(
      {required String userId, required Build build, Team? team});
  Future<void> updateBuild(
      {required String userId, required Build build, Team? team});
  Future<List<Build>> getBuilds(
      {required String userId, Team? team, int? limitNum});
}

final buildRepositoryProvider =
    Provider((ref) => BuildRepositoryImpl(ref.read));

class BuildRepositoryImpl implements BuildRepository {
  final Reader _read;

  BuildRepositoryImpl(this._read);

  @override
  Future<String> createBuild({
    required String userId,
    required Build build,
    Team? team,
  }) async {
    try {
      if (team != null) {
        final batch = _read(firebaseFirestoreProvider).batch();

        final userRef =
            _read(firebaseFirestoreProvider).getUserDocument(userId);
        final teamRef = userRef.collection(CollectionName.teams).doc(team.id);
        final buildRef = teamRef.collection(CollectionName.builds).doc();
        batch.set(buildRef, build.toJsonWithTeam(team: team, teamRef: teamRef));
        final denormalizedBuild =
            Team.makeDenormalizedBuild(build: build.copyWith(id: buildRef.id));
        batch.update(teamRef, denormalizedBuild);

        await batch.commit();
        return buildRef.id;
      } else {
        return '';
      }
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<void> updateBuild({
    required String userId,
    required Build build,
    Team? team,
  }) async {
    try {
      if (team != null) {
        final batch = _read(firebaseFirestoreProvider).batch();

        final userRef =
            _read(firebaseFirestoreProvider).getUserDocument(userId);
        final teamRef = userRef.collection(CollectionName.teams).doc(team.id);
        final buildRef =
            teamRef.collection(CollectionName.builds).doc(build.id);
        batch.update(buildRef, build.toJson());
        final denormalizedBuild = Team.makeDenormalizedBuild(build: build);
        batch.update(teamRef, denormalizedBuild);

        await batch.commit();
      } else {}
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Build>> getBuilds(
      {required String userId, Team? team, int? limitNum}) async {
    try {
      if (team != null) {
        final userRef =
            _read(firebaseFirestoreProvider).getUserDocument(userId);
        final teamRef = userRef.collection(CollectionName.teams).doc(team.id);
        final snap = await teamRef
            .collection(CollectionName.builds)
            .orderBy('createdAt', descending: true)
            .get();
        return snap.docs.map((doc) => Build.fromDocument(doc)).toList();
      } else {
        return [];
      }
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}

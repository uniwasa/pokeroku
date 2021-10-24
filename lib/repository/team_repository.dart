import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

abstract class TeamRepository {
  Future<List<Team>> getAllTeams({required String userId});

  Future<List<Team>> getTeams(
      {required String userId, required int limitNum, required Team? lastTeam});
}

final teamRepositoryProvider = Provider((ref) => TeamRepositoryImpl(ref.read));

class TeamRepositoryImpl implements TeamRepository {
  final Reader _read;

  TeamRepositoryImpl(this._read);

  @override
  Future<List<Team>> getAllTeams({required String userId}) async {
    try {
      // UserIdに紐づく、アイテムを取得
      final userRef = _read(firebaseFirestoreProvider).getUserDocument(userId);
      final snap = await userRef.collection('teams').get();
      return snap.docs.map((doc) => Team(name: doc.get('name'))).toList();
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Team>> getTeams(
      {required String userId,
      required int limitNum,
      required Team? lastTeam}) async {
    try {
      final userRef = _read(firebaseFirestoreProvider).getUserDocument(userId);
      final teamsRef =
          userRef.collection('teams').orderBy('name').limit(limitNum);

      QuerySnapshot snap;
      if (lastTeam == null) {
        snap = await teamsRef.get();
      } else {
        snap = await teamsRef.startAfter([lastTeam.name]).get();
      }
      return snap.docs.map((doc) => Team(name: doc.get('name'))).toList();
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}

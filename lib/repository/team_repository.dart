import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

abstract class TeamRepository {
  Future<Team> getTeam({required String userId, required String teamId});

  Future<List<Team>> getAllTeams({required String userId});

  Future<List<Team>> getTeams(
      {required String userId, required int limitNum, required Team? lastTeam});

  Future<void> createTeam({required String userId, required Team team});
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
      return snap.docs.map((doc) => Team.fromDocument(doc)).toList();
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
      final teamsRef = userRef
          .collection('teams')
          .orderBy('createdAt', descending: true)
          .limit(limitNum);

      QuerySnapshot<Map<String, dynamic>> snap;
      if (lastTeam == null) {
        snap = await teamsRef.get();
      } else {
        snap = await teamsRef
            .startAfter([Timestamp.fromDate(lastTeam.createdAt!)]).get();
      }

      return snap.docs.map((doc) => Team.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  @override
  Future<String> createTeam(
      {required String userId, required Team team}) async {
    try {
      final userRef = _read(firebaseFirestoreProvider).getUserDocument(userId);
      final teamRef = await userRef.collection('teams').add(team.toJson());
      return teamRef.id;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  @override
  Future<Team> getTeam({required String userId, required String teamId}) async {
    try {
      final userRef = _read(firebaseFirestoreProvider).getUserDocument(userId);
      final teamDoc = await userRef.collection('teams').doc(teamId).get();
      final team = Team.fromDocument(teamDoc);
      return team;
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}

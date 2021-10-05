import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

abstract class TeamRepository {
  Future<List<Team>> getTeams({required String userId});
}

class TeamRepositoryImpl implements TeamRepository {
  final Reader _read;

  TeamRepositoryImpl(this._read);

  @override
  Future<List<Team>> getTeams({required String userId}) async {
    try {
      // UserIdに紐づく、アイテムを取得
      final userRef = _read(firebaseFirestoreProvider).getUserDocument(userId);
      final snap = await userRef.collection('teams').get();
      return snap.docs.map((doc) => Team(name: doc.get('name'))).toList();
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}

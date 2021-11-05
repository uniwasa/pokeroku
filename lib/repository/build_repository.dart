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
        final buildData =
            Team.makeBuildData(build: build.copyWith(id: buildRef.id));
        batch.update(teamRef, buildData);

        await batch.commit();
        return buildRef.id;
      } else {
        return '';
      }
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}

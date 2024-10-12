import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/model/character_model.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/remote/character_remote_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/characters/data/remote/character_remote.g.dart';

@Riverpod(keepAlive: true)
CharacterRemote characterRemote(CharacterRemoteRef ref) {
  return CharacterRemoteImpl(ref);
}


abstract class CharacterRemote {
  Future<List<CharacterModel>> fetchAllCharacters(int page);
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_devcamp_riverpod_api/src/core/http.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/remote/character_remote.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/model/character_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterRemoteImpl extends CharacterRemote {
  final Ref ref;

  CharacterRemoteImpl(this.ref);

  @override
  Future<List<CharacterModel>> fetchAllCharacters(int page) async {
    // Path.
    const path = '/character';
    try {
      // Parameter(s).
      final queryParameters = <String, dynamic>{
        'page': page,
        'pageSize': 10,
      };

      // Http call.
      final Response response = await ref.read(httpProvider).get(
            path,
            queryParameters: queryParameters,
          );

      // Result.
      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final results = List<Map<String, dynamic>>.from(data['data']);
        if (results.isNotEmpty) {
          return results.map((e) => CharacterModel.fromMap(e)).toList();
        }
      }
      return <CharacterModel>[];
    } on SocketException catch (err) {
      throw Exception(err);
    } catch (err) {
      throw Exception(err);
    }
  }
}

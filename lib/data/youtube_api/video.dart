import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

Future<Response> getYoutubeVideos(Dio client) async {
  final jsonString = await rootBundle.loadString('secrets.json');
  final data = json.decode(jsonString);

  String apiKey = data['api_key'];

  return client.get('/playlistItems', queryParameters: {
    'key': apiKey,
    'playlistId': 'PLDr7Z-9oq6555ISGuDLic7nA8qKv4n_Gj',
    'part': 'snippet',
    'maxResults': 50,
  });
}

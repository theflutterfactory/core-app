import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutterfactory/data/firebase_api/video.dart';
import 'package:flutterfactory/data/youtube_api/client.dart';
import 'package:flutterfactory/data/youtube_api/video.dart';

///A useful abstraction layer between services and data
class VideoRepository {
  late Dio dio;

  VideoRepository() {
    dio = client();
  }

  Future<Response> fetchAllVideos() async {
    return await getYoutubeVideos(dio);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfactory/data/api/video.dart';
import 'package:flutterfactory/model/video.dart';

///A useful abstraction layer between services and data
class VideoRepository {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      fetchAllVideos() async {
    var snapshot = await getVideos();
    return snapshot.docs;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getVideos() {
  var videos = FirebaseFirestore.instance.collection('videos').orderBy('name');
  return videos.get();
}

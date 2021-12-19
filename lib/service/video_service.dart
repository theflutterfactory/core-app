import 'package:flutterfactory/model/video.dart';
import 'package:flutterfactory/repository/video_repository.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository();

  Future<List<Video>> fetchVideos() async {
    var videos = await _videoRepository.fetchAllVideos();

    return videos.map((snapshot) {
      var videoMap = snapshot.data();
      return Video(videoMap['name'], '');
    }).toList();
  }
}

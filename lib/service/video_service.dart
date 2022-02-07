import 'package:flutterfactory/model/video.dart';
import 'package:flutterfactory/repository/video_repository.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository();

  Future<List<Video>> fetchVideos() async {
    var response = await _videoRepository.fetchAllVideos();

    return List<Video>.from(
      (response.data['items']).map((json) => Video.fromJson(json['snippet'])),
    );
  }
}

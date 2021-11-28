import 'package:flutterfactory/model/video.dart';
import 'package:flutterfactory/repository/video_repository.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository();

  Future<List<Video>> fetchVideos() {
    //Do some operations on the data before returning if needed
    return _videoRepository.fetchAllVideos();
  }
}

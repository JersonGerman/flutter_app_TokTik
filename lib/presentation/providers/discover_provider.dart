import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DisconverProvider extends ChangeNotifier {

  final VideoPostRepository videosRepository;

  DisconverProvider({ required this.videosRepository });

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // todo: cargar videos  -  simulate request http
    // await Future.delayed(const Duration(seconds: 2));
    
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);
      
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}

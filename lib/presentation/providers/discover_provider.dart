import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import '../../infrastructure/repositories/video_post_repositories_impl.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepositoryImpl videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
  final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}

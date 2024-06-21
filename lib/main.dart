import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/apptheme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_post_repositories_impl.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostReposity =
        VideoPostsRepositoryImpl(videoDataSource: LocalVideoDarasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => DiscoverProvider(videoPostRepository: videoPostReposity)..loadNextPage())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TokTik',
          theme: Apptheme().gettheme(),
          home: DiscoverScreen()),
    );
  }
}

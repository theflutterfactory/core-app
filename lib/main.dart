import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_factory/controller/video_notifier.dart';
import 'package:flutter_factory/view/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => VideoNotifier())],
      child: FlutterFactory(),
    ),
  );
}

class FlutterFactory extends StatefulWidget {
  FlutterFactory({Key? key}) : super(key: key);

  @override
  State<FlutterFactory> createState() => _FlutterFactoryState();
}

class _FlutterFactoryState extends State<FlutterFactory> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<VideoNotifier>(context, listen: false).fetchVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

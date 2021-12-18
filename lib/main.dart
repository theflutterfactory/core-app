import 'package:flutter/material.dart';
import 'package:flutterfactory/controller/video_notifier.dart';
import 'package:flutterfactory/view/home/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => VideoNotifier())],
      child: FlutterFactory(),
    ),
  );
}

class FlutterFactory extends StatelessWidget {
  const FlutterFactory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home(),
          );
        }

        return Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

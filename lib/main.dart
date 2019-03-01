import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_test_app/bloc/bloc_container.dart';
import 'package:video_test_app/bloc/video_bloc.dart';
import 'package:video_test_app/videos_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocContainer(key: key,
      videoBloc: VideoBloc(),
      child: MaterialApp(home:VideosListPage()));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {}
}

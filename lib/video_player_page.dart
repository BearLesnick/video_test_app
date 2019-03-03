import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:video_player/video_player.dart';
import 'package:video_test_app/bloc/bloc_container.dart';
import 'package:video_test_app/bloc/video_bloc.dart';
import 'package:video_test_app/model/video.dart';

class VideoPlayerPage extends StatefulWidget {
  final Video video;

  const VideoPlayerPage({Key key, @required this.video}) : super(key: key);

  @override
  VideoPlayerState createState() {
    return new VideoPlayerState();
  }
}

class VideoPlayerState extends State<VideoPlayerPage> {
  VideoPlayerController _controller;
  BehaviorSubject<bool> isPlayingSubject = BehaviorSubject<bool>();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.url)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          print("play started");
        });

      });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _videoIndicatorSize = _screenWidth / 10 * 8;
    double _maxDeviceAspectRatio = MediaQuery.of(context).size.aspectRatio * 2;
    VideoBloc videoBloc = BlocContainer.of(context).videoBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.name),
      ),
      backgroundColor: Color.fromRGBO(224, 224, 224, 1.0),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: _screenWidth,
            child: Column(
              children: <Widget>[
                Center(
                  child: AspectRatio(
                      aspectRatio: _controller.value.initialized
                          ? _controller.value.aspectRatio
                          : _maxDeviceAspectRatio,
                      child: _controller.value.initialized
                          ? VideoPlayer(_controller)
                          : Container(
                              child: Center(
                                  child: Container(
                                      height: 20.0,
                                      width: 20.0,
                                      child: CircularProgressIndicator())),
                            )),
                ),
                Opacity(
                  opacity: _controller.value.initialized ? 1.0 : 0.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              videoBloc.playPreviousVideo(context);
                            },
                            icon: Icon(Icons.skip_previous),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_controller.value.initialized) {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                }
                              });
                            },
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              videoBloc.playNextVideo(context);
                            },
                            icon: Icon(Icons.skip_next),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      Container(
                        width: _videoIndicatorSize,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          padding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    isPlayingSubject.close();
  }
}

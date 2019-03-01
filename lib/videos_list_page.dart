import 'package:flutter/material.dart';
import 'package:video_test_app/bloc/bloc_container.dart';
import 'package:video_test_app/bloc/video_bloc.dart';
import 'package:video_test_app/model/video.dart';
import 'package:video_test_app/video_player_page.dart';

class VideosListPage extends StatefulWidget {
  @override
  _VideosListPageState createState() => _VideosListPageState();
}

class _VideosListPageState extends State<VideosListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VideoBloc videoBloc = BlocContainer.of(context).videoBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body: StreamBuilder(
          stream: videoBloc.getVideosStream(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              List<Video> videos = snapshot.data;
              return ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(),
                      child: InkWell(
                        onTap: () {
                          videoBloc.playVideo(context, index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  height: 70.0,
                                  width: 70.0,
                                  child: videos[index].pictureURL != null
                                      ? Image.network(videos[index].pictureURL)
                                      : Image.asset(
                                          "assets/default-thumbnail.png")),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 200.0,
                                  child: Text(
                                    videos[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              );
            } else {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}

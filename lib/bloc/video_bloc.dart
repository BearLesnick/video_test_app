import 'package:flutter/material.dart';
import 'package:video_test_app/model/video.dart';
import 'package:rxdart/subjects.dart';
import 'package:video_test_app/video_player_page.dart';

class VideoBloc {
  BehaviorSubject<List<Video>> _videosSubject;
  int _currentVideoIndex = 0;
  VideoBloc() {
    _videosSubject = BehaviorSubject<List<Video>>();
    _downloadVideos().then((videos) {
      _videosSubject.add(videos);
    });
  }

  Stream<List<Video>> getVideosStream(){
    return _videosSubject?.stream;
  }

  Video getVideoByIndex(int index) {
    return _videosSubject.value[index];
  }

  void playNextVideo(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
      _currentVideoIndex+=1;
      return VideoPlayerPage(video: _videosSubject.value[_currentVideoIndex%_videosSubject.value.length],);
    }));
  }

  void playPreviousVideo(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
      _currentVideoIndex-=1;
      return VideoPlayerPage(video: _videosSubject.value[_currentVideoIndex%_videosSubject.value.length],);
    }));
  }
  void playVideo(BuildContext context, int index)
  {
    _currentVideoIndex = index;
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return VideoPlayerPage(video: _videosSubject.value[index],);
    }));
  }

  close() {
    _videosSubject.close();
  }

  Future<List<Video>> _downloadVideos() async {
    return Future.delayed(Duration(seconds: 3), () {
      return [
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443230~acl=%2A%2F924662021.mp4%2A~hmac=d21593e65a2970dcfc8056770b109fa90690862b86cb49674a252ebbfeacab0d/vimeo-prod-skyfire-std-us/01/730/10/253653841/924662021.mp4",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443921~acl=%2A%2F1163932066.mp4%2A~hmac=03dae5ced83fdf8395dfae7e882381ac8ae6d5b43ff66f11314ce0442c12b3bd/vimeo-prod-skyfire-std-us/01/768/12/303843089/1163932066.mp4",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443979~acl=%2A%2F1163940106.mp4%2A~hmac=8c4861d1b5e104c59a5dbba20a4be6d027ed26a478a2378de45f29ce714751df/vimeo-prod-skyfire-std-us/01/768/12/303844889/1163940106.mp4",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"),  Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443230~acl=%2A%2F924662021.mp4%2A~hmac=d21593e65a2970dcfc8056770b109fa90690862b86cb49674a252ebbfeacab0d/vimeo-prod-skyfire-std-us/01/730/10/253653841/924662021.mp4",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443921~acl=%2A%2F1163932066.mp4%2A~hmac=03dae5ced83fdf8395dfae7e882381ac8ae6d5b43ff66f11314ce0442c12b3bd/vimeo-prod-skyfire-std-us/01/768/12/303843089/1163932066.mp4",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443979~acl=%2A%2F1163940106.mp4%2A~hmac=8c4861d1b5e104c59a5dbba20a4be6d027ed26a478a2378de45f29ce714751df/vimeo-prod-skyfire-std-us/01/768/12/303844889/1163940106.mp4",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"),  Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443230~acl=%2A%2F924662021.mp4%2A~hmac=d21593e65a2970dcfc8056770b109fa90690862b86cb49674a252ebbfeacab0d/vimeo-prod-skyfire-std-us/01/730/10/253653841/924662021.mp4",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443921~acl=%2A%2F1163932066.mp4%2A~hmac=03dae5ced83fdf8395dfae7e882381ac8ae6d5b43ff66f11314ce0442c12b3bd/vimeo-prod-skyfire-std-us/01/768/12/303843089/1163932066.mp4",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://gcs-vimeo.akamaized.net/exp=1551443979~acl=%2A%2F1163940106.mp4%2A~hmac=8c4861d1b5e104c59a5dbba20a4be6d027ed26a478a2378de45f29ce714751df/vimeo-prod-skyfire-std-us/01/768/12/303844889/1163940106.mp4",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"),
      ];
    });
  }
}

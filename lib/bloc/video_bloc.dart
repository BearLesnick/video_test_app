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
//Mock method that emulates videos list fetching
  Future<List<Video>> _downloadVideos() async {
    return Future.delayed(Duration(seconds: 3), () {
      return [
        Video(
            url:
                "https://player.vimeo.com/external/253653841.hd.mp4?s=60190a033ce007bfec8c78842658322eb65d9cb7&profile_id=175&oauth2_token_id=57447761",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url: "https://player.vimeo.com/external/198581686.hd.mp4?s=4c12db8025496b7138c44d683e65307a5aa0c477&profile_id=119&oauth2_token_id=57447761",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://player.vimeo.com/external/303844889.hd.mp4?s=0931f8dedacd8d20e248e6074912567e260190a4&profile_id=172&oauth2_token_id=57447761",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"),         Video(
            url:
                "https://player.vimeo.com/external/253653841.hd.mp4?s=60190a033ce007bfec8c78842658322eb65d9cb7&profile_id=175&oauth2_token_id=57447761",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url: "https://player.vimeo.com/external/198581686.hd.mp4?s=4c12db8025496b7138c44d683e65307a5aa0c477&profile_id=119&oauth2_token_id=57447761",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://player.vimeo.com/external/303844889.hd.mp4?s=0931f8dedacd8d20e248e6074912567e260190a4&profile_id=172&oauth2_token_id=57447761",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"),         Video(
            url:
                "https://player.vimeo.com/external/253653841.hd.mp4?s=60190a033ce007bfec8c78842658322eb65d9cb7&profile_id=175&oauth2_token_id=57447761",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url: "https://player.vimeo.com/external/198581686.hd.mp4?s=4c12db8025496b7138c44d683e65307a5aa0c477&profile_id=119&oauth2_token_id=57447761",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://player.vimeo.com/external/303844889.hd.mp4?s=0931f8dedacd8d20e248e6074912567e260190a4&profile_id=172&oauth2_token_id=57447761",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"),         Video(
            url:
                "https://player.vimeo.com/external/253653841.hd.mp4?s=60190a033ce007bfec8c78842658322eb65d9cb7&profile_id=175&oauth2_token_id=57447761",
            name: "Baskectball game",
            pictureURL:
                "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url: "https://player.vimeo.com/external/198581686.hd.mp4?s=4c12db8025496b7138c44d683e65307a5aa0c477&profile_id=119&oauth2_token_id=57447761",
            name: "Wind power",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
                "https://player.vimeo.com/external/303844889.hd.mp4?s=0931f8dedacd8d20e248e6074912567e260190a4&profile_id=172&oauth2_token_id=57447761",
            name: "Field",
            pictureURL:
                "https://static-videos.pexels.com/videos/1649831/free-video-1649831.jpg"),
        Video(
            url:
                "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
            name: "Fat bunny sample"), Video(
            url:
            "https://player.vimeo.com/external/253653841.hd.mp4?s=60190a033ce007bfec8c78842658322eb65d9cb7&profile_id=175&oauth2_token_id=57447761",
            name: "Baskectball game",
            pictureURL:
            "https://static-videos.pexels.com/videos/857790/free-video-857790.jpg"),
        Video(
            url: "https://player.vimeo.com/external/198581686.hd.mp4?s=4c12db8025496b7138c44d683e65307a5aa0c477&profile_id=119&oauth2_token_id=57447761",
            name: "Wind power",
            pictureURL:
            "https://static-videos.pexels.com/videos/1649787/free-video-1649787.jpg"),
        Video(
            url:
            "https://player.vimeo.com/external/303844889.hd.mp4?s=0931f8dedacd8d20e248e6074912567e260190a4&profile_id=172&oauth2_token_id=57447761",
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

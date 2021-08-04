import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MindWimhof extends StatefulWidget {
  @override
  _MindWimhofState createState() => _MindWimhofState();
}

class _MindWimhofState extends State<MindWimhof> {

  void initState(){
    initAudioService();
    super.initState();
  }

  initAudioService() async{
    await AudioService.connect();
  }

  void dispose(){
    AudioService.disconnect();
    super.dispose();
  }

  Widget build(BuildContext context) {
    String url = "assets/wimhof.mp3";
    return Scaffold(
      backgroundColor: Color(0xff000a33),
      appBar: AppBar(
        title: Text('background player',style: TextStyle(color: Colors.black),),
        actions: [Center(child: Text('Stop',style: TextStyle(color: Colors.black),)),IconButton(icon: Icon(Icons.stop,color: Colors.black,), onPressed: (){AudioService.stop();})],
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/yoga.png'),
            fit: BoxFit.cover
          ),
          color: Color(0xff000a33),
        ),
        child: Center(
          child: StreamBuilder<PlaybackState>(
            stream: AudioService.playbackStateStream,
            builder: (context,snapshot){
              final playing = snapshot.data?.playing ?? false;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.pause,color: Colors.redAccent,size: MediaQuery.of(context).size.width/6,), onPressed: (){
                    AudioService.pause();
                  }),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(icon: Icon(Icons.play_circle_outline,color: Colors.redAccent,size: MediaQuery.of(context).size.width/6), onPressed: (){
                    if(AudioService.running){
                      AudioService.play();
                    }else{
                      AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntryPoint,params: {"url":url});
                    }
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

_backgroundTaskEntryPoint(){
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask{
  final _audioPlayer = AudioPlayer();
  @override
  Future<void> onStart(Map<String, dynamic> params) async{
    AudioServiceBackground.setState(
      controls: [MediaControl.pause,MediaControl.stop],
      playing: true,
      processingState: AudioProcessingState.connecting,
    );
    await _audioPlayer.setAsset(params["url"]);

    _audioPlayer.play();
    AudioServiceBackground.setState(
      controls: [MediaControl.pause,MediaControl.stop],
      playing: true,
      processingState: AudioProcessingState.ready,
    );
    return super.onStart(params);
  }
  @override
  Future<void> onStop() async{
    AudioServiceBackground.setState(
      controls: [],
      playing: false,
      processingState: AudioProcessingState.stopped,
    );
    await _audioPlayer.stop();
    return super.onStop();
  }
  @override
  Future<void> onPause() async{
    AudioServiceBackground.setState(
      controls: [MediaControl.play,MediaControl.stop],
      playing: true,
      processingState: AudioProcessingState.ready,
    );
    await _audioPlayer.pause();
    return super.onPause();
  }
  @override
  Future<void> onPlay() async{
    AudioServiceBackground.setState(
      controls: [MediaControl.pause,MediaControl.stop],
      playing: true,
      processingState: AudioProcessingState.ready,
    );
    await _audioPlayer.play();
    return super.onPlay();
  }
}
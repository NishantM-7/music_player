import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../models/song_model.dart';
import '../widgets/seekbar.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Song.songs[0];
  @override
  void initState() {
    super.initState();

    // AudioSource.uri(
    // Uri.parse('asset:///${song.url}'),
    //   Uri.parse(song.url));
    final duration = audioPlayer.setUrl(// Load a URL
        song.url);
    print(song.url);
    audioPlayer.play();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.fill,
          ),
          const _BackgroundFilter(),
          StreamBuilder<SeekBarData>(
              stream: _seekBarDataStream,
              builder: (context, snapshot) {
                final postionData = snapshot.data;
                return SeekBar(
                  position: postionData?.position ?? Duration.zero,
                  duration: postionData?.duration ?? Duration.zero,
                  onChangeEnd: audioPlayer.seek,
                );
              })
          // StreamBuilder<SeekBarData>(
          //     stream: _seekBarDataStream,
          //     builder: (context, snapshot) {
          //       final positionData = snapshot.data;
          //       return SeekBar(
          //         position: positionData?.duration ?? Duration.zero,
          //         duration: positionData?.duration ?? Duration.zero,
          //         onChangeEnd: audioPlayer.seek,
          //       );
          //     }),
        ],
      ),
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.6), //(0.5)
              Colors.white.withOpacity(0.0),
            ],
            stops: const [
              0.1,
              0.4,
              1, //0.0 , 0.4 , 0.6
            ]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ])),
      ),
    );
  }
}

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  late AudioPlayer _audioPlayer;

  final _playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song1.mp3'),
        tag: MediaItem(
            id: '0',
            title: 'Ek zindgi',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/originals/3c/13/51/3c1351085356223e87480d7b53825c12.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song2.mp3'),
        tag: MediaItem(
            id: '1',
            title: 'Sude Bazi',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/57/cf/62/57cf622f247194955b69cce7d28695b0.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song3.mp3'),
        tag: MediaItem(
            id: '2',
            title: 'Gulabi aankhee',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/00/7b/4d/007b4d48a093e0ed6ad47715758c01a0.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song4.mp3'),
        tag: MediaItem(
            id: '3',
            title: 'Tum mile dil khile',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/2d/74/66/2d74667ba86bffc3bf1808885cdff1a2.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song5.mp3'),
        tag: MediaItem(
            id: '4',
            title: 'Dekho dekho janam hum..',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/ae/b0/7e/aeb07e03b4b3d986c08ef0f06f9ad8c2.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song6.mp3'),
        tag: MediaItem(
            id: '5',
            title: 'Ye hasin wadiyaa',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/originals/d5/e5/ab/d5e5ab70c3b9b5574f8ccacd08f92cb5.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song7.mp3'),
        tag: MediaItem(
            id: '6',
            title: 'Sathiya sathiya',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/originals/61/a6/ab/61a6ab8691aa73e676bcb090d69ef1d1.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song8.mp3'),
        tag: MediaItem(
            id: '7',
            title: 'Kiss me..',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/02/e6/46/02e646ec239b3c60697ccf15ca337cbc.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song9.mp3'),
        tag: MediaItem(
            id: '8',
            title: 'Tum mile',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/21/b1/48/21b1487f1fea86fc26af17d0a2107a8e.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song3.mp3'),
        tag: MediaItem(
            id: '9',
            title: 'Kiss me..',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/originals/83/cf/3a/83cf3a4acb9352add483e251b7111287.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song11.mp3'),
        tag: MediaItem(
            id: '10',
            title: 'Just go to hell',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/4e/9d/b0/4e9db0f2054f2aada816b346759b8824.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song12.mp3'),
        tag: MediaItem(
            id: '11',
            title: 'Be Alright',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/5c/e8/93/5ce8937bb2e5418487567cafef22b1a9.jpg')),
      ),
      AudioSource.uri(
        Uri.parse('asset:///assets/audio/song13.mp3'),
        tag: MediaItem(
            id: '12',
            title: 'Love you Zindgi',
            artist: 'djfo djf',
            artUri: Uri.parse(
                'https://i.pinimg.com/564x/01/46/f0/0146f0b8d13f3f62a0988650abb862b3.jpg')),
      ),
    ],
  );

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playlist);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 248, 112, 239),
              Color.fromARGB(255, 223, 138, 217),
              Color.fromARGB(255, 43, 53, 61)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<SequenceState?>(
              stream: _audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? true) {
                  return SizedBox();
                }
                final metadata = state!.currentSource!.tag as MediaItem;
                return MediaMetadata(
                    imageUrl: metadata.artUri.toString(),
                    artist: metadata.artist.toString(),
                    title: metadata.title);
              },
            ),
            StreamBuilder<PositionData>(
              stream: positionDataStream,
              builder: (context, snapshot) {
                final PositionData = snapshot.data;
                return ProgressBar(
                  barHeight: 8,
                  baseBarColor: Color.fromARGB(255, 252, 253, 253),
                  bufferedBarColor: Color.fromARGB(255, 163, 145, 144),
                  progressBarColor: Color.fromARGB(255, 72, 149, 226),
                  thumbColor: Color.fromARGB(255, 251, 251, 250),
                  timeLabelTextStyle: const TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.w500,
                  ),
                  progress: PositionData?.position ?? Duration.zero,
                  buffered: PositionData?.bufferPosition ?? Duration.zero,
                  total: PositionData?.duration ?? Duration.zero,
                  onSeek: _audioPlayer.seek,
                );
              },
            ),
            Controls(
              audioPlayer: _audioPlayer,
            ),
          ],
        ),
      ),
    );
  }
}

class PositionData {
  PositionData(
    this.position,
    this.bufferPosition,
    this.duration,
  );
  final Duration position;
  final Duration bufferPosition;
  final Duration duration;
}

class Controls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const Controls({
    super.key,
    required this.audioPlayer,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: audioPlayer.seekToPrevious,
          color: Colors.white,
          icon: Icon(
            Icons.skip_previous,
            size: 80,
          ),
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final PlayerState = snapshot.data;
            final playing = PlayerState?.playing;
            final processingState = PlayerState?.processingState;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: audioPlayer.play,
                color: Colors.white,
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 80,
                ),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.stop,
                color: Colors.white,
                icon: Icon(
                  Icons.pause_circle,
                  size: 80,
                ),
              );
            }
            return const Icon(
              Icons.pause,
              size: 80,
              color: Colors.white,
            );
          },
        ),
        IconButton(
          onPressed: audioPlayer.seekToNext,
          color: Colors.white,
          icon: Icon(
            Icons.skip_next,
            size: 80,
          ),
        ),
      ],
    );
  }
}

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({
    super.key,
    required this.imageUrl,
    required this.artist,
    required this.title,
  });

  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(20)),
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(3, 4),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 450,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 13, 5, 71),
              fontWeight: FontWeight.bold,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          artist,
          style: const TextStyle(
            color: Color.fromARGB(255, 14, 4, 79),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}

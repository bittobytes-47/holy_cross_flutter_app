
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


class AudioPlayerUI extends StatefulWidget {
  const AudioPlayerUI({super.key});

  @override
  State<AudioPlayerUI> createState() => _AudioPlayerUIState();
}

class _AudioPlayerUIState extends State<AudioPlayerUI> {
  final AudioPlayer _player = AudioPlayer();

  final String audioUrl =
      "https://s30.radiolize.com/radio/8070/radio.mp3";

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _player.playerStateStream.listen((state) {
      setState(() {
        _isLoading =
            state.processingState == ProcessingState.loading ||
                state.processingState == ProcessingState.buffering;
      });
    });

    _player.durationStream.listen((duration) {
      if (duration != null) {
        setState(() => _duration = duration);
      }
    });

    _player.positionStream.listen((position) {
      setState(() => _position = position);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _playPause() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      if (_player.audioSource == null) {
        await _player.setUrl(audioUrl);
      }
      await _player.play();
    }
  }

  String _formatTime(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inMinutes)}:${two(d.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.black,
          title: const Text('Radio Player', style: TextStyle(color: Colors.white),)),
      body: Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width/1,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/RADIOPAGE.png"),
    fit: BoxFit.cover,
    ),),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 320,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
              //   const Icon(Icons.music_note, size: 50),
                  Row(
                    children: [
                      _isLoading
                          ? SizedBox(
                        height:20,
                          width: 20,
                          child: const CircularProgressIndicator())
                          : IconButton(
                        iconSize: 30,
                        icon: Icon(
                          _player.playing
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_fill,
                        ),
                        onPressed: _playPause,
                      ),
                      Text(_formatTime(_position),style: TextStyle(fontSize: 10),),
                      //Text(_formatTime(_duration)),
                      Slider(
                        min: 0,
                        max: _duration.inSeconds.toDouble(),
                        value: _position.inSeconds
                            .clamp(0, _duration.inSeconds)
                            .toDouble(),
                        onChanged: (value) {
                          _player.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ],
                  ),



                 // const SizedBox(height: 20),


                ],
              ),
            ),
        SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}

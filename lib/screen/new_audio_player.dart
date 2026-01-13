// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
//
// class AudioPlayerScreen extends StatefulWidget {
//   const AudioPlayerScreen({super.key});
//
//   @override
//   State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
// }
//
// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
//   final AudioPlayer _player = AudioPlayer();
//   bool isPlaying = false;
//
//   final String audioUrl =
//       "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
//
//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }
//
//   Future<void> playAudio() async {
//     await _player.setUrl(audioUrl);
//     _player.play();
//     setState(() => isPlaying = true);
//   }
//
//   Future<void> stopAudio() async {
//     await _player.stop();
//     setState(() => isPlaying = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("MP3 Player")),
//       body: Center(
//         child: ElevatedButton.icon(
//           icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
//           label: Text(isPlaying ? "Stop" : "Play"),
//           onPressed: () {
//             isPlaying ? stopAudio() : playAudio();
//           },
//         ),
//       ),
//     );
//   }
// }
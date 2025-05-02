// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YouTubePlaylistScreen extends StatefulWidget {
//   final List<String> videoIds;

//   const YouTubePlaylistScreen({Key? key, required this.videoIds})
//       : super(key: key);

//   @override
//   _YouTubePlaylistScreenState createState() => _YouTubePlaylistScreenState();
// }

// class _YouTubePlaylistScreenState extends State<YouTubePlaylistScreen> {
//   late YoutubePlayerController _controller;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadVideo(widget.videoIds[_currentIndex]);
//   }

//   void _loadVideo(String videoId) {
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     )..addListener(_listener);
//   }

//   void _listener() {
//     if (_controller.value.playerState == PlayerState.ended) {
//       _playNextVideo();
//     }
//   }

//   void _playNextVideo() {
//     if (_currentIndex < widget.videoIds.length - 1) {
//       setState(() {
//         _currentIndex++;
//         _loadVideo(widget.videoIds[_currentIndex]);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: Colors.amber,
//         progressColors: const ProgressBarColors(
//           playedColor: Colors.amber,
//           handleColor: Colors.amberAccent,
//         ),
//       ),
//       builder: (context, player) {
//         return Column(
//           children: [
//             player,
//             ElevatedButton(
//               onPressed: _playNextVideo,
//               child: const Text('Next Video'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

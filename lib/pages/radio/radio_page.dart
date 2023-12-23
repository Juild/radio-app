import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key, required this.title});
  final String title;

  @override
  State<RadioPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RadioPage> {
  bool isPlaying = false;
  final player = AudioPlayer();
  void _incrementCounter() async {
    if (isPlaying) {
      await player.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      if (player.source != null) {
        await player.resume();
        setState(() {
          isPlaying = true;
        });
        return;
      }
      await player.play(UrlSource("https://80sexitos.stream.laut.fm/80sexitos"));
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/pages/home/widgets/radio_image.dart';

@RoutePage()
class RadioPage extends StatefulWidget {
  final String url;
  final String title;
  final RadioDecorationImage image;
  final Color backGroundcolor;
  const RadioPage(
      {super.key, required this.url, required this.title, required this.image, required this.backGroundcolor});

  @override
  State<RadioPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RadioPage> {
  bool isPlaying = false;
  final player = AudioPlayer();
  void _playRadio() async {
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
      await player.play(UrlSource(widget.url));
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        player.stop();
        player.dispose();
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [widget.backGroundcolor, Colors.black], // Replace with your desired colors
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.image,
              Center(
                child: FloatingActionButton(
                  onPressed: _playRadio,
                  tooltip: 'Increment',
                  child: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

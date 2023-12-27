import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

@RoutePage()
class RadioPage extends StatefulWidget {
  final String url;
  final String title;
  final String faviconUrl;
  final Color gradientColor;
  final ImageProvider image;
  final fallbackImage = const Svg('assets/placeholder_radio.svg');
  const RadioPage({
    super.key,
    required this.url,
    required this.title,
    required this.gradientColor,
    required this.faviconUrl,
    required this.image,
  });

  @override
  State<RadioPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RadioPage> {
  bool isPlaying = false;
  bool errorOnFetchImage = false;

  final player = AudioPlayer();

  bool connecting = false;

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
      setState(() {
        connecting = true;
      });
      await player.play(UrlSource(widget.url));
      setState(() {
        connecting = false;
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
            colors: [widget.gradientColor, Colors.black], // Replace with your desired colors
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.router.pop();
              },
            ),
            title: Text(widget.title),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.gradientColor,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: widget.image),
                ),
                width: 300,
                height: 300,
              ),
              Center(
                child: FloatingActionButton(
                  onPressed: _playRadio,
                  child: () {
                    if (isPlaying) {
                      return const Icon(Icons.pause);
                    } else if (!isPlaying && connecting) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Icon(Icons.play_arrow);
                    }
                  }(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

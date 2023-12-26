import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class RadioDecorationImage extends StatefulWidget {
  final String url;
  final Color color;
  final fallbackImage = const Svg('assets/placeholder_radio.svg');
  const RadioDecorationImage({super.key, required this.url, required this.color});
  @override
  State<StatefulWidget> createState() => RadioDecorationImageState();
}

class RadioDecorationImageState extends State<RadioDecorationImage> {
  bool errorOnFetchImage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(16),
        image: widget.url == '' || errorOnFetchImage == true
            ? DecorationImage(image: widget.fallbackImage)
            : DecorationImage(
                image: FadeInImage(
                  image: NetworkImage(widget.url),
                  placeholder: widget.fallbackImage,
                ).image,
                fit: BoxFit.contain,
                onError: (exception, stackTrace) => setState(() => errorOnFetchImage = true),
              ),
      ),
      width: 300,
      height: 300,
    );
  }
}

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../router/router.dart';
import '../bloc/home_bloc.dart';

class RadioDecorationImage extends StatefulWidget {
  final String faviconUrl;
  final int idx;
  final FixedExtentScrollController controller;
  final String name;

  final String url;
  const RadioDecorationImage(
      {super.key,
      required this.faviconUrl,
      required this.idx,
      required this.controller,
      required this.name,
      required this.url});
  @override
  State<StatefulWidget> createState() => RadioDecorationImageState();
}

class RadioDecorationImageState extends State<RadioDecorationImage> {
  final ImageProvider fallbackImage = const Svg('assets/placeholder_radio.svg');
  bool errorOnFetchImage = false;
  late HomeBloc bloc;
  Color stateColor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  NetworkImage? networkImage;

  @override
  void initState() {
    super.initState();
    final currentBloc = BlocProvider.of<HomeBloc>(context);
    widget.controller.addListener(() {
      if (widget.controller.selectedItem == widget.idx) {
        if (stateColor != currentBloc.state.gradientColor) {
          currentBloc.add(ColorLoaded(stateColor));
        }
      }
    });

    if (widget.faviconUrl != '') {
      final networkImage = NetworkImage(widget.faviconUrl);
      this.networkImage = networkImage;
      networkImage.resolve(ImageConfiguration.empty).addListener(ImageStreamListener(
            (image, synchronousCall) async {
              final paletteGenerator = await PaletteGenerator.fromImage(image.image);
              final color = paletteGenerator.colors.first;
              currentBloc.add(ColorLoaded(color));
              setState(() {
                stateColor = color;
              });
            },
            onError: (exception, stackTrace) {
              setState(() {
                errorOnFetchImage = true;
              });
            },
          ));
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          RadioRoute(
            url: widget.url,
            title: widget.name,
            faviconUrl: widget.faviconUrl,
            gradientColor: stateColor,
            image: networkImage ?? fallbackImage,
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: stateColor,
          borderRadius: BorderRadius.circular(16),
          image: widget.faviconUrl == '' || errorOnFetchImage == true
              ? DecorationImage(image: fallbackImage)
              : DecorationImage(
                  image: FadeInImage(
                    image: networkImage!,
                    placeholder: fallbackImage,
                  ).image,
                  fit: BoxFit.contain,
                ),
        ),
        width: 300,
        height: 300,
      ),
    );
  }
}

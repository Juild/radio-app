import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:radio_app/common/models/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  double _height = 10.0;
  Color _beginColor = Colors.red;
  List<Color> _colors = [];
  final _controller = FixedExtentScrollController();
  final random = Random();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_setBackgroundColor);
  }

  @override
  void dispose() {
    _controller.removeListener(_setBackgroundColor);
    super.dispose();
  }

  void _blocListener(BuildContext context, HomeState state) {
    if (state.status == Status.loaded) {
      setState(() {
        _colors = state.colors;
        _height = 500;
      });
    } else {
      setState(() {
        _height = 10;
      });
    }
  }

  void _setBackgroundColor() {
    setState(() {
      _beginColor = _colors[_controller.selectedItem];
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentBloc = context.read<HomeBloc>();
    return BlocListener<HomeBloc, HomeState>(
      listener: _blocListener,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_beginColor, Colors.black], // Replace with your desired colors
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Streaming radio'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: DropdownMenu<Country>(
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          hintText: 'Select a country',
                          menuHeight: 240,
                          menuStyle: const MenuStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                            surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.vertical(top: Radius.circular(8), bottom: Radius.circular(8)),
                              ),
                            ),
                          ),
                          dropdownMenuEntries: Country.values
                              .map(
                                (country) => DropdownMenuEntry<Country>(
                                    value: country,
                                    label: country.toStringX(),
                                    style: const ButtonStyle(
                                        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 14)))),
                              )
                              .toList(),
                          onSelected: (selectedCountry) => currentBloc.add(CountrySelected(country: selectedCountry!)),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: _height,
                        width: 300,
                        child: ListWheelScrollView(
                          squeeze: 1.5,
                          controller: _controller,
                          itemExtent: 100,
                          diameterRatio: 1,
                          children: state.radios
                              .asMap()
                              .entries
                              .map((entry) => Container(
                                    decoration: BoxDecoration(
                                      color: _colors[entry.key],
                                      borderRadius: BorderRadius.circular(16),
                                      image: entry.value.favicon == ''
                                          ? const DecorationImage(image: Svg('assets/placeholder_radio.svg'))
                                          : DecorationImage(
                                              image: NetworkImage(entry.value.favicon),
                                              fit: BoxFit.contain,
                                              onError: (exception, stackTrace) => print(exception.toString())),
                                    ),
                                    width: 300,
                                    height: 300,
                                  ))
                              .toList(),
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        state.status == Status.loaded ? state.radios[_controller.selectedItem].name : '',
                        style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: state.status == Status.loaded ? 'Music Style: ' : '',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          children: [
                            TextSpan(
                              text: state.status == Status.loaded
                                  ? state.radios[_controller.selectedItem].tags.map((e) => '#$e').join(' ')
                                  : '',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

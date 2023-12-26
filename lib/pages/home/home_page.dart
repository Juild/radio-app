import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/common/models/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/router/router.dart';
import 'bloc/home_bloc.dart';
import 'widgets/radio_image.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

@RoutePage()
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

class _HomePageState extends State<_HomePage> with SingleTickerProviderStateMixin {
  double _height = 10.0;
  Color _beginColor = Colors.red;
  List<Color> _colors = [];
  final _controller = FixedExtentScrollController();
  final random = Random();
  final textEditingController = TextEditingController();

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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: DropdownButton<Country>(
                            underline: const SizedBox(),
                            borderRadius: BorderRadius.circular(8),
                            hint: const Text('Select a country'),
                            menuMaxHeight: 240,
                            items: Country.values
                                .map(
                                  (country) => DropdownMenuItem<Country>(
                                    value: country,
                                    child: Text(country.toStringX()),
                                  ),
                                )
                                .toList(),
                            onChanged: (selectedCountry) => currentBloc.add(CountrySelected(country: selectedCountry!)),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: _height,
                        child: ListWheelScrollView(
                          squeeze: 1,
                          controller: _controller,
                          itemExtent: 100,
                          diameterRatio: 1.5,
                          children: state.radios
                              .asMap()
                              .entries
                              .map(
                                (entry) => InkWell(
                                  onTap: () {
                                    print('test');
                                    context.router.push(RadioRoute(
                                        backGroundcolor: _colors[entry.key],
                                        title: entry.value.name,
                                        url: entry.value.url,
                                        image: RadioDecorationImage(
                                          url: entry.value.favicon,
                                          color: _colors[entry.key],
                                        )));
                                  },
                                  child: RadioDecorationImage(
                                    url: entry.value.favicon,
                                    color: _colors[entry.key],
                                  ),
                                ),
                              )
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

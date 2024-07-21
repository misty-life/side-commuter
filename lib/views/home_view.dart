import 'package:commuter/base/widgets/weather_widget.dart';
import 'package:commuter/routes.dart';
import 'package:commuter/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    viewModel = HomeViewModel();
    viewModel.addListener(onViewModelChanged);
    viewModel.getCurrentWeather();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.removeListener(onViewModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            viewModel.isLoading
            ? const Text("로딩 중 ...")
            : WeatherHome(
                context: context,
                weatherModel: viewModel.currentWeather,
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.NEWS_VIEW),
                  child: const Text("헤드 라인 뉴스"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.MUSIC_RECOMMENDATION_VIEW),
                  child: const Text("노래 추천"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
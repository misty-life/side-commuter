import 'package:commuter/view_models/music_recommendation_view_model.dart';
import 'package:flutter/material.dart';

class MusicRecommendationView extends StatefulWidget {
  const MusicRecommendationView({super.key});

  @override
  State<MusicRecommendationView> createState() => _MusicRecommendationViewState();
}

class _MusicRecommendationViewState extends State<MusicRecommendationView> {
  late MusicRecommendationViewModel viewModel;

  onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    viewModel = MusicRecommendationViewModel();
    viewModel.addListener(onViewModelChanged);
    viewModel.requestAuth();
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
      appBar: AppBar(title: const Text("Music Recommendation")),
      body: Column(
        children: [
          viewModel.isLoading
            ? const Text("로딩 중 ...")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: viewModel.tracks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Image.network(viewModel.tracks[index].imageUrl),
                        Text(viewModel.tracks[index].trackName),
                        Text(viewModel.tracks[index].artist),
                      ],
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }
}
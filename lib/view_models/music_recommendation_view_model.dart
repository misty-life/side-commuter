// ignore_for_file: prefer_final_fields

import 'package:commuter/models.dart/track_model.dart';
import 'package:commuter/repositories/music_recommendation_repository.dart';
import 'package:flutter/foundation.dart';

class MusicRecommendationViewModel extends ChangeNotifier {
  MusicRecommendationRepository _repository = MusicRecommendationRepository();
  late String accessToken;

  List<Track> tracks = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  requestAuth() async {
    setLoading(true);
    tracks = await _repository.getTopTracks();
    setLoading(false);
  }
}
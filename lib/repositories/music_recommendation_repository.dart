import 'package:commuter/data_sources/remote_data_source.dart';
import 'package:commuter/models.dart/track_model.dart';

class MusicRecommendationRepository {
  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<List<Track>> getTopTracks() async {
    List<Track> topTracks = await remoteDataSource.getTopTracksFromLastFM();
    return topTracks;
  }
}
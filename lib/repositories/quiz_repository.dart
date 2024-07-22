// ignore_for_file: prefer_final_fields

import 'package:commuter/data_sources/remote_data_source.dart';
import 'package:commuter/models.dart/quiz_model.dart';

class QuizRepository {
  RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<Quiz>> getRandomQuiz() async {
    List<Quiz> randomQuizList = await _remoteDataSource.getRandomQuiz();
    return randomQuizList;
  }
}
// ignore_for_file: prefer_final_fields

import 'package:commuter/models.dart/quiz_model.dart';
import 'package:commuter/repositories/quiz_repository.dart';
import 'package:flutter/material.dart';

class QuizViewModel extends ChangeNotifier {
  final QuizRepository _quizRepository = QuizRepository();

  List<Quiz> quizList = <Quiz>[];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  getRandomQuiez() async {
    setLoading(true);
    quizList = await _quizRepository.getRandomQuiz();
    setLoading(false);
  }
}
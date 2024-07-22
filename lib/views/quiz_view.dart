import 'package:commuter/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  late QuizViewModel viewModel;

  onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    viewModel = QuizViewModel();
    viewModel.getRandomQuiez();
    viewModel.addListener(onViewModelChanged);
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
      appBar: AppBar(title: const Text("Quiz")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewModel.isLoading
            ? const Text("로딩 중 ...")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: viewModel.quizList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            viewModel.quizList[index].question,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(viewModel.quizList[index].category),
                              const SizedBox(width: 10),
                              Text(viewModel.quizList[index].difficulty),
                            ],
                          ),

                          for (int i = 0; i < viewModel.quizList[index].answers.length && viewModel.quizList[index].answers[i] != null; ++i)
                            Text("${i+1} ${viewModel.quizList[index].answers[i]}"),
                        ],
                      ),
                    );
                  },
                ),
            ),
        ],
      ),
    );
  }
}
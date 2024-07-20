import 'package:commuter/base/utilities/news_utility.dart';
import 'package:commuter/base/widgets/news_widget.dart';
import 'package:commuter/view_models/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late NewsViewModel viewModel;

  onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    viewModel = NewsViewModel();
    viewModel.addListener(onViewModelChanged);
    viewModel.getTopHeadLinesByCountry(viewModel.countries.first);
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
      appBar: AppBar(title: const Text("News")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Buttons for Selecting Country
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < viewModel.countries.length; ++i)
                    Container(
                      margin: i < viewModel.countries.length - 1 ? const EdgeInsets.only(right: 10) : null,
                      child: OutlinedButton(
                        onPressed: () => viewModel.getTopHeadLinesByCountry(viewModel.countries[i]),
                        style: const ButtonStyle(
                          side: WidgetStatePropertyAll(BorderSide(color: Colors.deepPurple)),
                        ),
                        child: Text(
                          "${getCountryNameFromCode(viewModel.countries[i])} 헤드 라인 뉴스",
                          style: viewModel.currentCountryIndex == i
                            ? const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              )
                            : null,
                        ),
                      ),
                    ),
                ],
              ),
              
              viewModel.isLoading
                ? const Text("로딩 중 ...")
                : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: viewModel.newsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                        onTap: () => launchUrl(Uri.parse(viewModel.newsList[index].url)),
                        urlToImage: viewModel.newsList[index].urlToImage,
                        title: viewModel.newsList[index].title,
                        description: viewModel.newsList[index].description,
                      );
                    }
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
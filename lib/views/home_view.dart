import 'package:commuter/routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.NEWS_VIEW),
              child: const Text("헤드 라인 뉴스"),
            ),
          ],
        ),
      ),
    );
  }
}
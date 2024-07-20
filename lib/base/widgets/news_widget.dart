// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget NewsCard({
  VoidCallback? onTap,
  String? urlToImage,
  required String title,
  String? description,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          if (urlToImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(urlToImage),
            ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description ?? "",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      )
    ),
  );
}

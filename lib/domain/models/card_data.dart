import 'package:flutter/material.dart';

class CardData {
  final String text;
  final String descriptionText;
  final String price;
  final IconData icon;
  final String imagePath;

  const CardData({
    required this.text,
    required this.descriptionText,
    required this.price,
    required this.imagePath,
    this.icon = Icons.build_outlined,
  });
}

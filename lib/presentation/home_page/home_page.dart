import 'package:flutter/material.dart';

import '../../domain/models/card_data.dart';
import '../details_page/details_page.dart';
import 'card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<CardData> products = [
    CardData(
      text: 'Топор',
      descriptionText:
          'Прочный плотницкий топор с удобной рукояткой. Подходит для работы с древесиной.',
      price: '1 290 ₽',
      imagePath: 'assets/images/axe.jpg',
      icon: Icons.hardware,
    ),
    CardData(
      text: 'Молоток',
      descriptionText:
          'Универсальный молоток для домашних и строительных работ.',
      price: '750 ₽',
      imagePath: 'assets/images/hammer.jpg',
      icon: Icons.handyman_outlined,
    ),
    CardData(
      text: 'Ножовка',
      descriptionText:
          'Ручная ножовка с прочным полотном для распила деревянных заготовок.',
      price: '990 ₽',
      imagePath: 'assets/images/saw.jpg',
      icon: Icons.content_cut,
    ),
  ];

  void showLikeMessage(BuildContext context, String title, bool isLiked) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            isLiked
                ? 'Товар «$title» добавлен в избранное'
                : 'Товар «$title» удалён из избранного',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  void openDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DetailsPage(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Строительный магазин'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: products.map((data) {
          return ProductCard(
            data: data,
            onLike: (title, isLiked) {
              showLikeMessage(context, title, isLiked);
            },
            onTap: () => openDetails(context, data),
          );
        }).toList(),
      ),
    );
  }
}

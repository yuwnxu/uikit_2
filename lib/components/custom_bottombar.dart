import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';
import '../logg.dart';

// Универсальная нижняя панель
// Автор создания: 1
// Дата создания: 09.10.2026

class CustomBottombar extends StatefulWidget {
  final VoidCallback onTap1; // Действие при нажатии на кнопку слева
  final VoidCallback onTap2; // Действие при нажатии на кнопку справа

  const CustomBottombar({super.key, required this.onTap1, required this.onTap2});

  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomBottombar', 'Создание', 'Нижняя панель создана');
  }

  @override
  void dispose() {
    Logging().info('CustomBottombar', 'Уничтожение', 'Нижняя панель уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: po(b: 15.5, t: 15.5, l: 72.11, r: 43.89),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, -4))],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Logging().info('CustomBottombar', 'Нажатие', 'Произошло нажатие на кнопку');
              widget.onTap1();
            },
            child: Container(
              padding: ps(h: 24.fw, v: 4.fh),
              decoration: BoxDecoration(color: white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/scan.png', width: 18.fw, height: 18.fh),
                  Text('Сохранить', style: bodySmall.copyWith(color: secondary)),
                ],
              ),
            ),
          ),
          SizedBox(width: 32.fw),
          GestureDetector(
            onTap: () {
              Logging().info('CustomBottombar', 'Нажатие', 'Произошло нажатие на кнопку');
              widget.onTap2();
            },
            child: Container(
              padding: ps(h: 40.fw, v: 8.fh),
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bigRight.png', width: 16.fw, height: 16.fh, color: white),
                  Text('Продолжить', style: bodySmall.copyWith(color: white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

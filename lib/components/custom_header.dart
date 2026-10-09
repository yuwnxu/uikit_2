import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Главная верхняя панель
// Автор создания: 1
// Дата создания: 08.10.2026

class CustomHeader extends StatefulWidget {
  final String? icon; // Путь к иконке слева
  final String label; // Заголовок
  final Widget? avatar; // Аватарка справа
  final VoidCallback? onIconTap; // Нажатие на иконку
  final double width; // Ширина иконки
  final double height; // Длина иконки

  const CustomHeader({super.key, required this.label, this.avatar, this.onIconTap, required this.width, required this.height, this.icon});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomHeader', 'Создание', 'Главная верхняя панель создана');
  }

  @override
  void dispose() {
    Logging().info('CustomHeader', 'Уничтожение', 'Верхняя панель уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ps(h: 20.fw, v: 12.fh),
      decoration: BoxDecoration(
        color: white,
        border: Border(bottom: BorderSide(color: darkenWhite, width: 1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4), spreadRadius: 0)],
      ),
      child: Row(
        children: [
          if (widget.icon != null)
            GestureDetector(
              onTap: () {
                Logging().info('CustomHeader', 'Нажатие', 'Произошло нажатие на иконку');
                widget.onIconTap?.call();
              },
              child: Image.asset(widget.icon!, width: widget.width.fw, height: widget.height.fh),
            ),
          SizedBox(width: 12.fw),
          Expanded(
            child: Text(widget.label, style: subHeader.copyWith(fontSize: 18, fontWeight: .w700)),
          ),
          if (widget.avatar != null) ...[SizedBox(width: 12.fw), widget.avatar!],
        ],
      ),
    );
  }
}

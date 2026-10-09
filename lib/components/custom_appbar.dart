import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Универсальная верхняя панель
// Автор создания: 1
// Дата создания: 08.10.2026

class CustomAppbar extends StatefulWidget {
  final String label; // Заголовок
  final VoidCallback? tapLeft; // Нажатие на иконку слева
  final VoidCallback? tapRight; // Нажатие на иконку справа
  final BorderRadius? borderRadius; // Радиус скругления

  const CustomAppbar({super.key, required this.label, this.tapLeft, this.tapRight, this.borderRadius});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomAppbar', 'Создание', 'Универсальная верхняя панель создана');
  }

  @override
  void dispose() {
    Logging().info('CustomAppbar', 'Уничтожение', 'Универсальная верхняя панель уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: pa(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: widget.borderRadius,
        border: Border(bottom: BorderSide(color: darkenWhite, width: 1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: Offset(0, 1), spreadRadius: 0)],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Logging().info('CustomAppbar', 'Нажатие', 'Произошло нажатие на иконку слева');
              widget.tapLeft?.call();
            },
            child: Image.asset('assets/left.png', width: 16.fw, height: 16.fh),
          ),
          SizedBox(width: 16.fw),
          Expanded(
            child: Text(widget.label, style: subHeader.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          GestureDetector(
            onTap: () {
              Logging().info('CustomAppbar', 'Нажатие', 'Произошло нажатие на иконку справа');
              widget.tapRight?.call();
            },
            child: Image.asset('assets/sideIcon.png', width: 4.fw, height: 16.fh),
          ),
        ],
      ),
    );
  }
}

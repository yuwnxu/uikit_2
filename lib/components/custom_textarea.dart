import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';
import '../logg.dart';

// Универсально поле ввода текста
// Автор создания: 1
// Дата создания: 08.10.2026

class CustomTextarea extends StatefulWidget {
  final String hint; // Текст подсказка
  final double? height; // Высота
  final TextEditingController? controller; // Контроллер

  const CustomTextarea({super.key, required this.hint, this.height, this.controller});

  @override
  State<CustomTextarea> createState() => _CustomTextareaState();
}

class _CustomTextareaState extends State<CustomTextarea> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomTextarea', 'Создание', 'Универсально поле ввода текста создано');
  }

  @override
  void dispose() {
    Logging().info('CustomTextarea', 'Уничтожение', 'Универсально поле ввода текста уничтожено');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.fw,
      height: widget.height?.fh,
      padding: pa(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
      ),
      child: TextField(
        controller: widget.controller,
        maxLines: null,
        style: bodyMedium.copyWith(color: black),
        onTap: () {
          Logging().info('CustomTextarea', 'Нажатие', 'Пользователь нажал на поле');
        },
        onSubmitted: (value) {
          Logging().info('CustomTextarea', 'Ввод', 'Пользователь ввёл: $value');
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: bodyMedium.copyWith(color: secondary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
      ),
    );
  }
}

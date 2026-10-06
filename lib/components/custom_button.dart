import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:flutter/material.dart';
import '../typography.dart';

// Основные кнопки
// Автор создания: 1
// Дата создания: 06.10.2026
class CustomButton extends StatefulWidget {
  final Color fillcolor; // Цвет фона
  final Color bordercolor; // Цвет границ
  final Color textcolor; // Цвет текста
  final String text; // Текст
  final double width; // Ширина кнопки
  final double height; // Высота кнопки
  final VoidCallback? onTap; // Действие при нажатии
  final bool isDisabled; // Отключена ли кнопка

  const CustomButton({super.key, required this.fillcolor, required this.bordercolor, required this.textcolor, required this.text, required this.width, required this.height, this.onTap, this.isDisabled = false});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomButton', 'Создание', 'Кнопка создана');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.isDisabled
            ? null
            : () {
                Logging().info('CustomButton', 'Нажатие', 'Произошло нажатие на кнопку');
                widget.onTap?.call();
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.fillcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8.r),
            side: BorderSide(color: widget.bordercolor, width: 2),
          ),
        ),
        child: Text(widget.text, style: bodyMedium.copyWith(color: widget.textcolor)),
      ),
    );
  }
}

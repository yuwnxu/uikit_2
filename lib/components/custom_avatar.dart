import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/typography.dart';

// Универсальная аватарка
// Автор создания: 1
// Дата создания: 07.10.2026

class CustomAvatar extends StatefulWidget {
  final String? photo; // Путь к фото
  final String initials; // Инициалы
  final double size; // Диаметр аватарки
  final Color borderColor; // Цвет обводки
  final Color fillcolor; // Цвет фона
  final String? label; // Подпись снизу аватарки
  final TextStyle? initialsStyle; // Стиль текста инициалов

  const CustomAvatar({super.key, this.photo, required this.initials, required this.size, required this.borderColor, required this.fillcolor, this.label, this.initialsStyle});

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomAvatar', 'Создание', 'Аватарка создана');
  }

  @override
  void dispose() {
    Logging().info('CustomAvatar', 'Уничтожение', 'Аватарка уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasPhoto = widget.photo != null;

    return Column(
      children: [
        Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: widget.borderColor, width: 2),
          ),
          child: CircleAvatar(
            radius: widget.size / 2,
            backgroundColor: widget.fillcolor,
            backgroundImage: hasPhoto ? AssetImage(widget.photo!) : null,
            child: hasPhoto ? null : Text(widget.initials, style: widget.initialsStyle),
          ),
        ),
        SizedBox(height: 8.fh),
        if (widget.label != null) Text(widget.label!, style: bodyMedium),
      ],
    );
  }
}

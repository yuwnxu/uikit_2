import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

import '../logg.dart';

// Прогресс-бар с шагами
// Автор создания: 1
// Дата создания: 08.10.2026

class CustomProgressBar extends StatefulWidget {
  final String text; // Текст над полосками
  final int currentStep; // Текущий шаг

  const CustomProgressBar({super.key, required this.text, required this.currentStep});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomProgressBar', 'Создание', 'Прогресс-бар создан, шаг: ${widget.currentStep}');
  }

  @override
  void dispose() {
    Logging().info('CustomProgressBar', 'Уничтожение', 'Прогресс-бар уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$widget.text (Шаг $widget.currentStep из 3)', style: bodySmall.copyWith(color: black)),
        SizedBox(height: 8.fh),
        Row(
          children: [
            for (int i = 1; i <= 3; i++) ...[
              Expanded(
                child: Container(
                  height: 8.fh,
                  decoration: BoxDecoration(
                    color: i < widget.currentStep
                        ? primary
                        : i == widget.currentStep
                        ? secondary
                        : grey,
                    borderRadius: BorderRadius.circular(9999.r),
                  ),
                ),
              ),
              if (i != 3) SizedBox(width: 4.fw),
            ],
          ],
        ),
      ],
    );
  }
}

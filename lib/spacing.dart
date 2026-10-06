import 'package:flutter/material.dart';
import 'package:vize/vize.dart';

// Добавление отступов в виде констант
// Автор создания: 1
// Дата создания: 06.10.2026
class Spacing {
  static const spacing4 = 4;
  static const spacing8 = 8;
  static const spacing12 = 12;
  static const spacing16 = 16;
  static const spacing20 = 20;
  static const spacing32 = 32;

  // Создание отступов
  // Автор создания: 1
  // Дата создания: 06.10.2026
  // Входные параметры: значение высоты и ширины
  // Возращаемые данные: отступ с констаными значениями
  SizedBox getSpacing(int valueHeight, int valueWidth) {
    return SizedBox(height: valueHeight.fh, width: valueWidth.fw);
  }
}

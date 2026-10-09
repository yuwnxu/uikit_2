import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';
import '../logg.dart';

// Кастомное выпадающее сообщение
// Автор создания: 1
// Дата создания: 08.10.2026

SnackBar customSnackbar() {
  Logging().info('CustomSnackbar', 'Создание', 'Snackbar создан');

  return SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    duration: Duration(seconds: 3),
    content: Container(
      width: 350.fw,
      height: 72.fh,
      padding: po(l: 16, t: 16, b: 16, r: 24),
      decoration: BoxDecoration(color: black, borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        children: [
          Image.asset('assets/checkCircle.png', width: 20.fw, height: 20.fh),
          SizedBox(width: 8.fw),
          Expanded(
            child: Text('Candidate card successfully\nremoved from the board', style: bodySmall.copyWith(color: white)),
          ),
          SizedBox(width: 40.fw),
          GestureDetector(
            onTap: () {
              Logging().info('CustomSnackbar', 'Нажатие', 'Произошло нажатие на кнопку UNDO');
            },
            child: Text(
              'UNDO',
              style: fieldLabel.copyWith(color: grey, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  );
}

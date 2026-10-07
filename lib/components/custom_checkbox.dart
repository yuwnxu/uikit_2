import 'package:flutter/material.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/logg.dart';
import 'package:uikit_2/typography.dart';
import 'package:vize/vize.dart';

// Универсальный чекбокс
// Автор создания: 1
// Дата создания: 06.10.2026

enum CheckboxState { checked, unchecked, disabled }

class CustomCheckbox extends StatefulWidget {
  final String label; // Заголовок
  final bool value; // Текущее состояние
  final ValueChanged<bool>? onChanged; // Колбэк при изменении
  final bool isDisabled; // Отключен ли чекбокс

  const CustomCheckbox({super.key, required this.label, required this.value, this.onChanged, this.isDisabled = false});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isTap = false;

  @override
  void initState() {
    super.initState();
    _isTap = widget.value;
    Logging().info('CustomCheckbox', 'Создание', 'Чекбокс создан');
  }

  @override
  void dispose() {
    Logging().info('CustomCheckbox', 'Уничтожение', 'Чекбокс уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color fillcolor;
    final Color bordercolor;
    final Color labelcolor;
    final bool showicon;

    if (widget.isDisabled) {
      // disabled
      fillcolor = darkenWhite;
      bordercolor = grey;
      labelcolor = black;
      showicon = false;
    } else if (_isTap == true) {
      // checked
      fillcolor = primary;
      bordercolor = primary;
      labelcolor = black;
      showicon = true;
    } else {
      // unchecked
      fillcolor = white;
      bordercolor = secondary;
      labelcolor = black;
      showicon = false;
    }

    return GestureDetector(
      onTap: widget.isDisabled
          ? null
          : () {
              Logging().info('CustomCheckbox', 'Нажатие', 'Произошло нажатие на чекбокс');
              if (widget.isDisabled == false) {
                setState(() {
                  _isTap = !_isTap;
                });
                widget.onChanged?.call(_isTap);
              }
            },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Container(
            width: 24.fw,
            height: 24.fh,
            decoration: BoxDecoration(
              color: fillcolor,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: bordercolor, width: 2),
            ),
            child: showicon
                ? Center(
                    child: Image.asset('assets/check.png', width: 9.51.fw, height: 7.01.fh),
                  )
                : null,
          ),
          SizedBox(width: 16.fw),
          Text(widget.label, style: bodyMedium.copyWith(color: labelcolor)),
        ],
      ),
    );
  }
}

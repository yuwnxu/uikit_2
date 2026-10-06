import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:uikit_2/typography.dart';
import 'package:vize/vize.dart';

import '../color.dart';

// Основные текстовые поля
// Автор создания: 1
// Дата создания: 06.10.2026

// Состояние поля
enum TextFieldState { normal, focused, error, disabled }

// Тип поля
enum TextFieldType { normal, password, search }

class CustomTextField extends StatefulWidget {
  final String label; // Заголовок
  final String hint; // Тект-подсказка
  final TextFieldState state; // Состояние поля
  final TextFieldType type; // Тип поля
  final String? errortext; // Текст ошибки
  final TextEditingController? controller; // Контроллер

  const CustomTextField({super.key, required this.label, required this.hint, this.state = TextFieldState.normal, this.type = TextFieldType.normal, this.errortext, this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obsecureText = true;

  @override
  void initState() {
    super.initState();
    Logging().info('CustomTextField', 'Создание', 'Поле создана');
  }

  @override
  void dispose() {
    Logging().info('CustomTextField', 'Уничтожение', 'Поле уничтожено');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = grey;
    Color labelColor = secondary;

    if (widget.state == TextFieldState.focused) {
      borderColor = primary;
      labelColor = primary;
    } else if (widget.state == TextFieldState.error) {
      borderColor = error;
      labelColor = error;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: fieldLabel.copyWith(color: labelColor)),
        SizedBox(height: 4.5.fh),
        SizedBox(
          width: 350.fw,
          child: TextField(
            controller: widget.controller,
            enabled: widget.state != TextFieldState.disabled,
            obscureText: widget.type == TextFieldType.password ? _obsecureText : false,
            style: bodyMedium,
            onTap: () {
              Logging().info('CustomTextField', 'Нажатие', 'Произошло нажатие на поле "${widget.label}"');
            },
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: bodyMedium.copyWith(color: secondary),

              prefixIcon: widget.type == TextFieldType.search ? Padding(padding: po(l: 17, r: 8), child: Image.asset('assets/search.png', width: 18, height: 18)) : null,
              prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),

              suffixIcon: widget.type == TextFieldType.password
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText = !_obsecureText;
                        });
                        Logging().info('CustomTextField', 'Нажатие', 'Произошло нажатие на иконку');
                      },
                      child: Padding(
                        padding: po(r: 18),
                        child: Image.asset('assets/eye.png', width: 22.fw, height: 15.fh),
                      ),
                    )
                  : null,
              suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              filled: true,
              fillColor: darkenWhite,
              contentPadding: ps(h: 16, v: 12),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              errorText: widget.state == TextFieldState.error ? widget.errortext : null,
              errorStyle: fieldLabel.copyWith(color: error),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'custom_modal.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Универсальный выпадающий список
// Автор создания: 1
// Дата создания: 07.10.2026
class CustomDropdown extends StatefulWidget {
  final String label; // Заголовок
  final String hint; // Текст-подсказка
  final List<String> items; // Список элементов
  final String selectedItem; // Выбранный элемент
  final ValueChanged<String?>? onChanged; // Колбэк при выборе

  const CustomDropdown({super.key, required this.label, required this.hint, required this.items, required this.selectedItem, this.onChanged});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomDropdown', 'Создание', 'Селект создан');
  }

  @override
  void dispose() {
    Logging().info('CustomDropdown', 'Уничтожение', 'Селект уничтожен');
    super.dispose();
  }

  void _openModal() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomModal(
        items: widget.items,
        initialValue: widget.selectedItem,
        onApply: (value) {
          widget.onChanged?.call(value);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: fieldLabel.copyWith(color: secondary)),
        SizedBox(height: 4.5.fh),
        GestureDetector(
          onTap: () {
            Logging().info('CustomSelect', 'Нажатие', 'Произошло нажатие на селект');
            _openModal();
          },
          child: Container(
            width: 350.fw,
            height: 48.fh,
            decoration: BoxDecoration(
              color: darkenWhite,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: grey, width: 1),
            ),
            child: Padding(
              padding: ps(h: 16, v: 11),
              child: Row(
                children: [
                  Text(widget.selectedItem, style: bodyMedium),
                  Spacer(),
                  Image.asset('assets/down.png', width: 12.fw, height: 7.4.fh),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

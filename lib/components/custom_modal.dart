import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Модальное окно выбора
// Автор создания: 1
// Дата создания: 07.10.2026
class CustomModal extends StatefulWidget {
  final List<String> items; // Список элементов
  final String initialValue; // Начальное значение
  final ValueChanged<String?>? onApply; // Колбэк при подтверждении

  const CustomModal({super.key, required this.items, required this.initialValue, this.onApply});

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    Logging().info('CustomModal', 'Создание', 'Модальное окно создано');
  }

  @override
  void dispose() {
    Logging().info('CustomModal', 'Уничтожение', 'Модальное окно уничтожена');
    super.dispose();
  }

  Widget _item(String item) {
    final isSelected = item == _selectedValue;

    return GestureDetector(
      onTap: () {
        Logging().info('CustomModal', 'Нажатие', 'Выбран пункт: $item');
        setState(() {
          _selectedValue = item;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Expanded(
            child: Text(item, style: bodyMedium.copyWith(color: isSelected ? primary : secondary)),
          ),
          Container(
            width: 24.fw,
            height: 24.fh,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? primary : secondary, width: 2),
            ),
            child: Center(
              child: isSelected
                  ? Container(
                      width: 12.fw,
                      height: 12.fh,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.fh),
            Container(
              width: 32.fw,
              height: 4.fh,
              decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(9999.r)),
            ),
            SizedBox(height: 16.fh),
            Padding(
              padding: ps(h: 32.fw),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Select Status', style: subHeader),
              ),
            ),
            SizedBox(height: 16.fh),
            Padding(
              padding: ps(h: 32),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.items.length,
                separatorBuilder: (context, index) => SizedBox(height: 40.fh),
                itemBuilder: (context, index) => _item(widget.items[index]),
              ),
            ),
            SizedBox(height: 32.fh),
            Divider(color: grey, thickness: 1, height: 1),
            SizedBox(height: 32.fh),
            Padding(
              padding: ps(h: 32),
              child: Row(
                children: [
                  SizedBox(
                    width: 155.fw,
                    height: 48.fh,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primary,
                        side: BorderSide(color: primary, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8.r)),
                      ),
                      child: Text('Отменить', style: bodyMedium.copyWith(color: primary)),
                    ),
                  ),
                  SizedBox(width: 16.fw),
                  SizedBox(
                    width: 155.fw,
                    height: 48.fh,
                    child: ElevatedButton(
                      onPressed: () => widget.onApply?.call(_selectedValue!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      ),
                      child: Text('Обновить', style: bodyMedium.copyWith(color: white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.fh),
          ],
        ),
      ),
    );
  }
}

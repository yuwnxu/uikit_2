import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';
import '../logg.dart';

// Универсальное поле навигации
// Автор создания: 1
// Дата создания: 09.10.2026

class CustomNavbar extends StatefulWidget {
  final String text1; // Текст под первой иконкой
  final String text2; // Текст под второй иконкой
  final String text3; // Текст под третьей иконкой
  final int currentPage; // Текущая страница
  final ValueChanged<int> onTap; // Действие при нажатии на кнопку

  const CustomNavbar({super.key, required this.text1, required this.text2, required this.text3, required this.currentPage, required this.onTap});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomNavbar', 'Создание', 'Универсальное поле навигации создано');
  }

  @override
  void dispose() {
    Logging().info('CustomNavbar', 'Уничтожение', 'Универсальное поле навигации уничтожено');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ps(v: 21.5, h: 48),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, -4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            icon: 'assets/bag.png',
            label: widget.text1,
            isActive: widget.currentPage == 0,
            onTap: () {
              Logging().info('CustomNavbar', 'Вкладка', 'Открыта $widget.text1');
              widget.onTap(0);
            },
          ),
          _buildItem(
            icon: 'assets/candidate.png',
            label: widget.text2,
            isActive: widget.currentPage == 1,
            onTap: () {
              Logging().info('CustomNavbar', 'Вкладка', 'Открыта $widget.text2');
              widget.onTap(1);
            },
          ),
          _buildItem(
            icon: 'assets/settings.png',
            label: widget.text3,
            isActive: widget.currentPage == 2,
            onTap: () {
              Logging().info('CustomNavbar', 'Вкладка', 'Открыта $widget.text3');
              widget.onTap(2);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required String icon, required String label, required bool isActive, required VoidCallback onTap}) {
    final Color color = isActive ? primary : secondary;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Image.asset(icon, width: 20.fw, height: 20.fh, color: color),
          Text(label, style: fieldLabel.copyWith(color: color)),
        ],
      ),
    );
  }
}

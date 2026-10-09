import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Карточка вакансии
// Автор создания: 1
// Дата создания: 07.10.2026

class VacancyCard extends StatefulWidget {
  final String title; // Название вакансии
  final String team; // Команда
  final String status; // Статус
  final String money; // Текст ЗП
  final String people; // Текст кол-во людей

  const VacancyCard({super.key, required this.title, required this.team, required this.status, required this.money, required this.people});

  @override
  State<VacancyCard> createState() => _VacancyCardState();
}

class _VacancyCardState extends State<VacancyCard> {
  @override
  void initState() {
    super.initState();
    Logging().info('VacancyCard', 'Создание', 'Карточка вакансии создана');
  }

  @override
  void dispose() {
    Logging().info('VacancyCard', 'Уничтожение', 'Карточка вакансии уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Padding(
        padding: pa(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: subHeader),
                      SizedBox(height: 4.fh),
                      Text(widget.team, style: bodySmall.copyWith(color: secondary)),
                    ],
                  ),
                ),
                Container(
                  width: 72.fw,
                  height: 24.fh,
                  decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(9999.r)),
                  child: Center(
                    child: Text(widget.status, style: fieldLabel.copyWith(color: secondary)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.fh),
            Divider(color: darkenWhite),
            SizedBox(height: 16.fh),
            Row(
              children: [
                Image.asset('assets/Container-4.png', width: 16.5.fw, height: 12.fh),
                SizedBox(width: 4.fw),
                Text(widget.money, style: bodySmall),
                SizedBox(width: 24.fw),
                Image.asset('assets/Icon.png', width: 18.fw, height: 9.fh),
                SizedBox(width: 4.fw),
                Text(widget.people, style: bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

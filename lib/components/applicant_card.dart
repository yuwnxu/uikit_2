import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';
import 'custom_avatar.dart';

// Карточка соискателя
// Автор создания: 1
// Дата создания: 07.10.2026

class ApplicantCard extends StatefulWidget {
  final String title; // Название вакансии
  final String team; // Команда
  final String fulltime; // Тип занятости
  final String money; // ЗП
  final String count; // Кол-во людей

  const ApplicantCard({super.key, required this.title, required this.team, required this.fulltime, required this.money, required this.count});

  @override
  State<ApplicantCard> createState() => _ApplicantCardState();
}

class _ApplicantCardState extends State<ApplicantCard> {
  @override
  void initState() {
    super.initState();
    Logging().info('ApplicantCard', 'Создание', 'Карточка соискателя создана');
  }

  @override
  void dispose() {
    Logging().info('ApplicantCard', 'Уничтожение', 'Карточка соискателя уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      padding: pa(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomAvatar(
                initials: 'PD',
                size: 48,
                borderColor: grey,
                fillcolor: grey,
                initialsStyle: TextStyle(fontSize: 16, color: primary),
              ),
              SizedBox(width: 16.fw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: bodyMedium),
                  SizedBox(height: 4.fh),
                  Row(
                    children: [
                      Image.asset('assets/team.png', width: 13.fw, height: 12.fh),
                      SizedBox(width: 4.fh),
                      Text(widget.team, style: bodySmall.copyWith(color: secondary)),
                      SizedBox(width: 18.fh),
                      Image.asset('assets/time.png', width: 13.fw, height: 13.fh),
                      SizedBox(width: 4.fh),
                      Text(widget.fulltime, style: bodySmall.copyWith(color: secondary)),
                    ],
                  ),
                  SizedBox(height: 4.fh),
                  Row(
                    children: [
                      Image.asset('assets/Container-4.png', width: 16.fw, height: 16.fh, color: black),
                      SizedBox(width: 4.fh),
                      Text(widget.money, style: fieldLabel),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.fh),
          Divider(color: grey),
          SizedBox(height: 16.fh),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 62.69.fw),
                      Text(widget.count, style: bodySmall.copyWith(color: primary, fontSize: 14)),
                    ],
                  ),
                  Text('APPLICANTS', style: bodySmall.copyWith(color: secondary)),
                ],
              ),
              Spacer(),
              Image.asset('assets/right.png', width: 7.4.fw, height: 12.fh),
            ],
          ),
        ],
      ),
    );
  }
}

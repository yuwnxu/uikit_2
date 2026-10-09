import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';
import 'custom_avatar.dart';

// Карточка интервью
// Автор создания: 1
// Дата создания: 07.10.2026

class HrCard extends StatefulWidget {
  final String photo; // Путь к фото профиля
  final String name; // Имя
  final String position; // Должность
  final String city; // Город
  final String phone; // Телефон
  final String status; // Статус

  const HrCard({super.key, required this.photo, required this.name, required this.position, required this.city, required this.phone, required this.status});

  @override
  State<HrCard> createState() => _HrCardState();
}

class _HrCardState extends State<HrCard> {
  @override
  void initState() {
    super.initState();
    Logging().info('HrCard', 'Создание', 'Карточка интервью создана');
  }

  @override
  void dispose() {
    Logging().info('HrCard', 'Уничтожение', 'Карточка интервью уничтожена');
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAvatar(photo: 'assets/Alexander.png', initials: '', size: 48, borderColor: grey, fillcolor: white),
              SizedBox(width: 16.fw),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.name, style: fieldLabel),
                        Spacer(),
                        Container(
                          padding: ps(h: 8, v: 4),
                          decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(4.r)),
                          child: Text(widget.status, style: fieldLabel.copyWith(color: darkenWhite)),
                        ),
                      ],
                    ),
                    Text(widget.position, style: bodySmall.copyWith(color: secondary)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.fh),
          Row(
            children: [
              Image.asset('assets/geo.png', width: 12.fw, height: 15.fh),
              SizedBox(width: 2.5.fw),
              Text(widget.city, style: bodySmall.copyWith(color: secondary)),
            ],
          ),
          SizedBox(height: 32.fh),
          Row(
            children: [
              Image.asset('assets/call.png', width: 13.5.fw, height: 13.5.fh),
              SizedBox(width: 3.25.fw),
              Text(widget.phone, style: bodySmall.copyWith(color: secondary)),
              SizedBox(width: 4.fw),
              Image.asset('assets/copy.png', width: 11.fw, height: 13.fh, color: primary),
            ],
          ),
        ],
      ),
    );
  }
}

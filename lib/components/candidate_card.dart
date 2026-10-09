import 'package:flutter/material.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Карточка кандидата
// Автор создания: 1
// Дата создания: 07.10.2026

class CandidateCard extends StatefulWidget {
  final String name; // Имя
  final String position; // Должность
  final String status; // Статус
  final String city; // Город
  final String experience; // Опыт
  final String period; // Период

  const CandidateCard({super.key, required this.name, required this.position, required this.status, required this.city, required this.experience, required this.period});

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  @override
  void initState() {
    super.initState();
    Logging().info('CandidateCard', 'Создание', 'Карточка кандидата создана');
  }

  @override
  void dispose() {
    Logging().info('CandidateCard', 'Уничтожение', 'Карточка кандидата уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      padding: pa(24),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name, style: screenHeader),
          SizedBox(height: 4.fh),
          Text(widget.position, style: bodyMedium.copyWith(color: secondary)),
          SizedBox(height: 16.fh),
          Row(
            children: [
              Container(
                padding: ps(h: 12, v: 6),
                decoration: BoxDecoration(color: darkenWhite, borderRadius: BorderRadius.circular(9999.r)),
                child: Text(widget.status, style: bodySmall.copyWith(color: secondary)),
              ),
              SizedBox(width: 4.fw),
              Container(
                padding: ps(h: 12, v: 6),
                decoration: BoxDecoration(color: darkenWhite, borderRadius: BorderRadius.circular(9999.r)),
                child: Text(widget.city, style: bodySmall.copyWith(color: secondary)),
              ),
            ],
          ),
          SizedBox(height: 24.fh),
          Divider(color: darkenWhite),
          SizedBox(height: 16.fh),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Experience', style: fieldLabel.copyWith(color: secondary)),
                    Text(widget.experience, style: fieldLabel.copyWith(fontSize: 16)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notice Period', style: fieldLabel.copyWith(color: secondary)),
                    Text(widget.experience, style: fieldLabel.copyWith(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'custom_avatar.dart';
import 'package:uikit_2/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit_2/color.dart';
import 'package:uikit_2/typography.dart';

// Карточка профиля
// Автор создания: 1
// Дата создания: 07.10.2026

class ProfileCard extends StatefulWidget {
  final String photo; // Путь к фото
  final String name; // Имя
  final String position; // Должность

  const ProfileCard({super.key, required this.photo, required this.name, required this.position});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  void initState() {
    super.initState();
    Logging().info('ProfileCard', 'Создание', 'Карточка профиля создана');
  }

  @override
  void dispose() {
    Logging().info('ProfileCard', 'Уничтожение', 'Карточка профиля уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Padding(
        padding: pa(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAvatar(size: 96, borderColor: white, fillcolor: white, photo: widget.photo, initials: ''),
            SizedBox(height: 16.fh),
            Text(widget.name, style: subHeader),
            SizedBox(height: 4.fh),
            Text(widget.position, style: bodyMedium.copyWith(color: secondary)),
          ],
        ),
      ),
    );
  }
}

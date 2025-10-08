import 'package:flutter/material.dart';

class SkillBar extends StatelessWidget {
  final String skill;
  final double percentage; // 0.0 to 1.0
  const SkillBar({super.key, required this.skill, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(skill, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 12,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

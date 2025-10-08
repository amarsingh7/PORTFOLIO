import 'package:flutter/material.dart';
import '../widgets/animated_skill_bar.dart';
import '../widgets/fade_in_section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'C', 'percent': 95.0, 'color': Colors.blue},
      {'name': 'C++', 'percent': 85.0, 'color': Colors.indigo},
      {'name': 'HTML5', 'percent': 92.0, 'color': Colors.orange},
      {'name': 'CSS3', 'percent': 90.0, 'color': Colors.blueAccent},
      {'name': 'JavaScript', 'percent': 70.0, 'color': Colors.yellow.shade700},
      {'name': 'React', 'percent': 80.0, 'color': Colors.lightBlue},
      {'name': 'Git/GitHub', 'percent': 95.0, 'color': Colors.black},
    ];

    return FadeInSection(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 600), // compact width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Skills 💡',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...skills.map((skill) => AnimatedSkillBar(
                  skill: skill['name'] as String,
                  percentage: skill['percent'] as double,
                  color: skill['color'] as Color,
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/skill_bar.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              const Text(
                "My Skills 💡",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 20,
                runSpacing: 16,
                alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                children: const [
                  SkillBar(skill: "C", percentage: 0.95),
                  SkillBar(skill: "C++", percentage: 0.85),
                  SkillBar(skill: "HTML5", percentage: 0.92),
                  SkillBar(skill: "CSS3", percentage: 0.90),
                  SkillBar(skill: "JavaScript", percentage: 0.70),
                  SkillBar(skill: "React", percentage: 0.80),
                  SkillBar(skill: "Git/GitHub", percentage: 0.90),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

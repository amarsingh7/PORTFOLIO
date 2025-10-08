import 'package:flutter/material.dart';
import '../widgets/fade_in_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInSection(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('About Me 🐥',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(
              'I am a Bachelor of Technology student at IIT BHU Varanasi with a deep interest in Computer Science, currently in my Third Year. I enjoy coding, reading books, travelling, and cycling.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

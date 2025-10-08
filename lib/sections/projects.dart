import 'package:flutter/material.dart';
import '../widgets/bouncing_card.dart';
import '../widgets/fade_in_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = List.generate(
      8,
      (index) => {
        'title': 'Project ${index + 1}',
        'desc': 'A sample description for project ${index + 1}.',
        'image': 'https://picsum.photos/400/250?random=${index + 10}'
      },
    );

    return FadeInSection(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('My Projects 💻',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: projects
                  .map(
                    (proj) => SizedBox(
                      width: 250,
                      child: BouncingCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(proj['image']!, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(proj['title']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(proj['desc']!,
                                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

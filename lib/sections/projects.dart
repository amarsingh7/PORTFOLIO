import 'package:flutter/material.dart';
import '../widgets/fade_in_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Portfolio App',
        'image': 'assets/images/project1.jpg',
        'desc': 'A responsive Flutter web portfolio.'
      },
      {
        'title': 'E-commerce App',
        'image': 'assets/images/project2.jpg',
        'desc': 'Online shopping app with cart and payments.'
      },
      {
        'title': 'Task Manager',
        'image': 'assets/images/project3.jpg',
        'desc': 'Productivity app with cloud sync.'
      },
    ];

    return FadeInSection(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Projects',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: projects.map((project) {
                return _AnimatedProjectCard(project: project);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedProjectCard extends StatefulWidget {
  final Map<String, String> project;
  const _AnimatedProjectCard({required this.project});

  @override
  State<_AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<_AnimatedProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: _hovering ? 1.05 : 1.0,
        curve: Curves.elasticOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.indigo.shade100, blurRadius: 20)]
                : [],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: _hovering ? 8 : 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    widget.project['image']!,
                    height: 180,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.project['title']!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(widget.project['desc']!,
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

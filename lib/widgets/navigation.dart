import 'package:flutter/material.dart';

class PortfolioNavBar extends StatelessWidget {
  const PortfolioNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController =
        PrimaryScrollController.of(context); // smooth scroll link
    final sections = {
      'Home': 0,
      'About': 1,
      'Projects': 2,
      'Contact': 3,
    };

    return AppBar(
      title: const Text('Amar Singh'),
      backgroundColor: Colors.white,
      elevation: 2,
      actions: [
        for (var entry in sections.entries)
          TextButton(
            onPressed: () {
              // smooth scroll to section
              scrollController.animateTo(
                entry.value * 600, // rough offset for section height
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
              );
            },
            child: Text(entry.key, style: const TextStyle(color: Colors.black)),
          ),
      ],
    );
  }
}

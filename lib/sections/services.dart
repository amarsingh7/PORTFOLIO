import 'package:flutter/material.dart';
import '../widgets/bouncing_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  final List<Map<String, dynamic>> services = const [
    {"title": "Web Design", "icon": Icons.design_services},
    {"title": "Competitive Coding", "icon": Icons.code},
    {"title": "Web Development", "icon": Icons.web},
    {"title": "Photography", "icon": Icons.camera_alt},
    {"title": "Content Creation", "icon": Icons.create},
    {"title": "Entrepreneurship", "icon": Icons.business},
  ];

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
                "Services 👨‍🔧",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 20,
                runSpacing: 16,
                alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                children: services
                    .map(
                      (s) => BouncingCard(
                        child: SizedBox(
                          width: isMobile ? 150 : 200,
                          height: 120,
                          child: Card(
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(s['icon'], size: 36, color: Colors.greenAccent),
                                const SizedBox(height: 12),
                                Text(
                                  s['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white70, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

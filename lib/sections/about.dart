import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                "About Me 🐥",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "I am a Bachelor of Technology student at IIT BHU, "
                "deeply interested in Computer Science and currently in my third year. "
                "I enjoy coding, reading, traveling, and exploring new technologies.",
                style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                textAlign: TextAlign.center, // center text on mobile
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment:
                    isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: const [
                  AboutItem(label: "Name", value: "Amar Singh"),
                  AboutItem(label: "DOB", value: "April XX, 2004"),
                  AboutItem(label: "Address", value: "Varanasi, India"),
                  AboutItem(label: "Graduation", value: "2024"),
                  AboutItem(label: "Interests", value: "Cooking, Travelling"),
                  AboutItem(label: "Email", value: "amar.singh.iitbhuv@gmail.com"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutItem extends StatelessWidget {
  final String label;
  final String value;
  const AboutItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: const TextStyle(color: Colors.greenAccent)),
          const SizedBox(width: 6),
          // Make the value flexible so it can wrap on small screens
          Flexible(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white70),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

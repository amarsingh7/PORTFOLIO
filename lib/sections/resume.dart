import 'package:flutter/material.dart';
import '../widgets/bouncing_card.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Resume 📄",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.greenAccent),
              ),
              const SizedBox(height: 16),
              const Text(
                "As someone rightly said, \"There's a great power in words, "
                "if you don't hitch too many of them together.\" \nCheck out my resume below!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 24),
              BouncingCard(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: const Text("Download Resume"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    // link to PDF
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

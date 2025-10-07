import 'package:flutter/material.dart';


class AboutSection extends StatelessWidget {
const AboutSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('About Me', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text('I\'m a passionate Flutter developer who enjoys creating beautiful and performant apps.'),
],
),
);
}
}
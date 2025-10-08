import 'package:flutter/material.dart';


class AboutSection extends StatelessWidget {
const AboutSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(32),
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
ClipRRect(
borderRadius: BorderRadius.circular(16),
child: Image.asset(
'assets/images/profile.png',
width: 180,
height: 180,
fit: BoxFit.cover,
),
),
const SizedBox(width: 24),
const Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('About Me', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text(
'I am Amar Singh, a Flutter developer passionate about crafting elegant, performant, and responsive apps for mobile and web. I love transforming ideas into real products that make people’s lives easier.',
textAlign: TextAlign.justify,
),
],
),
),
],
),
);
}
}
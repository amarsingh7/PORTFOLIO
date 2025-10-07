import 'package:flutter/material.dart';


class SkillsSection extends StatelessWidget {
const SkillsSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Skills', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text('Flutter, Dart, Firebase, REST APIs, Git, Java, Kotlin'),
],
),
);
}
}
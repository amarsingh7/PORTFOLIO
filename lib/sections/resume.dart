import 'package:flutter/material.dart';


class ResumeSection extends StatelessWidget {
const ResumeSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Resume', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text('B.Tech in Computer Science, XYZ University (2018 - 2022)'),
Text('Software Engineer at ABC Company (2022 - Present)'),
],
),
);
}
}
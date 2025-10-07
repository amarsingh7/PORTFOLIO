import 'package:flutter/material.dart';


class ProjectsSection extends StatelessWidget {
const ProjectsSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: const [
Text('Projects', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text('• Portfolio App\n• E-commerce App\n• Task Manager App'),
],
),
);
}
}
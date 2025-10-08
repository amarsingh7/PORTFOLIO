import 'package:flutter/material.dart';


class ProjectsSection extends StatelessWidget {
const ProjectsSection({super.key});


@override
Widget build(BuildContext context) {
final projects = [
{'title': 'Portfolio App', 'image': 'assets/images/project1.jpg', 'desc': 'A responsive Flutter web portfolio.'},
{'title': 'E-commerce App', 'image': 'assets/images/project2.jpg', 'desc': 'Online shopping app with cart and payments.'},
{'title': 'Task Manager', 'image': 'assets/images/project3.jpg', 'desc': 'Productivity app with cloud sync.'},
];


return Container(
padding: const EdgeInsets.all(32),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text('Projects', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
const SizedBox(height: 20),
Wrap(
spacing: 16,
runSpacing: 16,
children: projects.map((project) {
return SizedBox(
width: 300,
child: Card(
elevation: 3,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
ClipRRect(
borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
child: Image.asset(project['image']!, height: 180, width: double.infinity, fit: BoxFit.cover),
),
Padding(
padding: const EdgeInsets.all(12.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(project['title']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
const SizedBox(height: 6),
Text(project['desc']!, style: const TextStyle(fontSize: 14, color: Colors.black87)),
],
),
),
],
),
),
);
}).toList(),
),
],
),
);
}
}
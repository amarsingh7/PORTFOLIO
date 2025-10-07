import 'package:flutter/material.dart';


class ServicesSection extends StatelessWidget {
const ServicesSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text('• Mobile App Development\n• Web App Development\n• UI/UX Design'),
],
),
);
}
}
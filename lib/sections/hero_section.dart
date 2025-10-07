import 'package:flutter/material.dart';


class HeroSection extends StatelessWidget {
const HeroSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(32),
alignment: Alignment.center,
child: const Column(
children: [
CircleAvatar(
radius: 60,
backgroundImage: AssetImage('assets/images/profile.jpg'),
),
SizedBox(height: 20),
Text('Hi, I\'m Amar Singh', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
Text('Flutter Developer | Software Engineer'),
],
),
);
}
}
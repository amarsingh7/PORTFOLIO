import 'package:flutter/material.dart';


class FooterSection extends StatelessWidget {
const FooterSection({super.key});


@override
Widget build(BuildContext context) {
return Container(
color: Colors.indigo.shade50,
padding: const EdgeInsets.all(16),
alignment: Alignment.center,
child: const Text('© 2025 Amar Singh. All rights reserved.'),
);
}
}
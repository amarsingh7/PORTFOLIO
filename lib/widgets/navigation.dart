import 'package:flutter/material.dart';


class PortfolioNavBar extends StatelessWidget {
const PortfolioNavBar({super.key});


@override
Widget build(BuildContext context) {
return AppBar(
title: const Text('Amar Singh'),
centerTitle: true,
actions: [
TextButton(onPressed: () {}, child: const Text('About')),
TextButton(onPressed: () {}, child: const Text('Projects')),
TextButton(onPressed: () {}, child: const Text('Contact')),
],
);
}
}


class PortfolioDrawer extends StatelessWidget {
const PortfolioDrawer({super.key});


@override
Widget build(BuildContext context) {
return Drawer(
child: ListView(
padding: EdgeInsets.zero,
children: const [
DrawerHeader(
decoration: BoxDecoration(color: Colors.indigo),
child: Text('Amar Singh Portfolio', style: TextStyle(color: Colors.white)),
),
ListTile(title: Text('About')),
ListTile(title: Text('Projects')),
ListTile(title: Text('Contact')),
],
),
);
}
}
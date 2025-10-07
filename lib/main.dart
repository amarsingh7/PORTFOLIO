import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/hero_section.dart';
import 'sections/about.dart';
import 'sections/resume.dart';
import 'sections/services.dart';
import 'sections/skills.dart';
import 'sections/projects.dart';
import 'sections/blog.dart';
import 'sections/contact.dart';
import 'sections/footer.dart';
import 'widgets/navigation.dart';


void main() => runApp(const PortfolioApp());


class PortfolioApp extends StatelessWidget {
const PortfolioApp({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Amar Singh | Portfolio',
theme: ThemeData(
textTheme: GoogleFonts.poppinsTextTheme(),
colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
useMaterial3: true,
),
home: const PortfolioHome(),
);
}
}


class PortfolioHome extends StatelessWidget {
const PortfolioHome({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: const PreferredSize(
preferredSize: Size.fromHeight(60),
child: PortfolioNavBar(),
),
drawer: const PortfolioDrawer(),
body: SingleChildScrollView(
child: Column(
children: const [
HeroSection(),
AboutSection(),
ResumeSection(),
ServicesSection(),
SkillsSection(),
ProjectsSection(),
BlogSection(),
ContactSection(),
FooterSection(),
],
),
),
);
}
}
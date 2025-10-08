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
import 'widgets/fade_in_section.dart';

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

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: PortfolioNavBar(),
      ),
      body: PrimaryScrollController(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: const [
              FadeInSection(child: HeroSection()),
              FadeInSection(child: AboutSection()),
              FadeInSection(child: ResumeSection()),
              FadeInSection(child: ServicesSection()),
              FadeInSection(child: SkillsSection()),
              ProjectsSection(),
              FadeInSection(child: BlogSection()),
              FadeInSection(child: ContactSection()),
              FadeInSection(child: FooterSection()),
            ],
          ),
  ),
),

    );
  }
}

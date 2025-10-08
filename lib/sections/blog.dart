import 'package:flutter/material.dart';
import '../widgets/bouncing_card.dart';
import '../widgets/fade_in_section.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final blogs = List.generate(
      6,
      (index) => {
        'title': 'Blog Post ${index + 1}',
        'desc': 'This is a sample description for blog ${index + 1}.',
        'image': 'https://picsum.photos/400/250?random=$index'
      },
    );

    return FadeInSection(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('My Blogs ✍️',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: blogs
                  .map(
                    (blog) => SizedBox(
                      width: 250,
                      child: BouncingCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(blog['image']!, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(blog['title']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(blog['desc']!,
                                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

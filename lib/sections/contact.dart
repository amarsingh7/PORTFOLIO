import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSending = false;
  bool _nameTouched = false;
  bool _emailTouched = false;
  bool _subjectTouched = false;
  bool _messageTouched = false;

  void _sendMessage() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors in the form')),
      );
      return;
    }

    setState(() {
      _isSending = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSending = false;
        _resetForm();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
    });
  }

  void _resetForm() {
    // Clear text fields
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();

    // Reset touched flags
    _nameTouched = false;
    _emailTouched = false;
    _subjectTouched = false;
    _messageTouched = false;

    // Reset form state so validation messages disappear
    _formKey.currentState?.reset();
  }

  bool _isValidEmail(String? input) {
    if (input == null) return false;
    final email = input.trim();
    final regex = RegExp(r"^[\w\-\.]+@([\w\-]+\.)+[A-Za-z]{2,}");
    return regex.hasMatch(email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              const Text(
                "Contact Me 📞",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "If you have any questions or feedback, feel free to reach out!",
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Contact Info Row
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ContactInfoBox(
                      title: "Address",
                      content: "Varanasi, India",
                      icon: Icons.location_on),
                  ContactInfoBox(
                      title: "Phone", content: "XXXXXXXXXX", icon: Icons.phone),
                  ContactInfoBox(
                      title: "Email",
                      content: "amar.singh.iitbhuv@gmail.com",
                      icon: Icons.email),
                  ContactInfoBox(
                      title: "Website", content: "Coming Soon", icon: Icons.web),
                ],
              ),
              const SizedBox(height: 40),

              // Contact Form Card
              Card(
                color: Colors.grey[900],
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Your Name",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                          ),
                          autovalidateMode: _nameTouched
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          onChanged: (_) {
                            if (!_nameTouched) setState(() => _nameTouched = true);
                          },
                          validator: (value) =>
                              value!.isEmpty ? "Enter your name" : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Your Email",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                          ),
                          autovalidateMode: _emailTouched
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          onChanged: (_) {
                            if (!_emailTouched) setState(() => _emailTouched = true);
                          },
                          validator: (value) {
                            final v = value?.trim() ?? '';
                            if (v.isEmpty) return 'Enter your email';
                            if (!_isValidEmail(v)) return 'Enter a valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _subjectController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Subject",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                          ),
                          autovalidateMode: _subjectTouched
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          onChanged: (_) {
                            if (!_subjectTouched) setState(() => _subjectTouched = true);
                          },
                          validator: (value) =>
                              value!.isEmpty ? "Enter a subject" : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _messageController,
                          style: const TextStyle(color: Colors.white),
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                          ),
                          autovalidateMode: _messageTouched
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          onChanged: (_) {
                            if (!_messageTouched) setState(() => _messageTouched = true);
                          },
                          validator: (value) {
                            final v = value?.trim() ?? '';
                            if (v.isEmpty) return 'Enter your message';
                            if (v.length < 10) return 'Message must be at least 10 characters';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _isSending ? null : _sendMessage,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          child: _isSending
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.black),
                                )
                              : const Text("Send Message"),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfoBox extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  const ContactInfoBox(
      {super.key, required this.title, required this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            Icon(icon, color: Colors.greenAccent, size: 32),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Text(content, style: const TextStyle(color: Colors.white70))),
                if (title.toLowerCase() == 'email') ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.white70, size: 18),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: content));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email copied to clipboard')),
                      );
                    },
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}

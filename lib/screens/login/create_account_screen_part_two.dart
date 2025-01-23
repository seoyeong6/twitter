import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreenPartTwo extends StatelessWidget {
  final String name;
  final String contact;
  final String birthday;

  const CreateAccountScreenPartTwo({
    super.key,
    required this.name,
    required this.contact,
    required this.birthday,
  });

  void _onNextTap(BuildContext context) {
    context.push("/interest");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create your account",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 24),
            InfoItem(label: "Name", value: name),
            const SizedBox(height: 16),
            InfoItem(label: "Email", value: contact),
            const SizedBox(height: 16),
            InfoItem(label: "Date of birth", value: birthday),
            const Spacer(),
            GestureDetector(
              onTap: () => _onNextTap(context),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

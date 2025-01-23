import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/contents/gaps.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/screens/login/create_account_screen_part_two.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({
    super.key,
    required this.name,
    required this.contact,
    required this.birthday,
  });

  final String name;
  final String contact;
  final String birthday;

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isToggleOn = false;

  void _onToggleTap() {
    setState(() {
      _isToggleOn = !_isToggleOn;
    });
  }

  void onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => CreateAccountScreenPartTwo(
              name: widget.name,
              contact: widget.contact,
              birthday: widget.birthday,
            ),
      ),
    );
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                'Customize your experience',
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v40,
              Text(
                'Track where you see Twitter content across the web',
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v16,
              Row(
                children: [
                  SizedBox(
                    width: 280,
                    child: Text(
                      'Twitter uses this data to personalize your experience. This web history will never be stored with your name, email, or phone number.',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Gaps.h10,
                  GestureDetector(
                    onTap: _onToggleTap,
                    child: FaIcon(
                      _isToggleOn
                          ? FontAwesomeIcons.toggleOn
                          : FontAwesomeIcons.toggleOff,
                      color:
                          _isToggleOn
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade600,
                      size: Sizes.size40,
                    ),
                  ),
                ],
              ),
              Gaps.v40,
              Text(
                "By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, Lead more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v40,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onNextTap();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isToggleOn
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade300,
                    foregroundColor:
                        _isToggleOn ? Colors.white : Colors.grey.shade600,
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                      horizontal: Sizes.size24,
                    ),
                    textStyle: const TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter/contents/gaps.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/screens/login/auth_button.dart';
import 'package:twitter/screens/login/account_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void loginTab(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FaIcon(FontAwesomeIcons.twitter),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            children: [
              Gaps.v96,
              Text(
                'See what\'s happening in the world right now',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v80,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.google),
                text: 'Continue with Google',
              ),
              Gaps.v16,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: 'Continue with Apple',
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => loginTab(context),
                child: AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: 'Create account',
                ),
              ),
              Gaps.v52,
              Text(
                'By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use.',
                style: TextStyle(fontSize: Sizes.size16),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Have an account already?'),
              Gaps.h10,
              Text(
                'Log in',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

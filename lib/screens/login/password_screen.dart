import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/contents/gaps.dart';
import 'package:twitter/screens/login/interests_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String? _error;

  bool _isPasswordValid() {
    return _passwordController.text.length >= 8;
  }

  void onNextTap() {
    if (_passwordController.text.isEmpty) return;
    if (_passwordController.text.length < 8) {
      setState(() {
        _error = "비밀번호는 8자 이상이어야 합니다";
      });
      return;
    }
    setState(() {
      _error = null;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InterestsScreen()),
    );
  }

  void onScaffoldTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onScaffoldTap(context);
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: FaIcon(
            FontAwesomeIcons.twitter,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v60,
                Text(
                  'You\'ll need a password',
                  style: TextStyle(
                    fontSize: Sizes.size24 + Sizes.size2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                Text(
                  'Make sure it\'s 8 characters or more',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v32,
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  onChanged: (value) => setState(() {}),
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: _toggleObscureText,
                          icon: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: Sizes.size16,
                            color: Colors.grey,
                          ),
                        ),
                        if (_isPasswordValid())
                          Icon(Icons.check_circle, color: Colors.green),
                      ],
                    ),
                    hintText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                    errorText: _error,
                  ),
                ),
                Gaps.v20,
                Expanded(
                  child: Align(
                    child: ElevatedButton(
                      style:
                          _isPasswordValid()
                              ? ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                minimumSize: Size(
                                  double.infinity,
                                  Sizes.size52,
                                ),
                              )
                              : ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                minimumSize: Size(
                                  double.infinity,
                                  Sizes.size52,
                                ),
                              ),
                      onPressed: onNextTap,
                      child: Text(
                        'Next',
                        style:
                            _isPasswordValid()
                                ? TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w600,
                                )
                                : TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

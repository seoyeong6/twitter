import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/contents/gaps.dart';
import 'package:twitter/screens/login/password_screen.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  final String contact;
  const ConfirmationCodeScreen({super.key, required this.contact});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  bool _isPasswordValid() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  void onNextTap() {
    if (_isPasswordValid()) {
      // 패스워드가 유효하면 다음 화면으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordScreen()),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
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
                'We sent you a code',
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v40,
              Text(
                'Enter it below to verify',
                style: TextStyle(fontSize: Sizes.size20),
              ),
              Text(widget.contact, style: TextStyle(fontSize: Sizes.size16)),
              Gaps.v40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 45,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w600,
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              Gaps.v40,
              Text(
                'Did\'nt receive email?',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Gaps.v80,
              Expanded(
                child: Align(
                  child: ElevatedButton(
                    style:
                        _isPasswordValid()
                            ? ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(double.infinity, Sizes.size52),
                            )
                            : ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              minimumSize: Size(double.infinity, Sizes.size52),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter/contents/gaps.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String name = '';
  String phone = '';
  String date = '';

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {
        name = nameController.text;
      });
    });
    phoneController.addListener(() {
      setState(() {
        phone = phoneController.text;
      });
    });
    dateController.addListener(() {
      setState(() {
        date = dateController.text;
      });
    });
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
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v60,
              Text(
                'Create your account',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v80,
              AuthTextField(controller: nameController, hintText: "Name"),
              Gaps.v16,
              AuthTextField(
                controller: phoneController,
                hintText: "Phone number or email address",
              ),
              Gaps.v16,
              AuthTextField(
                controller: dateController,
                hintText: "Date of birth",
              ),
              Gaps.v16,
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    color:
                        name.isNotEmpty && phone.isNotEmpty && date.isNotEmpty
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(Sizes.size20),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color:
                            name.isNotEmpty &&
                                    phone.isNotEmpty &&
                                    date.isNotEmpty
                                ? Colors.white
                                : Colors.grey.shade600,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: const Text("Next"),
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

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}

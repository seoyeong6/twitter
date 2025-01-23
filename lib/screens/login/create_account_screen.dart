import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/contents/gaps.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter/screens/login/customize_experience_screen.dart';
import 'package:twitter/screens/login/create_account_screen_part_two.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({
    super.key,
    required this.name,
    required this.contact,
    required this.birthday,
  });

  final String name;
  final String contact;
  final String birthday;

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();

  String _name = "";
  String _phone = "";
  String _date = "";

  bool _showDatePicker = false;

  void onNextTap() {
    if (_name.isEmpty || _phone.isEmpty || _date.isEmpty) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => CustomizeExperienceScreen(
              name: _name,
              contact: _phone,
              birthday: _date,
            ),
      ),
    );
  }

  void onScaffoldTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void onSubmitTap() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => CreateAccountScreenPartTwo(
                name: _name,
                contact: _phone,
                birthday: _date,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onScaffoldTap(context);
        setState(() {
          _showDatePicker = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: FaIcon(
            FontAwesomeIcons.twitter,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size24,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Gaps.v60,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            _name.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade600,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    suffix:
                        _name.isNotEmpty
                            ? const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: Sizes.size20,
                            )
                            : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                Gaps.v16,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone number or email address',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            _name.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade600,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    suffix:
                        _phone.isNotEmpty
                            ? const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: Sizes.size20,
                            )
                            : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number or email address is required';
                    }
                    return null;
                  },
                ),
                Gaps.v16,
                TextFormField(
                  enabled: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Date of birth',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            _date.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade600,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _showDatePicker = true;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date of birth is required';
                    }
                    return null;
                  },
                ),
                if (_date.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: Sizes.size8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'This will not be shown publicly. Confirm your age, even if this account is for a business, pet, or something else.',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size14,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Sizes.size24),
                      child: ElevatedButton(
                        onPressed: onSubmitTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _name.isNotEmpty &&
                                      _phone.isNotEmpty &&
                                      _date.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size16,
                            horizontal: Sizes.size24,
                          ),
                          textStyle: const TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.size32),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color:
                                _name.isNotEmpty &&
                                        _phone.isNotEmpty &&
                                        _date.isNotEmpty
                                    ? Colors.white
                                    : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            _showDatePicker
                ? BottomAppBar(
                  height: 300,
                  color: Colors.white,
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.white,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime value) {
                      final formattedDate =
                          "${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                      setState(() {
                        _date = formattedDate;
                        dateController.text = formattedDate;
                      });
                    },
                  ),
                )
                : null,
      ),
    );
  }
}

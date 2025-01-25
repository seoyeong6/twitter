import 'package:flutter/material.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/contents/gaps.dart';

List<String> interests = [
  'Fashion\n&beauty',
  'Outdoors',
  'Art\n&cultures',
  'Animation\n&comics',
  'Travel',
  'Entertainment',
  'Music',
  'Business',
  'Celebrities',
  'Education',
  'Food&drink',
  'Gaming',
  'Health',
  'News',
  'Science',
  'Sports',
  'Technology',
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _selectedInterests = [];

  bool get isSelected => _selectedInterests.length >= 3;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size32,
              right: Sizes.size32,
              bottom: Sizes.size36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What do you want to see on Twitter?',
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                Text(
                  'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade600,
                  ),
                ),
                Gaps.v40,
                Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    for (var interest in interests)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedInterests.contains(interest)) {
                              _selectedInterests.remove(interest);
                            } else {
                              _selectedInterests.add(interest);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.size16,
                            horizontal: Sizes.size24,
                          ),
                          decoration: BoxDecoration(
                            color:
                                _selectedInterests.contains(interest)
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(Sizes.size32),
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          width: 150,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                interest,
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      _selectedInterests.contains(interest)
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: Sizes.size16,
          bottom: Sizes.size12,
          left: Sizes.size24,
          right: Sizes.size24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Great work!"),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size8,
                horizontal: Sizes.size16,
              ),
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(Sizes.size32),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

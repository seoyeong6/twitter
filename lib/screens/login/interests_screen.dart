import 'package:flutter/material.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/contents/gaps.dart';

List<String> interests = [
  'Fashion&beauty',
  'Outdoors',
  'Art&cultures',
  'Animation&comics',
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

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size24,
            right: Sizes.size24,
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
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size16,
                        horizontal: Sizes.size24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Sizes.size32),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Text(
                        interest,
                        style: TextStyle(fontSize: Sizes.size16),
                      ),
                    ),
                ],
              ),
            ],
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
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size32),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
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

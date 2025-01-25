import 'package:flutter/material.dart';
import 'package:twitter/contents/sizes.dart';
import 'package:twitter/contents/gaps.dart';

List<String> musics = [
  'Rap',
  'R&B',
  'Pop',
  'Rock',
  'Jazz',
  'Hip-hop',
  'Country',
  'Electronic',
  'Classical',
  'Metal',
  'Folk',
  'Reggae',
  'Blues',
  'Soul',
];

List<String> entertainments = [
  'Anime',
  'Movies',
  'TV',
  'Books',
  'Comics',
  'Podcasts',
  'Games',
  'Gaming',
  'Sports',
  'Fashion',
  'Art',
  'Celebrities',
  'Food',
  'Travel',
];

class InterestsPartTwo extends StatefulWidget {
  const InterestsPartTwo({super.key});

  @override
  State<InterestsPartTwo> createState() => _InterestsPartTwoState();
}

class _InterestsPartTwoState extends State<InterestsPartTwo> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _selectedInterests = [];

  bool get isSelected => _selectedInterests.length >= 3;

  void _setMusic(String music) {
    setState(() {
      if (_selectedInterests.contains(music)) {
        _selectedInterests.remove(music);
      } else {
        _selectedInterests.add(music);
      }
    });
  }

  void _setEntertainment(String entertainment) {
    setState(() {
      if (_selectedInterests.contains(entertainment)) {
        _selectedInterests.remove(entertainment);
      } else {
        _selectedInterests.add(entertainment);
      }
    });
  }

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
                  'Interests are used to personalize your experience and will be visible on your profile.',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade600,
                  ),
                ),
                Gaps.v10,
                Divider(color: Colors.grey.shade300),
                Gaps.v10,
                Text(
                  "Music",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v40,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,
                    child: Wrap(
                      runSpacing: 15,
                      spacing: 15,
                      children: [
                        for (var music in musics)
                          GestureDetector(
                            onTap: () {
                              _setMusic(music);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: Sizes.size16,
                                horizontal: Sizes.size24,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _selectedInterests.contains(music)
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size32,
                                ),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Text(
                                music,
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      _selectedInterests.contains(music)
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Gaps.v40,
                Divider(color: Colors.grey.shade300),
                Gaps.v10,
                Text(
                  "Entertainment",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v40,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,
                    child: Wrap(
                      runSpacing: 15,
                      spacing: 15,
                      children: [
                        for (var entertainment in entertainments)
                          GestureDetector(
                            onTap: () {
                              _setEntertainment(entertainment);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: Sizes.size16,
                                horizontal: Sizes.size24,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _selectedInterests.contains(entertainment)
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size32,
                                ),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Text(
                                entertainment,
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      _selectedInterests.contains(entertainment)
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size8,
                  horizontal: Sizes.size16,
                ),
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isSelected ? Theme.of(context).primaryColor : Colors.grey,
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
            ),
          ],
        ),
      ),
    );
  }
}

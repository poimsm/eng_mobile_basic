import 'package:cached_network_image/cached_network_image.dart';
import 'package:eng_mobile_app/pages/language_screen.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RoundScreen extends StatefulWidget {
  const RoundScreen(
      {super.key,
      required this.isWelcomeAgain,
      required this.roundNumber,
      required this.onStartQuiz,
      required this.onCreateUser});

  final bool isWelcomeAgain;
  final int roundNumber;
  final VoidCallback onStartQuiz;
  final VoidCallback onCreateUser;

  @override
  State<RoundScreen> createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen> {
  bool showAccountPopup = false;
  Size size = Size.zero;
  final backend = GetIt.I.get<GlobalService>();

  List<Map> messages = [
    {
      'title': "You Rock!",
      'first': "Yay! Congratz on completing ",
      'last': " Are you ready to play more? Let's keep the fun going!",
    },
    {
      'title': "Way to go!",
      'first': "Woohoo, congrats on finishing ",
      'last': " Ready for another dose of fun? We're not finished yet!",
    },
    {
      'title': "You're unstoppable!",
      'first': "Woot woot! You've conquered ",
      'last': " Ready to dive back in? Let's keep the fun going!",
    },
    {
      'title': "Outstanding!",
      'first': "You did it! Congratulations on finishing ",
      'last': " How about another quiz? Are you up for it?!",
    },
    {
      'title': "You're on fire!",
      'first': "Hooray! ",
      'last':
          " is officially complete! Ready for more? The fun shouldn't stop here!",
    },
    {
      'title': "Keep it up!",
      'first': "Yesss! Congratulations on reaching the end of ",
      'last': " Up for more action? Let's keep the fun flowing!",
    },
  ];

  String firstTimeMsg =
      "This app is all about asking you questions and letting you decide how to answer them! You can talk as much or as little as you want, it's totally up to you! It's like having a cool conversation right at home. Let's practice talking together and have a blast! Yay!";
  String welcomeMsg =
      "Discover words, boost creativity, enjoy questions, and keep the conversation flowing. Let's begin!";
  Map roundMsg = {};

  @override
  void initState() {
    roundMsg = (messages..shuffle()).first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // roundMsg = (messages..shuffle()).first;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.09, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height - (size.height < 700? 150 : 160),
            child: ListView(
              children: [
                _lang(),
                SizedBox(height: getTopHeight()),
                _title(),
                SizedBox(height: size.height * 0.03),
                _phrase(),
                SizedBox(height: size.height * 0.07),
                _image(),
              ],
            ),
          ),
          _button(getBtnTitle()),
        ],
      ),
    );
  }

  double getTopHeight() {
    if (backend.isFirstTime) {
      return size.height * 0.05;
    }

    if (widget.isWelcomeAgain) {
      return size.height * 0.1;
    }

    return size.height * 0.1;
  }

  String getBtnTitle() {
    if (backend.isFirstTime) {
      return 'START QUIZ';
    }

    if (widget.isWelcomeAgain) {
      return 'START QUIZ';
    }

    return 'PLAY AGAIN';
  }

  _lang() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => presentLangActionSheet(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: CachedNetworkImage(
                    imageUrl: backend.language['flag'],
                    width: 30,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Colors.black87,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(backend.language['lang'].toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff00003A),
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ],
      ),
    );
  }

  _title() {
    if (backend.isFirstTime) {
      return _boldText("Welcome \\ (•◡•) /");
    }

    if (widget.isWelcomeAgain) {
      return _boldText('Hello again!');
    }

    return _boldText(roundMsg['title']);
  }

  _boldText(String text) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff333F50)),
      ),
    );
  }

  _phrase() {
    if (backend.isFirstTime) {
      return _simplePhrase(firstTimeMsg);
    }

    if (widget.isWelcomeAgain) {
      return _simplePhrase(welcomeMsg);
    }

    return _roundPhrase(roundMsg, widget.roundNumber);
  }

  _simplePhrase(String message) {
    return SizedBox(
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: message,
                style: TextStyle(
                  color: Color(0xff333F50),
                  fontWeight: FontWeight.normal,
                  fontSize: 19.5,
                )),
          ],
        ),
      ),
    );
  }

  _roundPhrase(Map message, int roundNumber) {
    return SizedBox(
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: message['first'],
                style: TextStyle(
                  color: Color(0xff333F50),
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                )),
            TextSpan(
                text: ' Round #$roundNumber!',
                style: TextStyle(
                  color: Color(0xff333F50),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: message['last'],
                style: TextStyle(
                  color: Color(0xff333F50),
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                )),
          ],
        ),
      ),
    );
  }

  _image() {
    return Image.asset(
      'assets/cheers.jpg',
      height: size.height * 0.3,
    );
  }

  _button(String text) {
    print('heeeeeeight::::${size.height}');
    return InkWell(
      onTap: () async {
        if (backend.isFirstTime) {
          await backend.setFirstTime(false);
          widget.onStartQuiz();
        }

        widget.onStartQuiz();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.only(bottom: size.height < 700? 0: 20),
        decoration: BoxDecoration(
          color: Color(0xff64E5D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(Icons.arrow_forward, size: 30, color: Colors.white)
          ],
        ),
      ),
    );
  }

  presentLangActionSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => LanguageScreen(
            language: backend.language['lang'],
            onLangSelect: (String lang) async {
              await backend.setLanguage(lang);
              setState(() {});
            }));
  }
}

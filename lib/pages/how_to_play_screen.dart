import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HowToPlayScreen extends StatefulWidget {
  const HowToPlayScreen({
    super.key,
    required this.language,
    required this.onLangSelect,
  });

  final String language;
  final Function(String) onLangSelect;

  @override
  State<HowToPlayScreen> createState() => _HowToPlayScreenState();
}

class _HowToPlayScreenState extends State<HowToPlayScreen> {
  bool showAccountPopup = false;
  Size size = Size.zero;
  final backend = GetIt.I.get<GlobalService>();
  String langSelected = '';

  String intro =
      "We've got awesome games to make you even better at speaking! Guess what's really cool? Thinking in English! With LinguaQuiz, you can play and have a blast talking, thinking, and making things up in English.";
  String describePicture =
      "Imagine describing really cool pictures or answering tricky questions about them. You’ve  got to use your big brain to come up with super creative answers!";
  String tales =
      "Read short stories and answer awesome questions about them. You can make up new endings or keep the story going!";
  String mic =
      "If you want, you can even record your voice! Just tap the microphone and talk. Remember there's no such thing as a wrong answer. It's all about speaking in English and being yourself…";
  String end =
      "Okay, here's the deal: When you talk about pictures or change stories, use the mic and talk lots! This app helps your brain imagine all kinds of things and lets you chat away for ages and ages!";

  @override
  void initState() {
    langSelected = widget.language;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: 700,
      color: Color(0xffF9F9F9),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _title(),
            SizedBox(
              height: 30,
            ),
            _partText(intro),
            SizedBox(
              height: 20,
            ),
            _partSubtitle(1, 'Do Cool Stuff'),
            SizedBox(
              height: 6,
            ),
            _partText('a. Describe pictures:'),
            SizedBox(
              height: 0,
            ),
            _partTextImg(describePicture, 'assets/brain.png'),
            SizedBox(
              height: 10,
            ),
            _partText('b. Tell stories:'),
            SizedBox(
              height: 0,
            ),
            _partTextImg(tales, 'assets/dragon.png'),
            SizedBox(
              height: 20,
            ),
            _partSubtitle(2, 'Record Your Voice'),
            SizedBox(
              height: 5,
            ),
            _partText(mic),
            SizedBox(
              height: 15,
            ),
            _partText('〰️〰️〰️〰️〰️〰️〰️〰️〰️〰️〰️〰️〰️'),
            SizedBox(
              height: 5,
            ),
            _partText(end),
          ],
        ),
      ),
    );
  }

  _title() {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'HOW TO PLAY',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            color: Color(0xff333F50)),
      ),
    );
  }

  _partSubtitle(int index, String text) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff333F50).withOpacity(0.9)
            ),
            child: Text(index.toString(), style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          ),
          SizedBox(width: 10,),
          Text(
            text,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff333F50)),
          ),
        ],
      ),
    );
  }

  _partText(String text) {
    return Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 18.5, color: Colors.black87),
        ));
  }

  _partTextImg(String text, String imgPath) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.6 - 20,
              child: Text(
                text,
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
            ),
            Image.asset(imgPath,
                width: size.width * 0.3 - 20, height: 100, fit: BoxFit.contain)
          ],
        ));
  }
}

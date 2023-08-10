import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';

class QuestionImage extends StatefulWidget {
  const QuestionImage({
    super.key,
    required this.onPlayVoice,
    required this.question,
  });

  final Function(bool) onPlayVoice;
  final Question question;

  @override
  State<QuestionImage> createState() => _QuestionImageState();
}

class _QuestionImageState extends State<QuestionImage> {
  Size size = Size.zero;
  final swiperControllerScenario = SwiperController();
  bool showQuestionReplayBtn = true;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _image(),
        Positioned(
          top: size.height * 0.1,
          child: _questionText(),
        )
      ],
    );
  }

  _questionText() {
    TextStyle textStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        overflow: TextOverflow.clip);

    final Size sizeMe = (TextPainter(
            text: TextSpan(text: widget.question.question, style: textStyle),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;

    bool multipleLines = sizeMe.width > size.width * 0.8;
    return Stack(
      children: [
        Container(
            color:
                Colors.black.withOpacity(widget.question.style.questionOpacity),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            margin: EdgeInsets.only(bottom: multipleLines ? 20 : 40),
            width: size.width,
            child: Center(
                child: Text(widget.question.question,
                    textAlign: TextAlign.center, style: textStyle))),
        if (showQuestionReplayBtn)
          Positioned(
            right: 20,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                widget.onPlayVoice(true);
                showQuestionReplayBtn = false;
                setState(() {});
                await sleep(300);
                showQuestionReplayBtn = true;
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Icon(Icons.refresh, size: 30, color: Colors.black54),
              ),
            ),
          )
      ],
    );
  }

  _image() {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width,
      child: Center(
        child: Image.network(
          widget.question.imageUrl,
          height: size.height * 0.8,
          width: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

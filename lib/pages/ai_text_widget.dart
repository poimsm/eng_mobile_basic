import 'dart:async';

import 'package:eng_mobile_app/data/models/question.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AITextWidget extends StatefulWidget {
  const AITextWidget(this.explanations, {super.key, required this.onBack});
  final List<Explanation> explanations;
  final VoidCallback onBack;

  @override
  State<AITextWidget> createState() => _AITextWidgetState();
}

class _AITextWidgetState extends State<AITextWidget> {
  bool showText = false;
  bool showTranslationBtn = false;
  bool showTranslation = false;
  bool showStreaming = true;

  String text1 = 'english text';
  String text2 = 'texto en español';

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _backBtn(),
            showTranslationBtn ? _translBtn() : SizedBox(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 300,
            ),
            child: _content()),
      ],
    );
  }

  _content() {
    if (showTranslation && !showStreaming) {
      return Text(
        widget.explanations[0].translation,
        style: TextStyle(fontSize: 18, color: Colors.black87),
      );
    }
    if (!showTranslation && !showStreaming) {
      return Text(
        widget.explanations[0].value,
        style: TextStyle(fontSize: 18, color: Colors.black87),
      );
    }

    return StreamingText(
        text: widget.explanations[0].value,
        duration: Duration(milliseconds: 5),
        onEnd: () {
          showTranslationBtn = true;
          setState(() {});
        });
  }

  _backBtn() {
    return InkWell(
        onTap: () => widget.onBack(),
        child: Padding(
            padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: Icon(Icons.arrow_back, size: 30)));
  }

  _translBtn() {
    return InkWell(
        onTap: () {
          showTranslation = !showTranslation;
          showStreaming = false;
          setState(() {});
        },
        child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
            child: Icon(Icons.translate, size: 30, color: showTranslation? Colors.blue : Colors.black,)));
  }
}

class StreamingText extends StatefulWidget {
  final String text;
  final Duration duration;
  final VoidCallback onEnd;

  const StreamingText({
    super.key,
    required this.text,
    required this.duration,
    required this.onEnd,
  });

  @override
  _StreamingTextState createState() => _StreamingTextState();
}

class _StreamingTextState extends State<StreamingText> {
  String _displayedText = '';
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _startStreamingText();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startStreamingText() {
    timer = Timer.periodic(widget.duration, (time) {
      if (_displayedText.length < widget.text.length) {
        setState(() {
          _displayedText = widget.text.substring(0, _displayedText.length + 1);
        });
      } else {
        time.cancel();
        widget.onEnd();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: TextStyle(fontSize: 18, color: Colors.black87),
    );
  }
}

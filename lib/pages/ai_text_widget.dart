import 'dart:async';

import 'package:eng_mobile_app/data/models/question.dart';
import 'package:flutter/material.dart';

class AITextWidget extends StatefulWidget {
  const AITextWidget(this.explanations, {super.key});
  final List<Explanation> explanations;

  @override
  State<AITextWidget> createState() => _AITextWidgetState();
}

class _AITextWidgetState extends State<AITextWidget> {
  bool showText = false;
  String myText = 'Hello word just proving the functinality';

  @override
  Widget build(BuildContext context) {
    return !showText ? 
    _btn() : StreamingText(text: widget.explanations[0].value, duration: Duration(milliseconds: 40));



    // return Container(
    //   width: 300,
    //   height: 60,
    //   decoration: BoxDecoration(
    //     border: Border.all(width: 1, color: Colors.black54),
    //     borderRadius: BorderRadius.circular(10)
    //   ),
    //   child: Center(
    //     child: Text('Explain More...', style: TextStyle(
    //       fontSize: 18.5,
    //       color: Colors.black87
    //     ),),
    //   )
    // );

    // return StreamingText(text: 'Hello word just proving the functinality', duration: Duration(milliseconds: 50));
  }

  _btn() {
    return ElevatedButton(
      onPressed: () {
        showText = true;
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: Colors.blue,
      ),
      child: Text(
        'Explain More...',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );  
  }
}


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
        print('Button pressed!');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: Colors.blue,
      ),
      child: Text(
        'Explain More...',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}


class StreamingText extends StatefulWidget {
  final String text;
  final Duration duration;

  const StreamingText({
    required this.text,
    required this.duration,
  });

  @override
  _StreamingTextState createState() => _StreamingTextState();
}

class _StreamingTextState extends State<StreamingText> {
  String _displayedText = '';

  @override
  void initState() {
    super.initState();
    _startStreamingText();
  }

  void _startStreamingText() {
    Timer.periodic(widget.duration, (timer) {
      if (_displayedText.length < widget.text.length) {
        setState(() {
          _displayedText = widget.text.substring(0, _displayedText.length + 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87
      ),
    );
  }
}
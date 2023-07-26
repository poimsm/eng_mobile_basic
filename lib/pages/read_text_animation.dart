import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ReadTextAnimation extends StatefulWidget {
  const ReadTextAnimation(
      {super.key,
      required this.text,
      required this.duration,
      required this.onEnd,
      });
  final String text;
  final Duration duration;
  final VoidCallback onEnd;

  @override
  State<ReadTextAnimation> createState() => _ReadTextAnimationState();
}

class _ReadTextAnimationState extends State<ReadTextAnimation> {
  final player = AudioPlayer();
  bool disposed = false;

  String alreadyReadText = '';
  String noReadText = '';

  @override
  void initState() {
    noReadText = widget.text;
    startReadingAnimation();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    disposed = true;
    super.dispose();
  }

  startReadingAnimation() async {
    if(disposed) return;
    int time = widget.duration.inMilliseconds;
    int len = widget.text.length;

    for (int i = 0; i < len; i++) {
      if(disposed) return;
      String char = widget.text[i];
      if (char == '.' || char == ',') {
        await sleep(500);
      }
      alreadyReadText += widget.text[i];
      noReadText = widget.text.substring(i + 1);
      setState(() {});
      await sleep((time / (len + 30)).round());
    }

    if(disposed) return;
    widget.onEnd();
  }

  @override
  Widget build(BuildContext context) {   
    return Container(
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: alreadyReadText,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                )),
            TextSpan(
                text: noReadText,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                )),
          ],
        ),
      ),
    );
  }
}

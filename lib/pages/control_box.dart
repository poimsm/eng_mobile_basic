import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class ControlBox extends StatefulWidget {
  const ControlBox({
    super.key,
    required this.onMicPress,
    required this.onNextQuestion,
    required this.onBack,
  });

  final Function(bool) onMicPress;
  final VoidCallback onNextQuestion;
  final VoidCallback onBack;

  @override
  State<ControlBox> createState() => _ControlBoxState();
}

class _ControlBoxState extends State<ControlBox> {
  Size size = Size.zero;
  final swiperControllerScenario = SwiperController();
  bool showQuestionReplayBtn = true;
  bool isRecording = false;
  int seconds = 0;
  bool showNextBtn = true;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _backBtn(),
        isRecording ? _stopBtn() : _micBtn(),
        _nextBtn(),
      ]),
    );
  }

  _backBtn() {
    return Stack(
      children: [
        SizedBox(
          height: 80,
          width: 70,
          child: Center(
            child: InkWell(
              onTap: () => widget.onBack(),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.restart_alt,
                    size: 40, color: Colors.white.withOpacity(0.7)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _nextBtn() {
    if (!showNextBtn) {
      return SizedBox(
        height: 50,
        width: 56,
      );
    }
    return InkWell(
      onTap: () => widget.onNextQuestion(),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(Icons.chevron_right,
            color: Colors.white.withOpacity(0.7), size: 45),
      ),
    );
  }

  _micBtn() {
    return InkWell(
      onTap: () {
        widget.onMicPress(true);
        isRecording = true;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(isRecording ? 27 : 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff8D57FF).withOpacity(isRecording ? 0.65 : 0.8),
        ),
        child: Icon(isRecording ? Icons.stop_circle : Icons.mic,
            color: Colors.white, size: isRecording ? 40 : 70),
      ),
    );
  }

  _stopBtn() {
    return InkWell(
      onTap: () {
        widget.onMicPress(false);
        isRecording = false;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff8D57FF).withOpacity(0.9),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                seconds.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.white.withOpacity(0.1),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.stop_circle, color: Colors.white, size: 70),
          ],
        ),
      ),
    );
  }
}

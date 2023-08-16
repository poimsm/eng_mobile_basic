import 'package:cached_network_image/cached_network_image.dart';
import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';

class QuestionScenario extends StatefulWidget {
  const QuestionScenario({
    super.key,
    required this.onPlayVoice,
    required this.question,
    required this.onActivityEnd,
    required this.onToggleControls,
    required this.redo,
    required this.onToggleRedo,
  });

  final Function(bool, String) onPlayVoice;
  final VoidCallback onActivityEnd;
  final Function(bool) onToggleControls;
  final Question question;
  final bool redo;
  final Function(bool) onToggleRedo;

  @override
  State<QuestionScenario> createState() => _QuestionScenarioState();
}

class _QuestionScenarioState extends State<QuestionScenario> {
  Size size = Size.zero;
  bool showQuestionReplayBtn = true;
  int index = 0;
  late ScenarioPart part;
  String promptImgUrl = '';

  @override
  void initState() {
    super.initState();
    part = widget.question.scenario!.parts[0];
    promptImgUrl = part.imageUrl!;
  }

  resetActivity() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      index = 0;
      part = widget.question.scenario!.parts[index];
      widget.onPlayVoice(true, part.voiceUrl!);
      promptImgUrl = part.imageUrl!;
      widget.onToggleRedo(false);
      widget.onToggleControls(false);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.redo) {
      resetActivity();
    }
    size = MediaQuery.of(context).size;
    double h = size.height * 0.9;
    return SizedBox(
        width: size.width,
        height: size.height * 0.95,
        child: Stack(
          children: [
            Container(
                color: Color(0xff232629),
                child: part.type == 'prompt'
                    ? _scenarioPrompt(h, widget.question)
                    : _scenarioChoose(
                        h, widget.question.scenario!.parts[index])),
          ],
        ));
  }

  _scenarioPrompt(double height, Question question) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: promptImgUrl,
              width: size.width,
              height: height,
              fit: BoxFit.cover),
          Positioned(
              top: size.height * 0.15,
              left: 0,
              child: _questionText(question.scenario!.parts[index])),
          Positioned(
              top: 0, left: 0, child: _titleScenario(question.scenario!.title)),
          Positioned(
              top: size.height * 0.78,
              left: 0,
              child: SizedBox(
                width: size.width,
                child: Center(
                  child: _continueBtn(),
                ),
              ))
        ],
      ),
    );
  }

  _titleScenario(String title) {
    return Container(
      width: size.width,
      padding: EdgeInsets.only(top: 35, bottom: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.8)],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _continueBtn() {
    if (widget.question.scenario!.parts[index].showControls) {
      return Container();
    }
    return InkWell(
      onTap: () {
        final scenario = widget.question.scenario!;

        index++;
        part = scenario.parts[index];

        if (part.voiceUrl != null) {
          widget.onPlayVoice(true, part.voiceUrl!);
        }

        if (part.imageUrl != null) {
          promptImgUrl = part.imageUrl!;
        }

        if (part.showControls) {
          widget.onToggleControls(true);
        }

        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white),
            color: Colors.black.withOpacity(0.2)),
        child: Text(
          'CONTINUE',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }

  _questionText(ScenarioPart part) {
    TextStyle textStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 22,
        overflow: TextOverflow.clip);

    final Size sizeMe = (TextPainter(
            text: TextSpan(text: part.text, style: textStyle),
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
                child: Text(part.text,
                    textAlign: TextAlign.center, style: textStyle))),
        if (showQuestionReplayBtn)
          Positioned(
            right: 20,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                widget.onPlayVoice(true, part.voiceUrl!);
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

  _scenarioChoose(double height, ScenarioPart part) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: size.width,
                // color: Color(0xff232629),
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  part.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xffBFBFBF),
                      fontWeight: FontWeight.w500),
                ),
              ),
              _itemScenario(part.options![0]),
              _itemScenario(part.options![1]),
              _itemScenario(part.options![2]),
            ],
          ),
        ],
      ),
    );
  }

  _itemScenario(ScenarioPartOption option) {
    return SizedBox(
      height: size.height * 0.235,
      width: size.width,
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: option.imageUrl,
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: size.width,
              height: size.height * 0.235,
              fit: BoxFit.cover),
          Positioned(
            top: size.height * 0.06,
            left: 0,
            child: Container(
              width: size.width,
              color: Colors.black.withOpacity(0.4),
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
              child: Text(
                option.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

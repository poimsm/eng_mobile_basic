import 'dart:async';

import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/pages/read_text_animation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:line_icons/line_icons.dart';

class CardsExample extends StatefulWidget {
  const CardsExample(this.examples, {super.key});
  final List<WordExample> examples;

  @override
  State<CardsExample> createState() => _CardsExampleState();
}

class _CardsExampleState extends State<CardsExample> {
  final player = AudioPlayer();
  Size size = Size.zero;
  Duration duration = Duration.zero;
  List<Map> examples = [];
  bool disposed = false;

  @override
  void initState() {
    examples = widget.examples.map((WordExample e) {
      return {'example': e, 'animate': false, 'duration': Duration.zero};
    }).toList();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    if (examples.isEmpty) return Container();
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(examples.length, (i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Card(
                elevation: 3,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
                  width: size.width * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 175,
                        child: ListView(
                          children: [
                            // Text(examples[i]['animate'].toString()),
                            examples[i]['animate']
                                ? ReadTextAnimation(
                                    text: examples[i]['example'].value,
                                    duration: examples[i]['duration'],
                                    onEnd: () {
                                      examples[i]['animate'] = false;
                                      if(disposed) return;
                                      setState(() {});
                                    })
                                : Text(
                                    widget.examples[i].value,
                                    style: TextStyle(
                                      fontSize: 17.2,
                                      color: Colors.black54,
                                      // fontStyle: FontStyle.italic
                                    ),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              examples[i]['example'].translation,
                              style: TextStyle(
                                  fontSize: 17.2,
                                  color: Color(0xff51657F),
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              // ref.read(homeProvider.notifier).playVoice(
                              //     examples[i].voiceUrl,
                              //     shouldStop: false);
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.copy,
                                  size: 27,
                                  color: Colors.black54,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () async {
                              try {
                                await player
                                  .setUrl(examples[i]['example'].voiceUrl);
                                player.play();
                                examples[i]['duration'] = player.duration!;
                                examples[i]['animate'] = true;
                                if(disposed) return;
                                setState(() {});
                                
                              } catch (_) {
                                
                              }
                              
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(LineIcons.volumeUp,
                                    size: 32, color: Colors.black54)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

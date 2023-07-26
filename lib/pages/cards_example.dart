import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/pages/read_text_animation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:line_icons/line_icons.dart';

import '../services/global/global_service.dart';

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
  List<Map<String, dynamic>> examples = [];
  bool disposed = false;
  final backend = GetIt.I.get<GlobalService>();

  @override
  void initState() {
    examples = widget.examples.map((WordExample e) {
      return {
        'example': e, 
        'animate': false,
        'duration': Duration.zero,
        'show_translation': false,
        'is_playing': false
      };
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
      height: 210,
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
                  width: size.width * 0.70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 120,
                        child: ListView(
                          children: [
                            SizedBox(height: 10,),
                            if(!examples[i]['show_translation']) _text(i),                    
                            if(examples[i]['show_translation']) Text(
                              examples[i]['example'].translation,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
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
                              backend.sendScreenFlow('press translation index: $i');
                              examples[i]['show_translation'] = !examples[i]['show_translation'];
                              setState(() {});
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.translate,
                                  size: 27,
                                  color: examples[i]['show_translation'] ? Colors.blue : Colors.black54,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () async {
                              try {
                                backend.sendScreenFlow('play example index: $i');
                                await player
                                  .setUrl(examples[i]['example'].voiceUrl);
                                player.play();
                                examples[i]['duration'] = player.duration!;
                                examples[i]['animate'] = true;                               
                                setState(() {});                                
                              } catch (_) {}
                              
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

  _text(i) {
    return examples[i]['animate']
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
            fontSize: 18,
            color: Colors.black54,
            // fontStyle: FontStyle.italic
          ),
        );
  }
}

import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/pages/example_controller.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

class ExampleWidget extends ConsumerStatefulWidget {
  const ExampleWidget(
      {Key? key,
      required this.example,
      required this.word,
      required this.onPlayStart,
      required this.onPlayEnd})
      : super(key: key);
  final QuestionExample example;
  final Word word;
  final VoidCallback onPlayStart;
  final VoidCallback onPlayEnd;

  @override
  ExampleWidgetState createState() => ExampleWidgetState();
}

class ExampleWidgetState extends ConsumerState<ExampleWidget> {
  final player = AudioPlayer();
  Size size = Size.zero;
  late ExampleState exampleState;
  final backend = GetIt.I.get<GlobalService>();

  @override
  void initState() {
    super.initState();
    String path = widget.example.voiceUrl;
    Config.MOCK ? player.setAsset(path) : player.setUrl(path);

    player.playerStateStream.listen((playerState) async {
      if (playerState.processingState == ProcessingState.completed) {
        await player.stop();
        ref.read(exampleProvider.notifier).exampleEndHandler();
      }
    });

    player.positionStream.listen((position) {
      final exElements = widget.example.subtitles;
      final wordList =
          widget.example.words.where((w) => w.id == widget.word.id).toList();

      List<String> words = wordList[0].forms;

      for (var i = 0; i < exElements.length; i++) {
        final start = exElements[i].start;
        final end = i + 1 < exElements.length ? exElements[i + 1].start : 99999;
        if (start <= position.inMilliseconds &&
            end > position.inMilliseconds &&
            exampleState.playedIndex != i) {
          exampleState.exampleArry = _buildExample(exElements[i].value, words);
          ref.read(exampleProvider.notifier).onExampleProgress(i);
          break;
        }
      }
    });
  }

  String extractWord(String inputString) {
    final regex = RegExp(r'([a-zA-Z]+)');
    final match = regex.firstMatch(inputString);

    if (match != null) {
      final word = match.group(1);
      return word!.toLowerCase();
    }

    return '';
  }

  List<Map> _buildExample(exampleText, List<String> targetWords) {
    final rr = exampleText.split(" ");

    List<Map> sentences = [];

    for (var elem in rr) {
      // print('(elem as String).toLowerCase().trim()::: ${(elem as String).toLowerCase().trim()}');
      sentences.add({
        "text": elem,
        "highlight": targetWords.contains(extractWord((elem)))
      });
    }

    List<Map> result = [
      {'text': '', 'highlight': false}
    ];
    bool prev = false;
    bool highlight = false;
    int index = 0;

    for (var elem in sentences) {
      if (elem['highlight']) {
        highlight = true;
      } else {
        highlight = false;
      }

      if (prev == highlight) {
        result[index]['text'] += elem['text'] + ' ';
        result[index]['highlight'] = highlight;
      } else {
        prev = highlight;
        index++;
        result.add({'text': '', 'highlight': false});

        result[index]['text'] += elem['text'] + (index == 0 ? '' : ' ');
        result[index]['highlight'] = highlight;
      }
    }

    return result;
  }

  @override
  void dispose() {
    exampleState.playedIndex = -1;
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    exampleState = ref.watch(exampleProvider);
    return Container(
      margin: EdgeInsets.only(top: exampleState.isPlaying ? 0 : 40),
      child: exampleState.isPlaying ? _exampleExpanded() : _seeExampleBtn(),
    );
  }

  _seeExampleBtn() {
    return InkWell(
      onTap: () async {
        backend.sendScreenFlow('play example');
        widget.onPlayStart();
        await player.seek(Duration(seconds: 0));
        player.play();
        ref.read(exampleProvider.notifier).playExample();
      },
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: Duration(
          milliseconds: 400,
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17
            // vertical: homeState.exampleAnimated ? 13 : 10,
            // horizontal: homeState.exampleAnimated ? 23 : 17
            ),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10)),
        // borderRadius:
        //     BorderRadius.circular(homeState.exampleAnimated ? 12 : 10)),
        child: Text(
          'Example',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              fontSize: 19),
          // fontSize: homeState.exampleAnimated ? 19 : 18),
        ),
      ),
    );
  }

  _exampleExpanded() {
    return SizedBox(
      width: size.width - 40,
      child: InkWell(
        onTap: () async {
          backend.sendScreenFlow('stop example');
          await player.stop();
          ref.read(exampleProvider.notifier).stopExample();
          widget.onPlayEnd();
        },
        child: Center(
          child: Container(
            width: size.width - 40,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: <TextSpan>[
                  ...List.generate(exampleState.exampleArry.length,
                      (int index) {
                    if (!exampleState.exampleArry[index]['highlight']) {
                      return TextSpan(
                          text: exampleState.exampleArry[index]['text'],
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ));
                    }

                    return TextSpan(
                        text: exampleState.exampleArry[index]['text'],
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:eng_mobile_app/data/models/question.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class ExampleWidget extends StatefulWidget {
//   const ExampleWidget(
//       {Key? key,
//       required this.example,
//       required this.word,
//       required this.onPlayStart,
//       required this.onPlayEnd})
//       : super(key: key);
//   final QuestionExample example;
//   final Word word;
//   final VoidCallback onPlayStart;
//   final VoidCallback onPlayEnd;

//   @override
//   State<ExampleWidget> createState() => _ExampleWidgetState();
// }

// class _ExampleWidgetState extends State<ExampleWidget> {
//   final player = AudioPlayer();
//   Size size = Size.zero;
//   List<Map> exampleArry = [];
//   bool isPlaying = false;
//   int playedIndex = 0;

//   @override
//   void initState() {
//     super.initState();

//     player.setAsset(widget.example.voiceUrl);

//     player.playerStateStream.listen((playerState) async {
//       if (playerState.processingState == ProcessingState.completed) {
//         await player.stop();
//         isPlaying = false;
//         playedIndex = 0;
//         setState(() {});
//       }
//     });

//     player.positionStream.listen((position) {
//       final exElements = widget.example.example;
//       for (var i = 0; i < exElements.length; i++) {
//         final start = exElements[i].start;
//         final end = i + 1 < exElements.length ? exElements[i + 1].start : 99999;
//         if (start <= position.inSeconds &&
//             end > position.inSeconds &&
//             playedIndex != i) {
//           exampleArry = _buildExample(exElements[i].value, widget.word.word);
//           playedIndex = i;
//           setState(() {});
//           break;
//         }
//       }
//     });
//   }

//   List<Map> _buildExample(exampleText, String targetSentence) {
//     final rr = exampleText.split(" ");

//     List<Map> sentences = [];

//     for (var elem in rr) {
//       sentences.add({
//         "text": elem,
//         "highlight": (elem as String).toLowerCase().trim() ==
//             targetSentence.toLowerCase().trim()
//       });
//     }

//     List<Map> result = [
//       {'text': '', 'highlight': false}
//     ];
//     bool prev = false;
//     bool highlight = false;
//     int index = 0;
//     for (var elem in sentences) {
//       if (elem['highlight']) {
//         highlight = true;
//       } else {
//         highlight = false;
//       }

//       if (prev == highlight) {
//         result[index]['text'] += ' ' + elem['text'];
//         result[index]['highlight'] = highlight;
//       } else {
//         prev = highlight;
//         index++;
//         result.add({'text': '', 'highlight': false});

//         result[index]['text'] += ' ' + elem['text'];
//         result[index]['highlight'] = highlight;
//       }
//     }

//     return result;
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return isPlaying ? _exampleExpanded() : _seeExampleBtn();
//   }

//   _seeExampleBtn() {
//     print('btn ⚪️⚪️⚪️');
//     return InkWell(
//       onTap: () async {
//         widget.onPlayStart();        
//         await player.play();
//         isPlaying = true;
//         print('sefueeeeeeee ⚪️⚪️');
//         setState(() {});
//       },
//       child: AnimatedContainer(
//         curve: Curves.ease,
//         duration: Duration(
//           milliseconds: 400,
//         ),
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17
//             // vertical: homeState.exampleAnimated ? 13 : 10,
//             // horizontal: homeState.exampleAnimated ? 23 : 17
//             ),
//         decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.9),
//             borderRadius: BorderRadius.circular(10)),
//         // borderRadius:
//         //     BorderRadius.circular(homeState.exampleAnimated ? 12 : 10)),
//         child: Text(
//           'Example',
//           style: TextStyle(
//               fontWeight: FontWeight.normal,
//               color: Colors.black87,
//               fontSize: 18),
//           // fontSize: homeState.exampleAnimated ? 19 : 18),
//         ),
//       ),
//     );
//   }

//   _exampleExpanded() {
//     print('expanded ⚪️⚪️⚪️');
//     return SizedBox(
//       width: size.width - 40,
//       child: InkWell(
//         onTap: () async {
//           playedIndex = 0;
//           isPlaying = false;
//           await player.stop();
//           widget.onPlayEnd();
//           setState(() {});
//         },
//         child: Center(
//           child: Container(
//             width: size.width - 40,
//             padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(30)),
//             child: RichText(
//               textAlign: TextAlign.left,
//               text: TextSpan(
//                 children: <TextSpan>[
//                   ...List.generate(exampleArry.length, (int index) {
//                     if (!exampleArry[index]['highlight']) {
//                       return TextSpan(
//                           text: exampleArry[index]['text'] +
//                               (index == 0 ? '' : ' '),
//                           style: TextStyle(
//                             color: Colors.black87,
//                             fontWeight: FontWeight.normal,
//                             fontSize: 18,
//                           ));
//                     }

//                     return TextSpan(
//                         text: exampleArry[index]['text'],
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontSize: 25,
//                           fontWeight: FontWeight.normal,
//                         ));
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

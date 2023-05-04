// import 'package:eng_mobile_app/config.dart';
// import 'package:eng_mobile_app/data/models/question.dart';
// import 'package:eng_mobile_app/pages/quiz_screen.dart';
// import 'package:eng_mobile_app/pages/audio_bar_white.dart';
// import 'package:eng_mobile_app/pages/home/home_controller.dart';
// import 'package:eng_mobile_app/pages/story_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:line_icons/line_icons.dart';

// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});

//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends ConsumerState<HomePage> {
//   Size size = Size.zero;
//   List<Question> acts = [];
//   late HomeState homeState;

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitDown,
//       DeviceOrientation.portraitUp,
//     ]);

//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.black,
//       systemNavigationBarColor: Colors.black,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     homeState = ref.watch(homeProvider);

//     if (homeState.isLoading) {
//       return Container(
//           height: size.height,
//           width: size.width,
//           color: Colors.black,
//           child: Center(
//               child: SpinKitThreeBounce(
//             color: Colors.white,
//             size: 50.0,
//           )));
//     }

//     if (homeState.showQuizScreen) {
//       return SafeArea(
//         child: QuizScreen(
//           isWelcome: homeState.questionRoundCounter == 1,
//           onCreateUser: () {},
//           onStartQuiz: () {
//             ref.read(homeProvider.notifier).fetchQuestions();
//           },
//           onAddSentences: () {
//             // Navigator.pushNamed(context, Routes.SENTENCE_LIST);
//           },
//         ),
//       );
//     }

//     Widget contentPage = SafeArea(
//       child: Stack(
//         children: [
//           SizedBox(
//             height: size.height,
//             width: size.width,
//           ),

//           if (!homeState.question!.style.useGradient)
//             Positioned(
//               left: 0,
//               top: size.height * homeState.question!.style.imagePosition,
//               child: _image(),
//             ),
//           Positioned(
//             top: size.height * homeState.question!.style.questionPosition,
//             left: 0,
//             child: _question(),
//           ),
//           Positioned(
//             left: 20,
//             top: 30,
//             child: _challengeAccepted(),
//           ),
//           Positioned(
//             left: 0,
//             bottom: 10,
//             child: _ctrlBtns(),
//           ),
//           if(homeState.isRecording) Positioned(
//             left: size.width * 0.4,
//             bottom: 120,
//             child: _challengeBubble(),
//           ),
//           if (homeState.hasAudioSaved)
//             Positioned(
//               right: 20,
//               top: size.height * 0.57,
//               child: _audioBtn(),
//             ),
//           if (homeState.showExample)
//             Positioned(
//               right: 20,
//               top: 20,
//               child: _exampleExpanded(),
//             ),
//           if (!homeState.showExample)
//             Positioned(
//                 left: 0,
//                 top: size.height * 0.63,
//                 child: SizedBox(
//                   height: 70,
//                   width: 150,
//                   child: Center(
//                     child: _seeExampleBtn(),
//                   ),
//                 )),
//           // Positioned(
//           //   top: 10,
//           //   left: 15,
//           //   child: _progress(),
//           // ),
//           Positioned(
//             bottom: size.height * 0.23,
//             right: 15,
//             child: _step(),
//           ),
//           if (homeState.showFail) _overlayFail(),
//         ],
//       ),
//     );

//     if (homeState.question!.style.useGradient) {
//       return Container(
//           height: size.height,
//           width: size.width,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               stops: [0.1, 0.9],
//               colors: [
//                 homeState.question!.style.bottomGradientColor!.toColor(),
//                 homeState.question!.style.topGradientColor!.toColor()
//               ],
//             ),
//           ),
//           child: contentPage);
//     }

//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: Container(
//           height: size.height,
//           width: size.width,
//           color: homeState.question!.style.backgroundScreen.toColor(),
//           child: contentPage),
//     );
//   }

//   _step() {
//     return Transform.rotate(
//       angle: 0.2,
//       child: ClipPath(
//         clipper: TrapeziumClipper(),
//         child: Container(
//           height: 50,
//           width: 80,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.9),
//           ),
//           child: Center(
//             child: Text(
//               '${homeState.questionCounter}/${homeState.questions.length}',
//               style: TextStyle(
//                   color: Colors.black.withOpacity(0.8),
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _overlayFail() {
//     return Container(
//       width: size.width,
//       height: size.height,
//       color: Colors.black.withOpacity(0.7),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/fail.png',
//             width: 170,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           RichText(
//             textAlign: TextAlign.left,
//             text: TextSpan(
//               children: <TextSpan>[
//                 TextSpan(
//                     text: 'Must speak',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                       fontSize: 19,
//                     )),
//                 TextSpan(
//                     text: ' 15',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 TextSpan(
//                     text: ' seconds!',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                       fontSize: 19,
//                     )),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           )
//         ],
//       ),
//     );
//   }

//   _seeExampleBtn() {
//     return InkWell(
//       onTap: () {
//         ref.read(homeProvider.notifier).toggleExample();
//       },
//       child: AnimatedContainer(
//         curve: Curves.ease,
//         duration: Duration(
//           milliseconds: 400,
//         ),
//         padding: EdgeInsets.symmetric(
//             vertical: homeState.exampleAnimated ? 13 : 10,
//             horizontal: homeState.exampleAnimated ? 23 : 17),
//         decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.9),
//             borderRadius:
//                 BorderRadius.circular(homeState.exampleAnimated ? 12 : 10)),
//         child: Text(
//           'Example',
//           style: TextStyle(
//               fontWeight: FontWeight.normal,
//               color: Colors.black54,
//               fontSize: homeState.exampleAnimated ? 19 : 18),
//         ),
//       ),
//     );
//   }

//   _exampleExpanded() {
//     return SizedBox(
//       width: size.width - 40,
//       child: InkWell(
//         onTap: () {
//           ref.read(homeProvider.notifier).toggleExample();
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
//                   ...List.generate(homeState.exampleArry.length, (int index) {
//                     if (!homeState.exampleArry[index]['highlight']) {
//                       return TextSpan(
//                           text: homeState.exampleArry[index]['text'] +
//                               (index == 0 ? '' : ' '),
//                           style: TextStyle(
//                             color: Colors.black87,
//                             fontWeight: FontWeight.normal,
//                             fontSize: 18,
//                           ));
//                     }

//                     return TextSpan(
//                         text: homeState.exampleArry[index]['text'],
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

//   _audioBtn() {
//     return InkWell(
//       onTap: () {
//         if (homeState.blocker) return;
//         ref.read(homeProvider.notifier).toggleBlocker();
//         ref.read(homeProvider.notifier).playRecordedAudio();
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.black.withOpacity(0.3)),
//         child: AudioBarWhite(playAnimation: homeState.isPlayingRecordedAudio),
//       ),
//     );
//   }

//   _challengeBubble() {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 22),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           decoration: BoxDecoration(
//               color: Color(0xff44546A).withOpacity(1),
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(color: Color(0xff8497B0).withOpacity(0.4))),
//           child: Text(
//             homeState.bubbleChallengeSentence!,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//         Positioned(
//           left: 20,
//           bottom: 0,
//           child: RotatedBox(
//               quarterTurns: 1,
//               child:
//                   Icon(Icons.play_arrow, size: 35, color: Color(0xff44546A))),
//         )
//       ],
//     );
//   }

//   _challengeAccepted() {
//     String sentenceText = homeState.word!.word;
//     return InkWell(
//       onTap: () {
//         // _presentActionSheet();
//       },
//       child: Container(
//           width: size.width * 0.9,
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40),
//             color: homeState.question!.style.backgroundChallenge
//                 .toColor()
//                 .withOpacity(0.98),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 15,
//                   ),
//                   SizedBox(
//                     width: 200,
//                     child: Text(
//                       'Choose a WORD and use it in your answer 👇',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   homeState.word!.hasInfo && homeState.showMeaningBtn
//                       ? InkWell(
//                           onTap: () {
//                             _presentMeaningSheet(homeState.word!);
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.15),
//                                 shape: BoxShape.circle),
//                             child: Image.asset(
//                               'assets/question_mark.png',
//                               width: 27,
//                             ),
//                           ),
//                         )
//                       : SizedBox(
//                           width: 47,
//                           height: 52,
//                         ),

//                   // homeState.word!.meaning != null? IconButton(onPressed: () {
//                   //   _presentMeaningSheet(homeState.word!);
//                   // }, icon: Icon(Icons.search, color: Colors.white, size: 40)) :
//                   // SizedBox(width: 47, height: 48,),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       if (homeState.wordIndex == 0) return;
//                       ref.read(homeProvider.notifier).onNextWord(false);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Opacity(
//                         opacity: homeState.wordIndex == 0 ? 0.3 : 0.9,
//                         child: Image.asset(
//                           'assets/arrow_left.png',
//                           width: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 200,
//                     child: Center(
//                       child: Text(
//                         homeState.word!.word,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       if (homeState.wordIndex ==
//                           homeState.question!.words.length - 1) return;
//                       ref.read(homeProvider.notifier).onNextWord(true);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(3),
//                       child: Opacity(
//                         opacity: homeState.wordIndex ==
//                                 homeState.question!.words.length - 1
//                             ? 0.3
//                             : 0.9,
//                         child: Image.asset(
//                           'assets/arrow_right.png',
//                           width: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }

//   _challengeAccepted2() {
//     String sentenceText = homeState.word!.word;
//     return InkWell(
//       onTap: () {
//         // _presentActionSheet();
//       },
//       child: Container(
//           width: size.width * 0.9,
//           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40),
//             color: homeState.question!.style.backgroundChallenge.toColor(),
//           ),
//           child: Column(
//             children: [
//               RichText(
//                 textAlign: TextAlign.left,
//                 text: TextSpan(
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: 'Try to use this WORD in your answer 👇',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.normal,
//                           fontSize: 18,
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               AnimatedDefaultTextStyle(
//                 textAlign: TextAlign.center,
//                 child: Text(sentenceText),
//                 // style: homeState.challengeAnimated
//                 style: false
//                     ? TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                       )
//                     : TextStyle(
//                         color: Colors.white,
//                         // fontWeight: isGroup? FontWeight.w500 : FontWeight.normal,
//                         fontSize: 26,
//                       ),
//                 duration: Duration(milliseconds: 200),
//               ),
//             ],
//           )),
//     );
//   }

//   _challenge() {
//     return InkWell(
//       onTap: () {
//         // _presentActionSheet();
//       },
//       child: Container(
//         height: 80,
//         width: size.width * 0.9,
//         padding: EdgeInsets.symmetric(horizontal: 25),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: homeState.question!.style.backgroundChallenge.toColor(),
//         ),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Text(
//             '  Challenge Me❕',
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           Icon(Icons.play_arrow, size: 30, color: Colors.white)
//         ]),
//       ),
//     );
//   }

//   _image() {
//     return SizedBox(
//       height: size.height * 0.7,
//       width: size.width,
//       child: Center(
//         child: Stack(
//           children: [
//             Config.MOCK
//                 ? Image.asset(
//                     homeState.question!.imageUrl,
//                     width: size.width,
//                     fit: BoxFit.cover,
//                   )
//                 : Image.network(
//                     homeState.question!.imageUrl,
//                     width: size.width,
//                     fit: BoxFit.cover,
//                   )
//           ],
//         ),
//       ),
//     );
//   }

//   _question() {
//     TextStyle textStyle = TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 22,
//         overflow: TextOverflow.clip);

//     final Size sizeMe = (TextPainter(
//             text:
//                 TextSpan(text: homeState.question!.question, style: textStyle),
//             maxLines: 1,
//             textScaleFactor: MediaQuery.of(context).textScaleFactor,
//             textDirection: TextDirection.ltr)
//           ..layout())
//         .size;

//     bool multipleLines = sizeMe.width > size.width * 0.8;

//     return Stack(
//       children: [
//         Container(
//             color: Colors.black
//                 .withOpacity(homeState.question!.style.questionOpacity),
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//             margin: EdgeInsets.only(bottom: multipleLines ? 20 : 40),
//             width: size.width,
//             child: Center(
//                 child: homeState.loadingNextQuestion
//                     ? SpinKitThreeBounce(
//                         color: Colors.white,
//                         size: 35.0,
//                       )
//                     : Text(homeState.question!.question,
//                         textAlign: TextAlign.center, style: textStyle))),
//         if (homeState.showQuestionReplayBtn && !homeState.loadingNextQuestion)
//           Positioned(
//             right: 20,
//             bottom: 0,
//             child: InkWell(
//               onTap: () {
//                 ref.read(homeProvider.notifier).replayQuestion();
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.9),
//                     shape: BoxShape.circle),
//                 child: Icon(Icons.refresh, size: 30, color: Colors.black54),
//               ),
//             ),
//           )
//       ],
//     );
//   }

//   _ctrlBtns() {
//     return SizedBox(
//       width: size.width,
//       height: size.height * 0.15,
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//         _mySentencesBtn(),
//         homeState.isRecording ? _stopBtn() : _micBtn(),
//         _onNextBtn(),
//       ]),
//     );
//   }

//   _mySentencesBtn() {
//     return Stack(
//       children: [
//         SizedBox(
//           height: 80,
//           width: 70,
//           child: Center(
//             child: InkWell(
//               onTap: () {
//                 // Navigator.pushNamed(context, Routes.SENTENCE_LIST);
//               },
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.black.withOpacity(0.2),
//                 ),
//                 child: Icon(Icons.add, size: 40, color: Colors.white),
//                 // child: Image.asset('assets/user_14.png', width: 45),
//                 // child: Icon(LineIcons.stream, color: Colors.white, size: 40),
//               ),
//             ),
//           ),
//         ),
//         if (homeState.newSentences)
//           Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration:
//                     BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//                 child: Text(
//                   '5',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 14),
//                 ),
//               ))
//       ],
//     );
//   }

//   _onNextBtn() {
//     if (!homeState.showNextBtn) {
//       return SizedBox(
//         height: 50,
//         width: 56,
//       );
//     }
//     return InkWell(
//       onTap: () async {
//         if (!homeState.readyForNextQuestion) return;
//         await ref.read(homeProvider.notifier).onNextQuestion();
//       },
//       child: Container(
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.black.withOpacity(0.2),
//         ),
//         child: Icon(Icons.chevron_right, color: Colors.white, size: 45),
//       ),
//     );
//   }

//   _micBtn() {
//     return InkWell(
//       onTap: () {
//         ref.read(homeProvider.notifier).toggleRecording();
//         ref.read(homeProvider.notifier).bubbleChallengeSentenceTrigger();
//       },
//       child: Container(
//         padding: EdgeInsets.all(homeState.isRecording ? 27 : 12),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color:
//               Color(0xff8D57FF).withOpacity(homeState.isRecording ? 0.65 : 0.8),
//         ),
//         child: Icon(homeState.isRecording ? Icons.stop_circle : Icons.mic,
//             color: Colors.white, size: homeState.isRecording ? 40 : 70),
//       ),
//     );
//   }

//   _stopBtn() {
//     return InkWell(
//       onTap: () {
//         ref.read(homeProvider.notifier).toggleRecording();
//       },
//       child: Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Color(0xff8D57FF).withOpacity(0.9),
//         ),
//         child: Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Text(
//                 homeState.seconds.toString(),
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Container(
//               height: 70,
//               width: 1,
//               color: Colors.white.withOpacity(0.1),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Icon(Icons.stop_circle, color: Colors.white, size: 70),
//           ],
//         ),
//       ),
//     );
//   }

//   void _presentMeaningSheet(Word word) async {
//     Word wordCopy = word.copyWith();

//     showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.transparent,
//         isScrollControlled: true,
//         builder: (context) {
//           double speed = 1.2;

//           Widget story(StoryLine story) {
//             return StoryWidget(story);
//             //  Text('''As I left my house, I noticed that the sky was cloudy, and a few drops of rain started to fall.'''),
//             //         AudioProgressbar(
//             //             path: 'assets/scenarios/scenario_0002.mp3'),
//           }

//           Widget header(Word word) {
//             return Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(vertical: 14),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(word.word.toUpperCase(),
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                               if (word.translation != '')
//                                 Text('(${word.translation})',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.black54,
//                                     )),
//                             ],
//                           ),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               ref
//                                   .read(homeProvider.notifier)
//                                   .speak(word.word, speed: speed);
//                               speed = speed == 1.2 ? 0.5 : 1.2;
//                               setState(() {});
//                             },
//                             icon: Icon(LineIcons.volumeUp, size: 30))
//                       ],
//                     );
//           }

//           Widget image(String path) {
//             return Container(
//               padding: EdgeInsets.all(5),
//               child: Image.asset(
//                 path,
//                 width: 90,
//               ),
//             );
//           }

//           Widget definition(String def) {
//             return Container(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               width: double.infinity,
//               child: Text(def,
//                   style: TextStyle(fontSize: 18, color: Colors.black87)),
//             );
//           }

//           Widget collocation(List<String> collocations) {
//             return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('COLLOCATIONS',
//                       style: TextStyle(fontSize: 14, color: Colors.black54)),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ...List.generate(collocations.length, (i) {
//                     return Container(
//                       padding: EdgeInsets.symmetric(vertical: 1),
//                       width: double.infinity,
//                       child: Text('${i + 1}. ${collocations[i]}',
//                           style:
//                               TextStyle(fontSize: 17, color: Colors.black54)),
//                     );
//                   })
//                 ]);
//           }

//           Widget examples(List<WordExample> examples) {
//             if(examples.isEmpty) return Container();
//             return Container(
//               height: 210,
//               margin: EdgeInsets.symmetric(vertical: 5),
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: List.generate(examples.length, (i) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 3),
//                       child: Card(
//                         elevation: 3,
//                         child: Container(
//                           padding:
//                               EdgeInsets.only(top: 15, bottom:10, left: 15, right: 15),
//                           width: size.width * 0.75,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     examples[i].value,
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         color: Colors.black54,
//                                         fontStyle: FontStyle.italic),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     examples[i].translation,
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         color: Colors.blue,
//                                         fontStyle: FontStyle.italic),
//                                   ),                            
//                                 ],
//                               ),
//                               Container(
//                                 alignment: Alignment.centerRight,
//                                 child: InkWell(
//                                   borderRadius: BorderRadius.circular(50),
//                                   onTap: () {
//                                     if (examples[i].voiceUrl != null) {
//                                       ref.read(homeProvider.notifier).playVoice(
//                                           examples[i].voiceUrl!,
//                                           shouldStop: false);
//                                     } else {
//                                       ref
//                                           .read(homeProvider.notifier)
//                                           .speak(examples[i].value, speed: 0.97);
//                                     }
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.all(5),
//                                     child: Icon(LineIcons.volumeUp, size: 30)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//             );
//           }          

//           Widget explanation(List<Explanation> explanations) {
//             if(explanations.isEmpty) return Container();
//             return Column(
//               children: List.generate(explanations.length, (i) {
//                 return Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         explanations[i].value,
//                         style: TextStyle(fontSize: 18, color: Colors.black87),
//                       ),
//                     ),
//                     if(explanations[i].image != null) SizedBox(
//                       height: 15,
//                     ),
//                     if(explanations[i].image != null) Image.asset(
//                       explanations[i].image!,
//                       height: 80,
//                     ),
//                   ],
//                 );
//               })
//             );
//           }

//           return StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//             return Container(
//                 height: size.height*0.8,
//                 width: size.width,
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(children: [
//                     if(word.image != null) image(word.image!),
//                     header(word),
//                     if(word.story != null) story(word.story!),
//                     if(word.definition != null) definition(word.definition!),
//                     examples(word.examples),
//                     SizedBox(height: 8,),
//                     explanation(word.explanations),                   
//                     SizedBox(
//                       height: 50,
//                     ),
//                   ]),
//                 ));
//           });
//         });
//   }
// }

// class TrapeziumClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double radius = 10;
//     double pi = 3.141516;

//     Path path = Path()
//       ..lineTo(size.width * 0.93 - radius, 0)
//       ..arcTo(
//           Rect.fromCircle(
//               center: Offset(size.width * 0.93 - radius, radius),
//               radius: radius),
//           1.5 * pi,
//           0.5 * pi,
//           true)
//       ..lineTo(size.width, size.height - radius)
//       ..arcTo(
//           Rect.fromCircle(
//               center: Offset(size.width - radius, size.height - radius),
//               radius: radius),
//           0,
//           0.5 * pi,
//           false)
//       ..lineTo(radius * 1.5, size.height)
//       ..arcTo(
//           Rect.fromCircle(
//               center: Offset(radius * 1.5, size.height - radius),
//               radius: radius),
//           0.5 * pi,
//           0.5 * pi,
//           false)
//       ..lineTo(0, radius)
//       ..arcTo(Rect.fromCircle(center: Offset(radius, radius), radius: radius),
//           1 * pi, 0.5 * pi, false)
//       ..close();

//     return path;
//   }

//   @override
//   bool shouldReclip(TrapeziumClipper oldClipper) => false;
// }

// extension ColorExtension on String {
//   toColor() {
//     var hexColor = this.replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     if (hexColor.length == 8) {
//       return Color(int.parse("0x$hexColor"));
//     }
//   }
// }

// class DurationState {
//   const DurationState({this.progress, this.buffered, this.total});
//   final Duration? progress;
//   final Duration? buffered;
//   final Duration? total;
// }

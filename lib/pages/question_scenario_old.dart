// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:eng_mobile_app/data/models/question.dart';
// import 'package:eng_mobile_app/utils/helpers.dart';
// import 'package:flutter/material.dart';

// class QuestionScenario extends StatefulWidget {
//   const QuestionScenario({
//     super.key,
//     required this.onPlayVoice,
//     required this.question,
//     required this.onShowControls,
//   });

//   final Function(bool, String) onPlayVoice;
//   final Function(bool) onShowControls;
//   final Question question;

//   @override
//   State<QuestionScenario> createState() => _QuestionScenarioState();
// }

// class _QuestionScenarioState extends State<QuestionScenario> {
//   Size size = Size.zero;
//   final swiperControllerScenario = SwiperController();
//   bool showQuestionReplayBtn = true;
//   int detailIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     print('🚨🚨🚨🚨🚨🚨🚨🚨🚨');
//     // widget.onPlayVoice(true, widget.question.scenario!.details[0]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     double h = size.height * 0.9;
//     return SizedBox(
//       width: size.width,
//       height: h,
//       child: Swiper(
//         controller: swiperControllerScenario,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//               color: Color(0xff232629),
//               child: index == 0
//                   ? _scenarioQuestion(h, widget.question)
//                   : _scenarioOptions(h, widget.question.scenario!));
//         },
//         itemCount: 2,
//         loop: false,
//         customLayoutOption: CustomLayoutOption(
//           startIndex: 0,
//         ),
//         autoplay: false,
//         layout: SwiperLayout.DEFAULT,
//         onIndexChanged: (idx) {
//           widget.onShowControls(idx == 1);
//           setState(() {});
//         },
//         onTap: (idx) {
//           print('onTap');
//         },
//       ),
//     );
//   }

//   _scenarioQuestion(double height, Question question) {
//     return SizedBox(
//       height: height,
//       child: Stack(
//         children: [
//           CachedNetworkImage(
//               imageUrl: question.imageUrl,
//               width: size.width,
//               height: height,
//               fit: BoxFit.cover),
//           Positioned(
//               top: size.height * 0.15,
//               left: 0,
//               child: _questionText(question.scenario!.details)),
//           Positioned(
//               top: 0,
//               left: 0,
//               child: _titleScenario(question.scenario!.title)
//           ),
//           // Positioned(
//           //     top: size.height * 0.48,
//           //     right: 15,
//           //     child: _chevronBtn()
//           // ),
//           // Positioned(
//           //     top: size.height * 0.55,
//           //     left: 0,
//           //     child: SizedBox(
//           //       width: size.width,
//           //       child: Center(
//           //         child: _chevronBtn(),
//           //       ),
//           //     )
//           // ),
//           Positioned(
//               top: size.height * 0.78,
//               left: 0,
//               child: SizedBox(
//                 width: size.width,
//                 child: Center(
//                   child: _continueBtn(),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }

//   _titleScenario(String title) {
//     return Container(
//       width: size.width,
//       padding: EdgeInsets.only(top: 35, bottom: 15, left: 20, right: 20),
//       // color: Color(0xff232629),
//       // color: Color(0xff22222),
//       // color: Colors.black.withOpacity(0.3),
//       decoration: BoxDecoration(
//         // borderRadius: BorderRadius.circular(2),
//         gradient: LinearGradient(
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//           colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.8)],
//         ),
//       ),
//       child: Center(
//         child: Text(title, style: TextStyle(
//           fontSize: 22,
//           color: Colors.white,
//           fontWeight: FontWeight.bold
//         ),),
//       ),
//     );
//   }

//   _continueBtn() {
//     return InkWell(
//       onTap: () {
//         final scenario = widget.question.scenario!;
//         if(detailIndex == scenario.details.length - 1 ) {
//           swiperControllerScenario.move(1);
//         } else {
//           detailIndex++;
//           widget.onPlayVoice(true, scenario.details[detailIndex].voiceUrl);
//           setState(() {});
//         }        
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(color: Colors.white),
//             color: Colors.black.withOpacity(0.2)),
//         child: Text(
//           'CONTINUE',
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
//         ),
//       ),
//     );
//   }

//   _chevronBtn() {
//     return InkWell(
//       onTap: () {
//         swiperControllerScenario.move(1);
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             shape: BoxShape.circle, color: Colors.white.withOpacity(0.8)),
//         child: Icon(
//           Icons.chevron_right,
//           color: Colors.black87,
//           size: 30,
//         ),
//       ),
//     );
//   }

//   _questionText(List<ScenarioDetail> details) {
//     TextStyle textStyle = TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.normal,
//         fontSize: 22,
//         overflow: TextOverflow.clip);

//     final Size sizeMe = (TextPainter(
//             text: TextSpan(text: details[detailIndex].text, style: textStyle),
//             maxLines: 1,
//             textScaleFactor: MediaQuery.of(context).textScaleFactor,
//             textDirection: TextDirection.ltr)
//           ..layout())
//         .size;

//     bool multipleLines = sizeMe.width > size.width * 0.8;
//     return Stack(
//       children: [
//         Container(
//             color:
//                 Colors.black.withOpacity(widget.question.style.questionOpacity),
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//             margin: EdgeInsets.only(bottom: multipleLines ? 20 : 40),
//             width: size.width,
//             child: Center(
//                 child: Text(details[detailIndex].text,
//                     textAlign: TextAlign.center, style: textStyle))),
//         if (showQuestionReplayBtn)
//           Positioned(
//             right: 20,
//             bottom: 0,
//             child: InkWell(
//               onTap: () async {
//                 widget.onPlayVoice(true, details[detailIndex].voiceUrl);
//                 showQuestionReplayBtn = false;
//                 setState(() {});
//                 await sleep(300);
//                 showQuestionReplayBtn = true;
//                 setState(() {});
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

//   _scenarioOptions(double height, Scenario scenario) {
//     return SizedBox(
//       height: height,
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 // height: size.height * 0.16,
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//                 width: size.width,
//                 // color: Color(0xff232629),
//                 color: Colors.black,
//                 alignment: Alignment.center,
//                 child: Text(
//                   scenario.prompt,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Color(0xffBFBFBF),
//                     fontWeight: FontWeight.w500
//                   ),
//                 ),
//               ),
//               _itemScenario(scenario.options[0]),
//               _itemScenario(scenario.options[1]),
//               _itemScenario(scenario.options[2]),
//             ],
//           ),
//           if (false)
//             Positioned(
//                 top: size.height * 0.48,
//                 left: 15,
//                 child: InkWell(
//                   onTap: () {
//                     swiperControllerScenario.move(0);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white.withOpacity(0.8)),
//                     child: Icon(
//                       Icons.chevron_left,
//                       color: Colors.black87,
//                       size: 30,
//                     ),
//                   ),
//                 ))
//         ],
//       ),
//     );
//   }

//   _itemScenario(ScenarioOption option) {
//     return SizedBox(
//       height: size.height * 0.235,
//       width: size.width,
//       child: Stack(
//         children: [
//           CachedNetworkImage(
//               imageUrl: option.imageUrl,
//               // placeholder: (context, url) => Center(
//               //     child: SizedBox(
//               //       height: 40,
//               //       width: 40,
//               //       child: CircularProgressIndicator(color: Color(0xffBFBFBF)))),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//               width: size.width,
//               height: size.height * 0.235,
//               fit: BoxFit.cover),
//           Positioned(
//             top: size.height * 0.06,
//             left: 0,
//             child: Container(
//               width: size.width,
//               color: Colors.black.withOpacity(0.4),
//               padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
//               child: Text(
//                 option.text,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white.withOpacity(0.7),
//                   // fontWeight: FontWeight.bold
//                   // color: Color(0xffBFBFBF)
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

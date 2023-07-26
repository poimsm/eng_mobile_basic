// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:eng_mobile_app/pages/language_screen.dart';
// import 'package:eng_mobile_app/services/global/global_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// class FirstTimeScreen extends StatefulWidget {
//   const FirstTimeScreen(
//       {super.key,
//       required this.isWelcomeAgain,
//       required this.roundNumber,
//       required this.onStartQuiz,
//       required this.onCreateUser});

//   final bool isWelcomeAgain;
//   final int roundNumber;
//   final VoidCallback onStartQuiz;
//   final VoidCallback onCreateUser;

//   @override
//   State<FirstTimeScreen> createState() => _FirstTimeScreenState();
// }

// class _FirstTimeScreenState extends State<FirstTimeScreen> {
//   bool showAccountPopup = false;
//   Size size = Size.zero;
//   final backend = GetIt.I.get<GlobalService>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     // roundMsg = (messages..shuffle()).first;
//     return Container(
//       height: size.height,
//       width: size.width,
//       color: Colors.white,
//       padding:
//           EdgeInsets.symmetric(horizontal: size.width * 0.09, vertical: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('HOLA MUNDO'),             
//           _button(getBtnTitle()),
//         ],
//       ),
//     );
//   }

//   _titleFirstTime() {
//     return SizedBox(
//       width: 200,
//       child: Text(
//         'Choose mother language',
//         style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Color(0xff333F50)),
//       ),
//     );
//   }  

//   double getTopHeight() {
//     if (backend.isFirstTime) {
//       return size.height * 0.05;
//     }

//     if (widget.isWelcomeAgain) {
//       return size.height * 0.1;
//     }

//     return size.height * 0.1;
//   }

//   String getBtnTitle() {
//     if (backend.isFirstTime) {
//       return 'START QUIZ';
//     }

//     if (widget.isWelcomeAgain) {
//       return 'START QUIZ';
//     }

//     return 'PLAY AGAIN';
//   }

//   _lang() {
//     return SizedBox(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           InkWell(
//             onTap: () => presentLangActionSheet(),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Opacity(
//                   opacity: 0.8,
//                   child: CachedNetworkImage(
//                     imageUrl: backend.language['flag'],
//                     width: 30,
//                     placeholder: (context, url) => CircularProgressIndicator(
//                       color: Colors.black87,
//                     ),
//                     errorWidget: (context, url, error) => Icon(Icons.error),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text(backend.language['lang'].toUpperCase(),
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xff00003A),
//                         fontWeight: FontWeight.bold)),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Icon(Icons.arrow_drop_down)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   } 

//   _button(String text) {
//     return InkWell(
//       onTap: () async {
//         if (backend.isFirstTime) {
//           backend.sendScreenFlow(
//               'press start quiz - ${backend.language['lang']} - first time');
//           // await backend.setFirstTime(false);
//           widget.onStartQuiz();
//         }

//         backend
//             .sendScreenFlow('press start quiz - ${backend.language['lang']}');
//         widget.onStartQuiz();
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         margin: EdgeInsets.only(bottom: size.height < 700 ? 0 : 20),
//         decoration: BoxDecoration(
//           color: Color(0xff64E5D9),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SizedBox(),
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Icon(Icons.arrow_forward, size: 30, color: Colors.white)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/helpers.dart';

class RoundScreen extends StatefulWidget {
  const RoundScreen(
      {super.key,
      required this.isWelcome,
      required this.onStartQuiz,
      required this.onAddSentences,
      required this.onCreateUser});

  final bool isWelcome;
  final VoidCallback onStartQuiz;
  final VoidCallback onAddSentences;
  final VoidCallback onCreateUser;

  @override
  State<RoundScreen> createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen> {
  bool showAccountPopup = false;
  Size size = Size.zero;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _appbar(),
                SizedBox(height: 50,),
                _title(),
                SizedBox(height: 10,),
                _phrase(),
                SizedBox(height: 50,),
                _image(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width - 5,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _button(),
            ))
        ],
      ),
    );
  }

  _appbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 30, color: Colors.black),
          _languageBtn(),
        ],
      ),
    );
  }

  _languageBtn() {
    return Container();
  }

  _title() {
    return SizedBox(
      width: double.infinity,
      child: Text('You Rock!', style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),),
    );
  }

  _phrase() {
    return SizedBox(
      child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Congratz on completing Round',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                    )),
                TextSpan(
                    text: ' #14!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: " Are you ready to play more? Let's keep the fun going!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                    )),
              ],
            ),
          ),
    );
  }  

  _settings() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Icon(LineIcons.horizontalSliders, size: 35, color: Colors.white),
    );
  }

  _image() {
    return Image.asset('assets/cheers.jpg', height: 230,);
  }

  _button() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          Text('PLAY AGAIN', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
          Icon(Icons.arrow_forward, size: 30, color: Colors.white)
        ],
      ),
    );
    
  }
}

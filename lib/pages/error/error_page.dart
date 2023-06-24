import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff64E5D9),
      height: size.height,
      width: size.width,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Icon(Icons.warning, color: Colors.white, size: 170),
          // Image.asset('assets/alert_01.png', width: 120),
          SizedBox(
            height: 20,
          ),
          Text(
            'Apologies for the inconvenience! We apologize for the issue you encountered. Please try again at a later time, as we are actively working to resolve the problem.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),
          ),
        ],
      ),
    );
  }
}

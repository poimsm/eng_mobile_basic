import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAppVersionPage extends StatelessWidget {
  const NewAppVersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xff64E5D9),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height - 150,
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                Icon(Icons.rocket, color: Colors.white, size: 150),
                SizedBox(
                  height: size.height * 0.1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text('New update available',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    'To keep using this app please upgrade to the latest version available on PlayStore',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
          _button(),
        ],
      ),
    );
  }

  _button() {
    return InkWell(
      onTap: () async {
        try {
          final url = Uri.parse('market://details?id=com.sayoutloud.app001');
          launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );          
        } catch (_) {}
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UPDATE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff64E5D9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

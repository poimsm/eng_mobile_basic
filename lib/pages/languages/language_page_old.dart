import 'package:cached_network_image/cached_network_image.dart';
import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({
    super.key,
  });

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Size size = Size.zero;
  final backend = GetIt.I.get<GlobalService>();
  String langSelected = '';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        color: Color(0xffF9F9F9),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(),
                  _btn(),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              _languges(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return SizedBox(
      width: 200,
      child: Text(
        'Choose mother language',
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff333F50)),
      ),
    );
  }

  _languges() {
    return Column(
      children: List.generate(
        backend.languages.length,
        (i) => InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('lang', backend.languages[i]['lang']);
              langSelected = backend.languages[i]['lang'];
              setState(() {});
            },
            child: _langItem(backend.languages[i], langSelected)),
      ),
    );
  }

  _langItem(lang, String langSelected) {
    if (langSelected == lang['lang']) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            color: Color(0xff64E5D9), borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: lang['flag'],
              width: 40,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              lang['label'],
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: lang['flag'],
            width: 40,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            lang['label'],
            style: TextStyle(
                fontSize: 19,
                color: Color(0xff333F50),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  _btn() {
    if (langSelected == '') return Container();
    return InkWell(
      onTap: () {
        backend.setLanguage(langSelected);
        backend.sendScreenFlow('selected lang: $langSelected');
        Navigator.pushNamed(context, Routes.HOME);
        // Navigator.pushNamedAndRemoveUntil(
        //     context, Routes.HOME, (route) => false);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              'Next',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            Icon(Icons.chevron_right, size: 30, color: Colors.blue)
          ],
        ),
      ),
    );
  }
}

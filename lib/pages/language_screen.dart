import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({
    super.key,
    required this.language,
    required this.onLangSelect,
  });

  final String language;
  final Function(String) onLangSelect;

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool showAccountPopup = false;
  Size size = Size.zero;
  final backend = GetIt.I.get<GlobalService>();
  String langSelected = '';

  @override
  void initState() {
    langSelected = widget.language;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      // height: size.height,
      // width: size.width,
      color: Color(0xffF9F9F9),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _title(),
            SizedBox(
              height: size.height * 0.06,
            ),
            _languges(),
          ],
        ),
      ),
    );
  }

  _title() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Choose mother language',
        style: TextStyle(
            fontSize: 24,
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
              langSelected = backend.languages[i]['lang'];
              setState(() {});
              await sleep(150);
              widget.onLangSelect(langSelected);
              Navigator.pop(context);
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
            Image.network(
              lang['flag'],
              width: 40,
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
          Image.network(
            lang['flag'],
            width: 40,
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
}

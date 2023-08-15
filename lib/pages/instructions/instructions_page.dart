import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

class InstructionsPage extends StatefulWidget {
  const InstructionsPage({
    super.key,
  });

  @override
  State<InstructionsPage> createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  Size size = Size.zero;
  final backend = GetIt.I.get<GlobalService>();
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool ready = false;
  String text = '';
  // bool isPlaying = false;


  @override
  void initState() {
    super.initState();

    setAudio();

    player.playerStateStream.listen((playerState) async {
      if (playerState.processingState == ProcessingState.completed) {
        await player.stop();
        position = Duration.zero;
        ready = true;
        setState(() {});
      }
    });

    player.positionStream.listen((pos) {
      position = pos;

      final introElems = backend.intro;

      for (var i = 0; i < introElems.length; i++) {
        final start = introElems[i]['start'];
        final end = i + 1 < introElems.length ? introElems[i + 1]['start'] : 99999;
        if (start <= position.inMilliseconds &&
            end > position.inMilliseconds
            ) {
          text = introElems[i]['value'];
          break;
        }
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void setAudio() async {
    try {
      duration = (await player.setUrl('http://192.168.0.2/media/utils/intro.mp3'))!;
    } catch (_) {
      print('DO NOTHING 🚀🚀🚀🚀');
    }    
  }
  

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
                children: [
                _title(),
                _actionBtn(),
              ],),
              // Column(
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     Text('There are not bad or good answers', style: TextStyle(
              //   fontSize: 19,
              //   color: Colors.black87
              // ),),
              //   ],
              // ),
              SizedBox(
                height: size.height * 0.3,
              ),
              // Text(
              //   'There are not bad or good answers',
              //   style: TextStyle(fontSize: 20, color: Colors.black87),
              // ),
              // player.playing? SizedBox(
              //   width: double.infinity,
              //   height: 24,
              //   child: Text(
              //     text,
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 20, color: Colors.black87),
              //   ),
              // ):SizedBox(height: 24,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  player.playing? text : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              _audioBtn(),
              SizedBox(
                height: size.height * 0.3,
              ),
              // _button(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return SizedBox(
      // width: double.infinity,
      child: Text(
        'How to play',
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff333F50)),
      ),
    );
  }

  _actionBtn() {
    if(!ready) return Container();
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.HOME, (route) => false, arguments: {
              'asd': true
            });
      },
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
    );
  }

  _audioBtn() {
    return Stack(
      children: [
        SizedBox(
          height: 70,
          width: 90,
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 21, 121, 202)),
            )),
        Positioned(
            bottom: 5,
            child: InkWell(
              onTap: () async {
                print('entrooooo');
                // player.seek(Duration.zero);
                player.play();
              },
              child: Container(
                height: 60,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.blue),
                child: Icon(Icons.volume_up, color: Colors.white, size: 40),
              ),
            )),
        Positioned(
            bottom: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  print('entroooooooooooX');
                  player.seek(Duration.zero);
                  player.play();
                },
                child: Container(
                  width: 90,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 60,
                    width: _asd(90),
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.2)),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  double _asd(w) {
    double d = duration.inMilliseconds.toDouble();
    double p = position.inMilliseconds.toDouble();

    if(d == 0) return 0;
    return (w/d)*(p - d) + w;
  }

  _button() {
    return InkWell(
      onTap: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.HOME, (route) => false);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.only(bottom: size.height < 700 ? 0 : 20),
        decoration: BoxDecoration(
          color: Color(0xff64E5D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text(
              'START QUIZ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(Icons.arrow_forward, size: 30, color: Colors.white)
          ],
        ),
      ),
    );
  }
}

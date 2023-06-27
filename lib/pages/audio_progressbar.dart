import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProgressbar extends StatefulWidget {
  const AudioProgressbar(
      {Key? key, required this.path, this.onPositionChange, this.onPlayInit})
      : super(key: key);
  final String path;
  final Function(Duration)? onPositionChange;
  final VoidCallback? onPlayInit;

  @override
  State<AudioProgressbar> createState() => _AudioProgressbarState();
}

class _AudioProgressbarState extends State<AudioProgressbar> {
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool hasTouched = false;

  @override
  void initState() {
    super.initState();
    setAudio();
    // delayed();

    player.playerStateStream.listen((playerState) async {
      if (playerState.processingState == ProcessingState.completed) {
        await player.stop();
        setState(() {});
      }
    });

    player.positionStream.listen((duration) {
      position = duration;
      if (widget.onPositionChange != null) {
        widget.onPositionChange!(duration);
      }
      setState(() {});
    });

    // player.positionStream.listen((duration) {
    //   currentDuration = duration.inMilliseconds.toDouble();
    //   setState(() => currentTime = getDuration(currentDuration));
    // });

    // player.durationStream.listen((newDuration) {
    //   position = newDuration!;
    //   setState(() {});
    // });
  }

  void setAudio() async {
    try {
      duration = (Config.MOCK ? await player.setAsset(widget.path) : await player.setUrl(widget.path))!;
    } catch (e) {
      print('DO NOTHING 🚀🚀🚀🚀');
    }
    
  }

  Future delayed() async {
    await sleep(2000);
    isPlaying = true;
    initPlay = true;
    player.play();
    // setState(() {});
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  bool initPlay = false;

  @override
  Widget build(BuildContext context) {
    isPlaying = player.playing;
    return Stack(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            // activeTrackColor: Colors.red[700],
            // inactiveTrackColor: Colors.red[100],
            // trackShape: RoundedRectSliderTrackShape(),
            // trackHeight: 4.0,
            thumbShape: CustomSliderThumbCircle(isPlaying),
            // thumbColor: Colors.redAccent,
            // overlayColor: Colors.red.withAlpha(32),
            // overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            // tickMarkShape: RoundSliderTickMarkShape(),
            // activeTickMarkColor: Colors.red[700],
            // inactiveTickMarkColor: Colors.red[100],
            // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            // valueIndicatorColor: Colors.redAccent,
            // valueIndicatorTextStyle: TextStyle(
            //   color: Colors.white,
            // ),
          ),
          child: Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (val) async {
              if (isPlaying) {
                player.pause();
              } else {
                position = Duration(seconds: val.toInt());
                await player.seek(position);
                player.play();
              }

              setState(() {});
            },
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            child: InkWell(
              onTap: () async {
                
                widget.onPlayInit!();
                await delayed();
                // setState(() {});
                return;
                // if (isPlaying) {
                //   player.pause();
                //   setState(() {});
                //   return;
                // }
                // player.play();
                // if (!initPlay && widget.onPlayInit != null) {
                //   initPlay = true;
                //   widget.onPlayInit!();
                // }
                // setState(() {});
              },
              child: SizedBox(
                height: 50,
                width: 50,
              ),
            ))
      ],
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final bool isPLaying;

  const CustomSliderThumbCircle(this.isPLaying);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(30);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paintCirc = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    if (isPLaying) {
      canvas.drawCircle(center, 20, paintCirc);
      canvas.drawLine(Offset(center.dx - 5, center.dy - 9),
          Offset(center.dx - 5, center.dy + 9), paintLine);
      canvas.drawLine(Offset(center.dx + 5, center.dy - 9),
          Offset(center.dx + 5, center.dy + 9), paintLine);
    } else {
      canvas.drawCircle(center, 20, paintCirc);
      var path = Path();
      path.moveTo(center.dx - 5, center.dy);
      path.lineTo(center.dx - 5, center.dy + 10);
      path.lineTo(center.dx - 5 + 15, center.dy);
      path.lineTo(center.dx - 5, center.dy - 10);
      path.lineTo(center.dx - 5, center.dy);
      path.close();
      canvas.drawPath(path, Paint()..color = Colors.white);
    }
  }
}

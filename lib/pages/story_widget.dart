import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/pages/audio_progressbar.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget(this.story, {super.key});
  final StoryLine story;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  Duration position = Duration.zero;
  String subtitle = '';
  int playedIndex = -1;
  bool showStory = false;
  bool showStoryText = false;
  double sizeBox = 100;
  double parentSize = 50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: parentSize,
      width: 350,
      child: Stack(
        children: [
          if (showStory)
            SizedBox(
              width: 350,
              child: Opacity(
                opacity: showStoryText ? 0 : 1,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showStoryText = false;
                        showStory = false;
                        sizeBox = 100;
                        parentSize = 50;
                        setState(() {});
                      },
                      child: Image.network(
                        widget.story.image,
                        width: 220,
                        height: 220,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.5, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          if (showStoryText)
            Center(
                child: Image.asset(
              'assets/story_01.gif',
              width: 120,
              color: Colors.grey,
            )),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: 350,
              child: Opacity(
                opacity: showStoryText ? 0 : 1,
                child: AudioProgressbar(
                    path: widget.story.voiceUrl,
                    onPlayInit: () async {
                      try {
                        showStoryText = true;
                        parentSize = 250;
                        setState(() {});
                        await sleep(2000);
                        showStoryText = false;
                        showStory = true;
                        sizeBox = 330;
                        parentSize = 320;
                        setState(() {});
                      } catch (_) {
                        // Ignored
                      }
                    },
                    onPositionChange: (position) {
                      final subs = widget.story.subtitles!;
                      for (var i = 0; i < subs.length; i++) {
                        int start = subs[i].start;
                        int end = i + 1 < subs.length ? subs[i+1].start : 999999;
                        if (start <= position.inSeconds && end > position.inSeconds && playedIndex != i) {
                          subtitle = subs[i].value;
                          playedIndex++;
                          setState(() {});
                          break;
                        }
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

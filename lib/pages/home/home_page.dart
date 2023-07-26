import 'package:card_swiper/card_swiper.dart';
import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/pages/ai_text_widget.dart';
import 'package:eng_mobile_app/pages/cards_example.dart';
import 'package:eng_mobile_app/pages/example_widget.dart';
import 'package:eng_mobile_app/pages/audio_bar_white.dart';
import 'package:eng_mobile_app/pages/home/home_controller.dart';
import 'package:eng_mobile_app/pages/round_screen.dart';
import 'package:eng_mobile_app/pages/story_widget.dart';
import 'package:eng_mobile_app/services/global/global_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  Size size = Size.zero;
  List<Question> acts = [];
  late HomeState homeState;
  final backend = GetIt.I.get<GlobalService>();
  final swiperController = SwiperController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  Future initQuiz() async {
      bool resOk = await ref.read(homeProvider.notifier).fetchQuestions();
      if (!resOk) return;
      await backend.setFirstTime(false);
      backend.sendScreenFlow(
          'start question - ID ${homeState.question!.id}');
      swiperController.startAutoplay();
      await sleep(3500);
      swiperController.stopAutoplay();
    }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    homeState = ref.watch(homeProvider);

    print('HOME BUILD');

    if (homeState.isLoading) {
      return Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Center(
              child: SpinKitThreeBounce(
            color: Colors.white,
            size: 50.0,
          )));
    }

    if (homeState.showRoundScreen) {
      // final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
      // print('🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵');
      // print(arguments['asd']);

      // if(arguments['asd'] == null) {        
        return SafeArea(
        child: RoundScreen(
          isWelcomeAgain: homeState.questionRoundCounter == 0,
          roundNumber: homeState.questionRoundCounter,
          onCreateUser: () {},
          onStartQuiz: () {
            initQuiz();
          },
        ),
      );
      // } else {
      //   initQuiz();
      // }
    }

    Widget contentPage = SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Positioned(
            left: 0,
            top: size.height * 0.1,
            child: _image(),
          ),
          Positioned(
            top: size.height * 0.2,
            left: 0,
            child: _question(),
          ),
          Positioned(
            left: 20,
            top: size.height * 0.01,
            child: _challengeAccepted(),
          ),
          Positioned(
            left: 0,
            bottom: 5,
            child: _ctrlBtns(),
          ),
          Positioned(
            bottom: size.height * 0.18,
            right: 15,
            child: _step(),
          ),
          if (homeState.isRecording)
            Positioned(
              left: size.width * 0.4,
              bottom: 120,
              child: _challengeBubble(),
            ),
          Positioned(
            right: 20,
            top: size.height * 0.57,
            child: _audioBtn(),
          ),
          if (homeState.showExample)
            Positioned(
              left: 10,
              top: size.height * 0.68,
              child: ExampleWidget(
                example: homeState.example!,
                word: homeState.word!,
                onPlayStart: () {},
                onPlayEnd: () {},
              ),
            ),
          if (homeState.showFail) _overlayFail(),
        ],
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
          height: size.height,
          width: size.width,
          color: homeState.question!.style.backgroundScreen.toColor(),
          child: contentPage),
    );
  }

  _step() {
    return Container(
      height: 50,
      width: 120,
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.3)],
        ),
      ),
      alignment: Alignment.centerRight,
      child: Text(
        '${homeState.questionCounter}/${homeState.questions.length}',
        style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  _overlayFail() {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black.withOpacity(0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/fail.png',
            width: 170,
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Must speak',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                    )),
                TextSpan(
                    text: ' 15',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: ' seconds!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  _audioBtn() {
    return Opacity(
      opacity: homeState.hasAudioSaved ? 1 : 0,
      child: InkWell(
        onTap: () {
          backend.sendScreenFlow('play recorded audio');
          if (!homeState.hasAudioSaved) return;
          if (homeState.blocker) return;
          ref.read(homeProvider.notifier).toggleBlocker();
          ref.read(homeProvider.notifier).playRecordedAudio();
        },
        // child: Container(height: 30, width: 30, color: Colors.red),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3)),
          child: AudioBarWhite(playAnimation: homeState.isPlayingRecordedAudio),
        ),
      ),
    );
  }

  _challengeBubble() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 22),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Color(0xff44546A).withOpacity(1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Color(0xff8497B0).withOpacity(0.4))),
          child: Text(
            homeState.bubbleChallengeSentence!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 0,
          child: RotatedBox(
              quarterTurns: 1,
              child:
                  Icon(Icons.play_arrow, size: 35, color: Color(0xff44546A))),
        )
      ],
    );
  }

  _challengeAccepted() {
    return Container(
      width: size.width * 0.90,
      height: 110,
      child: Swiper(
        controller: swiperController,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Color(0xff2A262C)
                // color: Color(0xfff3f3f3),
                ),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HELP',
                      style: TextStyle(
                          fontSize: 15,
                          // color: Colors.black54
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      homeState.question!.words[index].word,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black.withOpacity(0.75)
                          color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      // color: Colors.grey.withOpacity(0.1),
                      shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/question_mark.png',
                    width: 27,
                    // color: Colors.black54,
                  ),
                )
              ],
            ),
          );
        },
        itemCount: homeState.question!.words.length,

        // pagination: SwiperPagination(),
        // control: SwiperControl(),
        // startIndex: 0,
        customLayoutOption: CustomLayoutOption(
          startIndex: 0,
          // stateCount: 3
        ),
        autoplay: false,
        itemWidth: size.width * 0.90,
        itemHeight: 100,
        layout: SwiperLayout.TINDER,
        onIndexChanged: (idx) {
          backend.sendScreenFlow('swipe word $idx');
          ref.read(homeProvider.notifier).onNextWordIndex(idx);
        },
        onTap: (idx) {
          print('taaaap');
          _presentMeaningSheet(homeState.word!);
        },
      ),
    );
  }

  _challengeAccepted2() {
    return Container(
        width: size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: homeState.question!.style.backgroundChallenge
              .toColor()
              .withOpacity(0.98),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Try to use this WORD in your answer 👇',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                homeState.showMeaningBtn
                    ? InkWell(
                        onTap: () {
                          _presentMeaningSheet(homeState.word!);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/question_mark.png',
                            width: 27,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 47,
                        height: 52,
                      ),

                // homeState.word!.meaning != null? IconButton(onPressed: () {
                //   _presentMeaningSheet(homeState.word!);
                // }, icon: Icon(Icons.search, color: Colors.white, size: 40)) :
                // SizedBox(width: 47, height: 48,),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (homeState.wordIndex == 0) return;
                    backend.sendScreenFlow('press next word left');
                    ref.read(homeProvider.notifier).onNextWord(false);
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Opacity(
                      opacity: homeState.wordIndex == 0 ? 0.25 : 0.9,
                      child: Image.asset(
                        'assets/arrow_left.png',
                        width: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Center(
                    child: Text(
                      homeState.word!.word,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    backend.sendScreenFlow('press next word right');
                    if (homeState.wordIndex ==
                        homeState.question!.words.length - 1) return;
                    ref.read(homeProvider.notifier).onNextWord(true);
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Opacity(
                      opacity: homeState.wordIndex ==
                              homeState.question!.words.length - 1
                          ? 0.25
                          : 0.9,
                      child: Image.asset(
                        'assets/arrow_right.png',
                        width: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  _image() {
    return SizedBox(
      height: size.height * 0.8,
      child: Center(
        child: Stack(
          children: [
            Config.MOCK
                ? Image.asset(
                    homeState.question!.imageUrl,
                    width: size.width,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    homeState.question!.imageUrl,
                    height: size.height * 0.8,
                    width: size.width,
                    fit: BoxFit.cover,
                  )
          ],
        ),
      ),
    );
  }

  _question() {
    TextStyle textStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        overflow: TextOverflow.clip);

    final Size sizeMe = (TextPainter(
            text:
                TextSpan(text: homeState.question!.question, style: textStyle),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;

    bool multipleLines = sizeMe.width > size.width * 0.8;

    return Stack(
      children: [
        Container(
            color: Colors.black
                .withOpacity(homeState.question!.style.questionOpacity),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            margin: EdgeInsets.only(bottom: multipleLines ? 20 : 40),
            width: size.width,
            child: Center(
                child: homeState.loadingNextQuestion
                    ? SpinKitThreeBounce(
                        color: Colors.white,
                        size: 35.0,
                      )
                    : Text(homeState.question!.question,
                        textAlign: TextAlign.center, style: textStyle))),
        if (homeState.showQuestionReplayBtn && !homeState.loadingNextQuestion)
          Positioned(
            right: 20,
            bottom: 0,
            child: InkWell(
              onTap: () {
                backend.sendScreenFlow('press replay question');
                ref.read(homeProvider.notifier).replayQuestion();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Icon(Icons.refresh, size: 30, color: Colors.black54),
              ),
            ),
          )
      ],
    );
  }

  _ctrlBtns() {
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _menuBtn(),
        homeState.isRecording ? _stopBtn() : _micBtn(),
        _onNextBtn(),
      ]),
    );
  }

  _menuBtn() {
    return Stack(
      children: [
        SizedBox(
          height: 80,
          width: 70,
          child: Center(
            child: InkWell(
              onTap: () {
                backend.sendScreenFlow('press menu button');
                // Navigator.pushNamed(context, Routes.SENTENCE_LIST);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(LineIcons.plus, size: 40, color: Colors.white),
                // child: Image.asset('assets/user_14.png', width: 45),
                // child: Icon(LineIcons.stream, color: Colors.white, size: 40),
              ),
            ),
          ),
        ),
        if (homeState.newSentences)
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Text(
                  '5',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
              ))
      ],
    );
  }

  _onNextBtn() {
    if (!homeState.showNextBtn) {
      return SizedBox(
        height: 50,
        width: 56,
      );
    }
    return InkWell(
      onTap: () async {
        if (!homeState.readyForNextQuestion) return;
        ref.read(homeProvider.notifier).onNextQuestion().then((question) {
          if (question == null) return;
          backend.sendScreenFlow(
              'press next question - ID ${homeState.question!.id}');
        });
        await sleep(50);
        swiperController.move(0);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(Icons.chevron_right, color: Colors.white, size: 45),
      ),
    );
  }

  _micBtn() {
    return InkWell(
      onTap: () {
        backend.sendScreenFlow('press mic');
        ref.read(homeProvider.notifier).toggleRecording();
        ref.read(homeProvider.notifier).bubbleChallengeSentenceTrigger();
      },
      child: Container(
        padding: EdgeInsets.all(homeState.isRecording ? 27 : 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              Color(0xff8D57FF).withOpacity(homeState.isRecording ? 0.65 : 0.8),
        ),
        child: Icon(homeState.isRecording ? Icons.stop_circle : Icons.mic,
            color: Colors.white, size: homeState.isRecording ? 40 : 70),
      ),
    );
  }

  _stopBtn() {
    return InkWell(
      onTap: () {
        backend.sendScreenFlow('press stop mic');
        ref.read(homeProvider.notifier).toggleRecording();
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff8D57FF).withOpacity(0.9),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                homeState.seconds.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.white.withOpacity(0.1),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.stop_circle, color: Colors.white, size: 70),
          ],
        ),
      ),
    );
  }

  void _presentMeaningSheet(Word word) async {
    backend.sendScreenFlow('open word: ${word.word}');
    await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          double speed = 1.2;

          Widget story(StoryLine story) {
            return StoryWidget(story);
          }

          Widget header(Word word) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(word.word.toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              )),
                          if (word.translation != '')
                            Text(word.translation,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                )),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(homeProvider.notifier)
                              .speak(word.word, speed: speed);
                          speed = speed == 1.2 ? 0.5 : 1.2;
                          setState(() {});
                        },
                        icon: Icon(LineIcons.volumeUp, size: 33)),
                  ],
                ),
                // AITextWidget(word.explanations),
              ],
            );
          }

          Widget minitaure(Miniature miniature) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Image.network(miniature.imageUrl,
                  height: size.width * 0.004 * miniature.height,
                  fit: BoxFit.cover),
            );
          }

          Widget definition(String def) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: Text(def,
                  style: TextStyle(fontSize: 18, color: Colors.black87)),
            );
          }

          bool showMore = false;

          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    if (!showMore) ...[
                      minitaure(word.miniature),
                      header(word),
                      if (word.story != null) story(word.story!),
                      definition(word.definition),
                      SizedBox(
                        height: 5,
                      ),
                      CardsExample(word.examples),
                      SizedBox(height: 10),
                      CustomBtn(
                        title: 'SHOW MORE',
                        onTap: () {
                          backend.sendScreenFlow('press show more');
                          showMore = true;
                          setState(() => {});
                        },
                      ),
                    ],
                    if (showMore) ...[
                      AITextWidget(
                        word.explanations,
                        onBack: () {
                          backend.sendScreenFlow('press show more back');
                          showMore = false;
                          setState(() => {});
                        },
                      ),
                    ],
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ));
          });
        });
    backend.sendScreenFlow('close word');
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;
    double pi = 3.141516;

    Path path = Path()
      ..lineTo(size.width * 0.93 - radius, 0)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width * 0.93 - radius, radius),
              radius: radius),
          1.5 * pi,
          0.5 * pi,
          true)
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius * 1.5, size.height)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(radius * 1.5, size.height - radius),
              radius: radius),
          0.5 * pi,
          0.5 * pi,
          false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromCircle(center: Offset(radius, radius), radius: radius),
          1 * pi, 0.5 * pi, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class DurationState {
  const DurationState({this.progress, this.buffered, this.total});
  final Duration? progress;
  final Duration? buffered;
  final Duration? total;
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: Colors.blue,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

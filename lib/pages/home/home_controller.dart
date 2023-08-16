import 'dart:async';
import 'dart:io';

import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/data/repositories/question/question_repository.dart';
import 'package:eng_mobile_app/data/repositories/question/question_repository_impl.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:text_to_speech/text_to_speech.dart';

int minSpeakingTime = 15; // seconds
int maxSpeakingTime = 35; // seconds
TextToSpeech tts = TextToSpeech();
final player = AudioPlayer();
final record = Record();
Timer? _timerRecording;
List<Timer?> voiceTrackerList = [];
List<Timer?> audioTrackerList = [];
Timer? _timerRecordedAudio;
Timer? _timerVoice;
int currentExamplePlay = 0;
//  final _swipperController = SwiperController();

class HomeState {
  HomeState({
    this.questions = const [],
    this.isRecording = false,
    this.loadingNextQuestion = false,
    this.question,
    this.word,
    this.wordIndex = 0,
    this.example,
    this.currentIndex = 0,
    this.hasAudioSaved = false,
    this.isPlayingRecordedAudio = false,
    this.isVoicePlaying = false,
    this.showCollected = false,
    this.showExample = false,
    this.exampleText = '',
    this.showQuestionExample = false,
    this.showFail = false,
    this.newSentences = false,
    this.exampleArry = const [],
    this.seconds = 0,
    this.exampleAnimated = false,
    this.showNextBtn = true,
    this.questionCounter = 1,
    this.showRoundScreen = true,
    this.questionRoundCounter = 0,
    this.readyForNextQuestion = false,
    this.recordVoiceBusy = false,
    this.recordAudioPath = '',
    this.recordTemAudioPath = 'audio_0.mp3',
    this.audioCounter = 0,
    this.readyPlayRecordedAudioTicket = true,
    this.isLoading = false,
    this.blocker = false,
    this.showMeaningBtn = true,
    this.showQuestionReplayBtn = true,
    this.runRoutineWhenTimeCompleted = true,
    this.showScenarioCtrls = false,
    this.redoActivities = false,
    // this.showLangScreen = false,
  });

  List<Question> questions;
  Question? question;
  int currentIndex;
  bool isRecording;
  bool isLoading;
  bool loadingNextQuestion;
  bool hasAudioSaved;
  bool isPlayingRecordedAudio;
  bool isVoicePlaying;
  bool showCollected;
  bool showExample;
  String exampleText;
  bool showQuestionExample;
  List<Map> exampleArry;
  bool showFail;
  bool newSentences;
  bool exampleAnimated;
  int seconds;
  bool showNextBtn;
  int questionCounter;
  bool showRoundScreen;
  int questionRoundCounter;
  bool readyForNextQuestion;
  bool recordVoiceBusy;
  String recordAudioPath;
  String recordTemAudioPath;
  int audioCounter;
  bool readyPlayRecordedAudioTicket;
  bool blocker;
  Word? word;
  QuestionExample? example;
  int wordIndex;
  bool showMeaningBtn;
  bool showQuestionReplayBtn;
  bool runRoutineWhenTimeCompleted;
  bool showScenarioCtrls;
  bool redoActivities;

  HomeState copyWith({
    questions,
    word,
    wordIndex,
    example,
    isRecording,
    isLoading,
    question,
    currentIndex,
    loadingNextQuestion,
    showChallenge,
    isPlayingRecordedAudio,
    isVoicePlaying,
    showCollected,
    showExample,
    exampleText,
    showQuestionExample,
    showFail,
    exampleArry,
    newSentences,
    challengeAnimated,
    seconds,
    exampleAnimated,
    showNextBtn,
    questionCounter,
    showRoundScreen,
    questionRoundCounter,
    readyForNextQuestion,
    showVideo,
    shortVideo,
    recordVoiceBusy,
    recordAudioPath,
    recordTemAudioPath,
    audioCounter,
    readyPlayRecordedAudioTicket,
    hasAudioSaved,
    blocker,
    showMeaningBtn,
    showQuestionReplayBtn,
    runRoutineWhenTimeCompleted,
    showScenarioCtrls,
    redoActivities,
  }) {
    return HomeState(
      questions: questions ?? this.questions,
      word: word ?? this.word,
      wordIndex: wordIndex ?? this.wordIndex,
      example: example ?? this.example,
      isRecording: isRecording ?? this.isRecording,
      isLoading: isLoading ?? this.isLoading,
      question: question ?? this.question,
      currentIndex: currentIndex ?? this.currentIndex,
      loadingNextQuestion: loadingNextQuestion ?? this.loadingNextQuestion,
      hasAudioSaved: hasAudioSaved ?? this.hasAudioSaved,
      isPlayingRecordedAudio:
          isPlayingRecordedAudio ?? this.isPlayingRecordedAudio,
      isVoicePlaying: isVoicePlaying ?? this.isVoicePlaying,
      showCollected: showCollected ?? this.showCollected,
      showExample: showExample ?? this.showExample,
      exampleText: exampleText ?? this.exampleText,
      showQuestionExample: showQuestionExample ?? this.showQuestionExample,
      showFail: showFail ?? this.showFail,
      exampleArry: exampleArry ?? this.exampleArry,
      newSentences: newSentences ?? this.newSentences,
      seconds: seconds ?? this.seconds,
      exampleAnimated: exampleAnimated ?? this.exampleAnimated,
      showNextBtn: showNextBtn ?? this.showNextBtn,
      questionCounter: questionCounter ?? this.questionCounter,
      showRoundScreen: showRoundScreen ?? this.showRoundScreen,
      questionRoundCounter: questionRoundCounter ?? this.questionRoundCounter,
      readyForNextQuestion: readyForNextQuestion ?? this.readyForNextQuestion,
      recordVoiceBusy: recordVoiceBusy ?? this.recordVoiceBusy,
      recordAudioPath: recordAudioPath ?? this.recordAudioPath,
      recordTemAudioPath: recordTemAudioPath ?? this.recordTemAudioPath,
      audioCounter: audioCounter ?? this.audioCounter,
      readyPlayRecordedAudioTicket:
          readyPlayRecordedAudioTicket ?? this.readyPlayRecordedAudioTicket,
      blocker: blocker ?? this.blocker,
      showMeaningBtn: showMeaningBtn ?? this.showMeaningBtn,
      showQuestionReplayBtn:
          showQuestionReplayBtn ?? this.showQuestionReplayBtn,
      runRoutineWhenTimeCompleted:
          runRoutineWhenTimeCompleted ?? this.runRoutineWhenTimeCompleted,
      showScenarioCtrls: showScenarioCtrls ?? this.showScenarioCtrls,
      redoActivities: redoActivities ?? this.redoActivities,
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this.questionRepository) : super(HomeState());

  bool micBlocked = false;
  QuestionRepository questionRepository;

  void toggleNewSentence() {
    state = state.copyWith(newSentences: true);
  }

  void toggleChallengeAnimated() async {
    state = state.copyWith(challengeAnimated: true);
    await sleep(1000);
    state = state.copyWith(challengeAnimated: false);
  }

  Future<bool> fetchQuestions() async {
    state = state.copyWith(isLoading: true, showRoundScreen: false);

    final questions = await questionRepository.getQuestions();

    if (questions.isEmpty) {
      state = state.copyWith(showRoundScreen: true, isLoading: false);
      return false;
    }

    state = state.copyWith(
        questionRoundCounter: state.questionRoundCounter + 1,
        questions: questions,
        question: questions[0],
        example: questions[0].example,
        showExample: true,
        isLoading: false);

    if (state.question!.type != 3) {
      state = state.copyWith(word: questions[0].words![0]);
    } else {
      // state = state.copyWith(word: []);
    }

    await sleep(400);
    delayedNextquestionTicket();

    if (state.question!.type == 3) {
      playVoice(state.question!.scenario!.parts[0].voiceUrl!,
          shouldStop: false);
    } else {
      playVoice(state.question!.voiceUrl, shouldStop: false);
    }

    state = state.copyWith(isLoading: false);

    return true;
  }

  delayedPlayRecordedAudioTicket() async {
    state = state.copyWith(readyPlayRecordedAudioTicket: false);
    await sleep(500);
    state = state.copyWith(readyPlayRecordedAudioTicket: true);
  }

  delayedNextquestionTicket() async {
    state = state.copyWith(readyForNextQuestion: false);
    await sleep(2050);
    state = state.copyWith(readyForNextQuestion: true);
  }

  Future<Question?> onNextQuestion() async {
    try {
      delayedNextquestionTicket();
      stopVoice();
      _stopRecordedAudio();

      state = state.copyWith(loadingNextQuestion: true);
      delayedShowNextBtn();

      if (state.questionCounter == state.questions.length) {
        state = state.copyWith(
          loadingNextQuestion: false,
          showRoundScreen: true,
          hasAudioSaved: false,
          currentIndex: 0,
          wordIndex: 0,
          questionCounter: 1,
          showScenarioCtrls: false,
        );
        return null;
      }

      state = state.copyWith(
        showExample: false,
      );

      await sleep(200);

      final index = state.currentIndex;

      state = state.copyWith(
        showChallenge: false,
        showQuestionExample: false,
        questionCounter: state.questionCounter + 1,
        hasAudioSaved: false,
        question: state.questions[index + 1],
        currentIndex: index + 1,
        example: state.questions[index + 1].example,
        showExample: true,
        showScenarioCtrls: false,
      );

      if (state.questions[index + 1].type != 3) {
        state = state.copyWith(
          word: state.questions[index + 1].words![0],
          wordIndex: 0,
        );
      }

      // _swipperController.move(0);

      await sleep(1000);
      state = state.copyWith(loadingNextQuestion: false);

      if (state.questions[index + 1].type == 3) {
        playVoice(state.question!.scenario!.parts[0].voiceUrl!,
            shouldStop: false);
      } else {
        playVoice(state.question!.voiceUrl, shouldStop: false);
      }

      await sleep(1000);
      state = state.copyWith(showChallenge: true);

      return state.question;
    } catch (_) {
      return null;
    }
  }

  Future<Question?> onQuestionBack() async {
    try {
      if (state.questionCounter == 1) {
        return null;
      }

      delayedNextquestionTicket();
      stopVoice();
      _stopRecordedAudio();

      state = state.copyWith(loadingNextQuestion: true);
      delayedShowNextBtn();

      state = state.copyWith(
        showExample: false,
      );

      await sleep(200);

      final index = state.currentIndex;

      state = state.copyWith(
        showChallenge: false,
        showQuestionExample: false,
        questionCounter: state.questionCounter - 1,
        hasAudioSaved: false,
        question: state.questions[index - 1],
        currentIndex: index - 1,
        example: state.questions[index - 1].example,
        showExample: true,
        showScenarioCtrls: false,
      );

      if (state.questions[index - 1].type != 3) {
        state = state.copyWith(
          word: state.questions[index - 1].words![0],
          wordIndex: 0,
        );
      }

      // _swipperController.move(0);

      await sleep(1000);
      state = state.copyWith(loadingNextQuestion: false);

      if (state.questions[index - 1].type == 3) {
        playVoice(state.question!.scenario!.parts[0].voiceUrl!,
            shouldStop: false);
      } else {
        playVoice(state.question!.voiceUrl, shouldStop: false);
      }

      await sleep(1000);
      state = state.copyWith(showChallenge: true);

      return state.question;
    } catch (_) {
      return null;
    }
  }

  Future<Question?> handleRedoActivities() async {
    try {
      state = state.copyWith(redoActivities: true);
      _stopRecordedAudio();
      _stopRecordingAndDoNothing();

      if (state.question!.type == 3) {
        return null;
      }

      stopVoice();

      state = state.copyWith(loadingNextQuestion: true);
      delayedShowNextBtn();

      state = state.copyWith(
        showExample: false,
      );

      await sleep(200);

      state = state.copyWith(
        showChallenge: false,
        showQuestionExample: false,
        questionCounter: 1,
        hasAudioSaved: false,
        question: state.questions[0],
        currentIndex: 0,
        example: state.questions[0].example,
        showExample: true,
        showScenarioCtrls: false,
        word: state.questions[0].words![0],
        wordIndex: 0,
      );

      await sleep(1000);
      state = state.copyWith(loadingNextQuestion: false);
      playVoice(state.question!.voiceUrl, shouldStop: false);

      return state.question;
    } catch (_) {
      return null;
    }
  }

  void delayedShowNextBtn() async {
    state = state.copyWith(showNextBtn: false);
    await sleep(300);

    state = state.copyWith(showNextBtn: true);
  }

  void _stopRecordingAndFail() {
    toggleFail();
    stopMic();
    state = state.copyWith(
      isRecording: false,
      runRoutineWhenTimeCompleted: false,
    );
  }

  void _stopRecordingAndSave() async {
    state = state.copyWith(
      isRecording: false,
      runRoutineWhenTimeCompleted: false,
      hasAudioSaved: false,
    );
    _setAudioStoragePath();
    await stopMic();
    await sleep(300);
    state = state.copyWith(
      hasAudioSaved: true,
    );
  }

  void _stopRecordingAndDoNothing() async {
    state = state.copyWith(
      isRecording: false,
      runRoutineWhenTimeCompleted: false,
      hasAudioSaved: false,
    );
    await stopMic();
  }

  void _startRecording() async {
    await stopVoice();
    await _stopRecordedAudio();
    recordMic();
  }

  void toggleRecording() async {
    if (state.recordVoiceBusy) return;
    recordVoiceBusyTracker();

    if (state.isRecording && state.seconds < minSpeakingTime) {
      return _stopRecordingAndFail();
    }

    if (state.isRecording && state.seconds > minSpeakingTime) {
      toggleBlocker();
      return _stopRecordingAndSave();
    }

    return _startRecording();
  }

  void recordVoiceBusyTracker() async {
    state = state.copyWith(recordVoiceBusy: true);
    await sleep(1000);
    state = state.copyWith(recordVoiceBusy: false);
  }

  void toggleFail() async {
    // if(!state.hasAudioSaved) {
    state = state.copyWith(showFail: true);
    await sleep(2500);
    state = state.copyWith(showFail: false);
    // }
  }

  void speak(String text, {double speed = 1.2}) async {
    if (text.isEmpty) return;
    tts.setVolume(1.0);
    tts.setRate(speed);
    tts.setPitch(1.0);
    tts.speak(text);
  }

  Future stopVoice() async {
    try {
      if (!state.isVoicePlaying) return;
      await player.stop();
      state = state.copyWith(isVoicePlaying: false);
    } catch (_) {}
  }

  playVoice(String url, {bool shouldStop = true}) async {
    try {
      if (state.isVoicePlaying) {
        await player.stop();
        state = state.copyWith(isVoicePlaying: false);
        if (_timerVoice != null) {
          _timerVoice!.cancel();
        }

        if (shouldStop) {
          return;
        }
      }

      final duration =
          Config.MOCK ? await player.setAsset(url) : await player.setUrl(url);
      _timerVoice = Timer(duration!, () {
        state = state.copyWith(isVoicePlaying: false);
      });

      state = state.copyWith(isVoicePlaying: true);
      await player.play();
    } catch (_) {}
  }

  void playRecordedAudio() async {
    try {
      if (!state.readyPlayRecordedAudioTicket) return;
      delayedPlayRecordedAudioTicket();

      if (state.isPlayingRecordedAudio) {
        await _stopRecordedAudio();
      } else {
        state = state.copyWith(isPlayingRecordedAudio: true);

        final duration = await player.setFilePath(await _getAudioPath());
        if (duration == null) return;

        _timerRecordedAudio = Timer(duration, () {
          state = state.copyWith(isPlayingRecordedAudio: false);
        });

        await player.play();
      }
    } catch (_) {
      state = state.copyWith(isPlayingRecordedAudio: false);
    }
  }

  Future _stopRecordedAudio() async {
    if (!state.isPlayingRecordedAudio) return;
    await player.stop();
    state = state.copyWith(isPlayingRecordedAudio: false);
    if (_timerRecordedAudio != null) {
      _timerRecordedAudio!.cancel();
    }
    return;
  }

  Future<String> _getAudioPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return '$appDocPath/${state.recordAudioPath}}';
  }

  Future<String> _getAudioStoragePath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return '$appDocPath/${state.recordTemAudioPath}}';
  }

  void _setAudioStoragePath() async {
    state = state.copyWith(
      recordAudioPath: state.recordTemAudioPath,
      audioCounter: state.audioCounter + 1,
      recordTemAudioPath: 'audio_${state.audioCounter + 1}.pm3',
    );
  }

  void playAudio2() async {
    try {
      if (state.isPlayingRecordedAudio) {
        await player.stop();
        state = state.copyWith(isPlayingRecordedAudio: false);
        return;
      }

      state = state.copyWith(isPlayingRecordedAudio: true);

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String audioPath = '$appDocPath/my_voice.pm3';
      // player.setFilePath(audioPath);
      // final duration=await player.setAsset('assets/a01.mp3');
      final duration = await player.setFilePath(audioPath);

      await player.play();

      int currentIndex = audioTrackerList.length;

      audioTrackerList.add(Timer(duration!, () {
        int innerIdx = currentIndex;
        if (innerIdx + 1 == audioTrackerList.length) {
          state = state.copyWith(isPlayingRecordedAudio: false);
        }
      }));
    } catch (_) {
      state = state.copyWith(isPlayingRecordedAudio: false);
    }
  }

  Future<void> stopMic() async {
    try {
      // if (await record.isRecording()) {
      if (_timerRecording != null) {
        _timerRecording!.cancel();
        state = state.copyWith(seconds: 0);
      }
      await record.stop();
    } catch (_) {}
  }

  void recordMic() async {
    if (await record.hasPermission()) {
      if (await record.isRecording()) {
        await record.stop();
      }

      state = state.copyWith(
        isRecording: true,
        runRoutineWhenTimeCompleted: true,
      );

      await record.start(
        path: await _getAudioStoragePath(),
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );

      triggerRecordTracker();
    }
  }

  triggerRecordTracker() async {
    _timerRecording = Timer.periodic(Duration(seconds: 1), (timer) async {
      state = state.copyWith(seconds: state.seconds + 1);

      if (state.seconds == maxSpeakingTime &&
          state.runRoutineWhenTimeCompleted) {
        await record.stop();
        bool shouldHaveSavedAudio = state.isRecording ? true : false;
        state = state.copyWith(
            hasAudioSaved: false, isRecording: false, seconds: 0);
        await stopMic();
        await sleep(500);

        if (shouldHaveSavedAudio) {
          state = state.copyWith(
            hasAudioSaved: true,
            isRecording: false,
          );
          _setAudioStoragePath();
        }

        timer.cancel();
      }

      if (state.seconds == maxSpeakingTime &&
          !state.runRoutineWhenTimeCompleted) {
        timer.cancel();
      }
    });
  }

  void toggleBlocker({int milliseconds = 800}) async {
    state = state.copyWith(blocker: true);
    await sleep(milliseconds);
    state = state.copyWith(blocker: false);
  }

  void onNextWord(bool advance) async {
    state = state.copyWith(showMeaningBtn: false);
    await sleep(200);

    final idx = state.wordIndex + (advance ? 1 : -1);

    state = state.copyWith(
        showMeaningBtn: true,
        word: state.question!.words![idx],
        wordIndex: idx);
  }

  void onNextWordIndex(int idx) async {
    state = state.copyWith(
      word: state.question!.words![idx],
      wordIndex: idx,
    );
  }

  void replayQuestion({String? url}) async {
    state = state.copyWith(showQuestionReplayBtn: false);
    await sleep(200);
    state = state.copyWith(showQuestionReplayBtn: true);

    if (url != null) {
      playVoice(url, shouldStop: false);
      return;
    }

    playVoice(state.question!.voiceUrl, shouldStop: false);
  }

  void get() async {
    state = state.copyWith(showQuestionReplayBtn: false);
    await sleep(300);
    state = state.copyWith(showQuestionReplayBtn: true);

    playVoice(state.question!.voiceUrl, shouldStop: false);
  }

  setScenarioCtrls(bool val) {
    state = state.copyWith(showScenarioCtrls: val);
  }

  setredoActivities(bool val) {
    state = state.copyWith(redoActivities: val);
  }
}

List<Map> _buildExample(exampleText, String targetSentence) {
  final rr = exampleText.split(" ");

  List<Map> sentences = [];

  for (var elem in rr) {
    sentences.add({
      "text": elem,
      "highlight": (elem as String).toLowerCase().trim() ==
          targetSentence.toLowerCase().trim()
    });
  }

  List<Map> result = [
    {'text': '', 'highlight': false}
  ];
  bool prev = false;
  bool highlight = false;
  int index = 0;
  for (var elem in sentences) {
    if (elem['highlight']) {
      highlight = true;
    } else {
      highlight = false;
    }

    if (prev == highlight) {
      result[index]['text'] += ' ' + elem['text'];
      result[index]['highlight'] = highlight;
    } else {
      prev = highlight;
      index++;
      result.add({'text': '', 'highlight': false});

      result[index]['text'] += ' ' + elem['text'];
      result[index]['highlight'] = highlight;
    }
  }

  return result;
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  return HomeNotifier(questionRepository);
});

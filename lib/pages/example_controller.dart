import 'package:flutter_riverpod/flutter_riverpod.dart';


class ExampleState {
  ExampleState({
    this.exampleArry = const [],
    this.isPlaying = false,
    this.playedIndex = -1,
    this.counter = 0,
  });

  List<Map> exampleArry;
  bool isPlaying;
  int playedIndex;
  int counter;

  ExampleState copyWith({
    exampleArry,
    isPlaying,
    playedIndex,
    counter,
  }) {
    return ExampleState(
      exampleArry: exampleArry ?? this.exampleArry,
      isPlaying: isPlaying ?? this.isPlaying,
      playedIndex: playedIndex ?? this.playedIndex,
      counter: counter ?? this.counter,
    );
  }
}

class ExampleNotifier extends StateNotifier<ExampleState> {
  ExampleNotifier() : super(ExampleState());

  void toggleNewSentence() {
    // state = state.copyWith(in: []);
  }

  void playExample() {
    print('playExampleeeeeeeeee 🐥🐥🐥🐥🐥🐥');
    state = state.copyWith(isPlaying: true, counter: state.counter++);
    print(state.isPlaying);
  }

  void stopExample() {
    state = state.copyWith(playedIndex: -1, isPlaying: false, counter: state.counter++);
  }

  void exampleEndHandler() {
    state = state.copyWith(playedIndex: -1, isPlaying: false, counter: state.counter++);
  }

  void onExampleProgress(int index) {
    print('onExampleProgress $index ⭕⭕');
    state = state.copyWith(playedIndex: index, counter: 100);
  }
}

final exampleProvider = StateNotifierProvider<ExampleNotifier, ExampleState>((ref) {
  return ExampleNotifier();
});

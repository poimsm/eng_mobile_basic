// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

class QuestionTypes {
  static int get quiz => 0;
  static int get describe => 1;
  static int get story => 2;
  static int get scenario => 3;
}

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required int type,
    @JsonKey(name: 'voice_url') @Default('-') String voiceUrl,
    @JsonKey(name: 'image_url') @Default('-') String imageUrl,
    QuestionExample? example,
    required Style style,
    List<Word>? words,
    Scenario? scenario,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Word with _$Word {
  const factory Word({
    required int id,
    required String word,
    required String translation,
    required String definition,
    required Miniature miniature,    
    @Default([]) List<WordExample> examples,
    @Default([]) List<Explanation> explanations,
    StoryLine? story,
  }) = _Word;

  factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
}

@freezed
class Scenario with _$Scenario {
  const factory Scenario({
    required String title,
    required String prompt,
    required List<ScenarioDetail> details,
    required List<ScenarioOption> options,
  }) = _Scenario;

  factory Scenario.fromJson(Map<String, Object?> json) =>
      _$ScenarioFromJson(json);
}

@freezed
class ScenarioDetail with _$ScenarioDetail {
  const factory ScenarioDetail({
    @JsonKey(name: 'voice_url') required String voiceUrl,
    required String text,
  }) = _ScenarioDetail;

  factory ScenarioDetail.fromJson(Map<String, Object?> json) =>
      _$ScenarioDetailFromJson(json);
}

@freezed
class ScenarioOption with _$ScenarioOption {
  const factory ScenarioOption({
    @JsonKey(name: 'image_url') required String imageUrl,

    required String text,
  }) = _ScenarioOption;

  factory ScenarioOption.fromJson(Map<String, Object?> json) =>
      _$ScenarioOptionFromJson(json);
}

@freezed
class StoryLine with _$StoryLine {
  const factory StoryLine({
    @JsonKey(name: 'voice_url') required String voiceUrl,
    required String image,
    List<Subtitle>? subtitles,
  }) = _StoryLine;

  factory StoryLine.fromJson(Map<String, Object?> json) =>
      _$StoryLineFromJson(json);
}

@freezed
class Miniature with _$Miniature {
  const factory Miniature({
    @JsonKey(name: 'image_url') required String imageUrl,
    required int height,
  }) = _Miniature;

  factory Miniature.fromJson(Map<String, Object?> json) =>
      _$MiniatureFromJson(json);
}

@freezed
class Subtitle with _$Subtitle {
  const factory Subtitle({
    required int start,
    required String value,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, Object?> json) =>
      _$SubtitleFromJson(json);
}

@freezed
class Explanation with _$Explanation {
  const factory Explanation({
    required String value,
    required String translation,
    String? image,
  }) = _Explanation;

  factory Explanation.fromJson(Map<String, Object?> json) =>
      _$ExplanationFromJson(json);
}

@freezed
class WordExample with _$WordExample {
  const factory WordExample({
    required String value,
    required String translation,
    @JsonKey(name: 'voice_url') required String voiceUrl,
  }) = _WordExample;

  factory WordExample.fromJson(Map<String, Object?> json) =>
      _$WordExampleFromJson(json);
}

@freezed
class QuestionExample with _$QuestionExample {
  const factory QuestionExample({
    @JsonKey(name: 'voice_url') required String voiceUrl,
    @Default([]) List<QuestionExampleWord> words,
    @Default([]) List<Subtitle> subtitles,
  }) = _QuestionExample;

  factory QuestionExample.fromJson(Map<String, Object?> json) =>
      _$QuestionExampleFromJson(json);
}

@freezed
class QuestionExampleWord with _$QuestionExampleWord {
  const factory QuestionExampleWord({
    required int id,
    required List<String> forms,
  }) = _QuestionExampleWord;

  factory QuestionExampleWord.fromJson(Map<String, Object?> json) =>
      _$QuestionExampleWordFromJson(json);
}

@freezed
class Style with _$Style {
  const factory Style({
    @JsonKey(name: 'background_screen') required String backgroundScreen,
    @JsonKey(name: 'background_challenge') required String backgroundChallenge,
    @JsonKey(name: 'question_opacity') required double questionOpacity,
  }) = _Style;

  factory Style.fromJson(Map<String, Object?> json) => _$StyleFromJson(json);
}

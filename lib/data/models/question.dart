// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String question,
    @JsonKey(name: 'voice_url') required String voiceUrl,
    @JsonKey(name: 'image_url') required String imageUrl,
    @Default([]) List<QuestionExample> examples,
    required Style style,
    required List<Word> words,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Word with _$Word {
  const factory Word({
    required int id,
    required String word,
    @JsonKey(name: 'has_info') required bool hasInfo,
    @Default('') String translation,
    String? image,
    String? definition,
    @Default([]) List<WordExample> examples,
    @Default([]) List<Explanation> explanations,
    StoryLine? story,
  }) = _Word;

  factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
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
    @JsonKey(name: 'voice_url') String? voiceUrl,
  }) = _WordExample;

  factory WordExample.fromJson(Map<String, Object?> json) =>
      _$WordExampleFromJson(json);
}

@freezed
class QuestionExample with _$QuestionExample {
  const factory QuestionExample({
    @JsonKey(name: 'word_id') required int wordId,
    @JsonKey(name: 'voice_url') required String voiceUrl,
    @Default([]) List<QuestionExampleElem> example,
  }) = _QuestionExample;

  factory QuestionExample.fromJson(Map<String, Object?> json) =>
      _$QuestionExampleFromJson(json);
}

@freezed
class QuestionExampleElem with _$QuestionExampleElem {
  const factory QuestionExampleElem({
    required int start,
    required String value,
  }) = _QuestionExampleElem;

  factory QuestionExampleElem.fromJson(Map<String, Object?> json) =>
      _$QuestionExampleElemFromJson(json);
}

@freezed
class Style with _$Style {
  const factory Style({
    @JsonKey(name: 'background_screen') required String backgroundScreen,
    @JsonKey(name: 'background_challenge') required String backgroundChallenge,
    @JsonKey(name: 'use_gradient') required bool useGradient,
    @JsonKey(name: 'bottom_gradient_color') String? bottomGradientColor,
    @JsonKey(name: 'top_gradient_color') String? topGradientColor,
    @JsonKey(name: 'question_position') required double questionPosition,
    @JsonKey(name: 'image_position') required double imagePosition,
    @JsonKey(name: 'question_font_size') required double questionFontSize,
    @JsonKey(name: 'question_opacity') required double questionOpacity,
  }) = _Style;

  factory Style.fromJson(Map<String, Object?> json) => _$StyleFromJson(json);
}

// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'question.freezed.dart';
// part 'question.g.dart';

// @freezed
// class Question with _$Question {
//   const factory Question({
//     required String question,
//     @JsonKey(name: 'voice_url') required String voiceUrl,
//     @JsonKey(name: 'image_url') required String imageUrl,
//     Example? example,
//     required Style style,
//     required List<Word> words,
//   }) = _Question;

//   factory Question.fromJson(Map<String, Object?> json) =>
//       _$QuestionFromJson(json);
// }

// @freezed
// class Word with _$Word {
//   const factory Word({
//     required int id,
//     required String word,
//     @Default('') String translation,
//     List<MeaningElem>? meaning,
//   }) = _Word;

//   factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
// }

// @freezed
// class MeaningElem with _$MeaningElem {
//   const factory MeaningElem({
//     required String type,
//     required bool hidden,
//     @Default('') String value,
//     String? image,
//     @Default([]) @JsonKey(name: 'collocation_list') List<String> collocationList,
//     @Default([]) @JsonKey(name: 'example_list') List<MeaningExample> exampleList,

//     @JsonKey(name: 'voice_url') String? voiceUrl,
//   }) = _MeaningElem;

//   factory MeaningElem.fromJson(Map<String, Object?> json) => _$MeaningElemFromJson(json);
// }

// @freezed
// class MeaningExample with _$MeaningExample {
//   const factory MeaningExample({
//     required String value,
//     @Default('') String translation,
//     @JsonKey(name: 'voice_url') required String voiceUrl,
//   }) = _MeaningExample;

//   factory MeaningExample.fromJson(Map<String, Object?> json) =>
//       _$MeaningExampleFromJson(json);
// }

// @freezed
// class Example with _$Example {
//   const factory Example({
//     required int id,
//     required List<Map> example,
//     @JsonKey(name: 'voice_url') required String voiceUrl,
//   }) = _Example;

//   factory Example.fromJson(Map<String, Object?> json) =>
//       _$ExampleFromJson(json);
// }

// @freezed
// class Style with _$Style {
//   const factory Style({
//     @JsonKey(name: 'background_screen') required String backgroundScreen,
//     @JsonKey(name: 'background_challenge') required String backgroundChallenge,
//     @JsonKey(name: 'use_gradient') required bool useGradient,
//     @JsonKey(name: 'bottom_gradient_color') String? bottomGradientColor,
//     @JsonKey(name: 'top_gradient_color') String? topGradientColor,
//     @JsonKey(name: 'question_position') required double questionPosition,
//     @JsonKey(name: 'image_position') required double imagePosition,
//     @JsonKey(name: 'question_font_size') required double questionFontSize,
//     @JsonKey(name: 'question_opacity') required double questionOpacity,
//   }) = _Style;

//   factory Style.fromJson(Map<String, Object?> json) => _$StyleFromJson(json);
// }

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      question: json['question'] as String,
      voiceUrl: json['voice_url'] as String,
      imageUrl: json['image_url'] as String,
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => QuestionExample.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      style: Style.fromJson(json['style'] as Map<String, dynamic>),
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'question': instance.question,
      'voice_url': instance.voiceUrl,
      'image_url': instance.imageUrl,
      'examples': instance.examples,
      'style': instance.style,
      'words': instance.words,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      id: json['id'] as int,
      word: json['word'] as String,
      hasInfo: json['has_info'] as bool,
      translation: json['translation'] as String? ?? '',
      image: json['image'] as String?,
      definition: json['definition'] as String?,
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) => WordExample.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      explanations: (json['explanations'] as List<dynamic>?)
              ?.map((e) => Explanation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      story: json['story'] == null
          ? null
          : StoryLine.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'has_info': instance.hasInfo,
      'translation': instance.translation,
      'image': instance.image,
      'definition': instance.definition,
      'examples': instance.examples,
      'explanations': instance.explanations,
      'story': instance.story,
    };

_$_StoryLine _$$_StoryLineFromJson(Map<String, dynamic> json) => _$_StoryLine(
      voiceUrl: json['voice_url'] as String,
      image: json['image'] as String,
      subtitles: (json['subtitles'] as List<dynamic>?)
          ?.map((e) => Subtitle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StoryLineToJson(_$_StoryLine instance) =>
    <String, dynamic>{
      'voice_url': instance.voiceUrl,
      'image': instance.image,
      'subtitles': instance.subtitles,
    };

_$_Subtitle _$$_SubtitleFromJson(Map<String, dynamic> json) => _$_Subtitle(
      start: json['start'] as int,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_SubtitleToJson(_$_Subtitle instance) =>
    <String, dynamic>{
      'start': instance.start,
      'value': instance.value,
    };

_$_Explanation _$$_ExplanationFromJson(Map<String, dynamic> json) =>
    _$_Explanation(
      value: json['value'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ExplanationToJson(_$_Explanation instance) =>
    <String, dynamic>{
      'value': instance.value,
      'image': instance.image,
    };

_$_WordExample _$$_WordExampleFromJson(Map<String, dynamic> json) =>
    _$_WordExample(
      value: json['value'] as String,
      translation: json['translation'] as String,
      voiceUrl: json['voice_url'] as String?,
    );

Map<String, dynamic> _$$_WordExampleToJson(_$_WordExample instance) =>
    <String, dynamic>{
      'value': instance.value,
      'translation': instance.translation,
      'voice_url': instance.voiceUrl,
    };

_$_QuestionExample _$$_QuestionExampleFromJson(Map<String, dynamic> json) =>
    _$_QuestionExample(
      wordId: json['word_id'] as int,
      voiceUrl: json['voice_url'] as String,
      example: (json['example'] as List<dynamic>?)
              ?.map((e) =>
                  QuestionExampleElem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_QuestionExampleToJson(_$_QuestionExample instance) =>
    <String, dynamic>{
      'word_id': instance.wordId,
      'voice_url': instance.voiceUrl,
      'example': instance.example,
    };

_$_QuestionExampleElem _$$_QuestionExampleElemFromJson(
        Map<String, dynamic> json) =>
    _$_QuestionExampleElem(
      start: json['start'] as int,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_QuestionExampleElemToJson(
        _$_QuestionExampleElem instance) =>
    <String, dynamic>{
      'start': instance.start,
      'value': instance.value,
    };

_$_Style _$$_StyleFromJson(Map<String, dynamic> json) => _$_Style(
      backgroundScreen: json['background_screen'] as String,
      backgroundChallenge: json['background_challenge'] as String,
      useGradient: json['use_gradient'] as bool,
      bottomGradientColor: json['bottom_gradient_color'] as String?,
      topGradientColor: json['top_gradient_color'] as String?,
      questionPosition: (json['question_position'] as num).toDouble(),
      imagePosition: (json['image_position'] as num).toDouble(),
      questionFontSize: (json['question_font_size'] as num).toDouble(),
      questionOpacity: (json['question_opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_StyleToJson(_$_Style instance) => <String, dynamic>{
      'background_screen': instance.backgroundScreen,
      'background_challenge': instance.backgroundChallenge,
      'use_gradient': instance.useGradient,
      'bottom_gradient_color': instance.bottomGradientColor,
      'top_gradient_color': instance.topGradientColor,
      'question_position': instance.questionPosition,
      'image_position': instance.imagePosition,
      'question_font_size': instance.questionFontSize,
      'question_opacity': instance.questionOpacity,
    };

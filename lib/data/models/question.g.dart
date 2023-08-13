// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as int,
      question: json['question'] as String,
      type: json['type'] as int,
      voiceUrl: json['voice_url'] as String? ?? '-',
      imageUrl: json['image_url'] as String? ?? '-',
      example: json['example'] == null
          ? null
          : QuestionExample.fromJson(json['example'] as Map<String, dynamic>),
      style: Style.fromJson(json['style'] as Map<String, dynamic>),
      words: (json['words'] as List<dynamic>?)
          ?.map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      scenario: json['scenario'] == null
          ? null
          : Scenario.fromJson(json['scenario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'type': instance.type,
      'voice_url': instance.voiceUrl,
      'image_url': instance.imageUrl,
      'example': instance.example,
      'style': instance.style,
      'words': instance.words,
      'scenario': instance.scenario,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      id: json['id'] as int,
      word: json['word'] as String,
      translation: json['translation'] as String,
      definition: json['definition'] as String,
      miniature: Miniature.fromJson(json['miniature'] as Map<String, dynamic>),
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
      'translation': instance.translation,
      'definition': instance.definition,
      'miniature': instance.miniature,
      'examples': instance.examples,
      'explanations': instance.explanations,
      'story': instance.story,
    };

_$_Scenario _$$_ScenarioFromJson(Map<String, dynamic> json) => _$_Scenario(
      title: json['title'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => ScenarioPart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScenarioToJson(_$_Scenario instance) =>
    <String, dynamic>{
      'title': instance.title,
      'parts': instance.parts,
    };

_$_ScenarioPart _$$_ScenarioPartFromJson(Map<String, dynamic> json) =>
    _$_ScenarioPart(
      text: json['text'] as String,
      type: json['type'] as String,
      voiceUrl: json['voice_url'] as String?,
      imageUrl: json['image_url'] as String?,
      showControls: json['show_controls'] as bool,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ScenarioPartOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScenarioPartToJson(_$_ScenarioPart instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'voice_url': instance.voiceUrl,
      'image_url': instance.imageUrl,
      'show_controls': instance.showControls,
      'options': instance.options,
    };

_$_ScenarioPartOption _$$_ScenarioPartOptionFromJson(
        Map<String, dynamic> json) =>
    _$_ScenarioPartOption(
      imageUrl: json['image_url'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_ScenarioPartOptionToJson(
        _$_ScenarioPartOption instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'text': instance.text,
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

_$_Miniature _$$_MiniatureFromJson(Map<String, dynamic> json) => _$_Miniature(
      imageUrl: json['image_url'] as String,
      height: json['height'] as int,
    );

Map<String, dynamic> _$$_MiniatureToJson(_$_Miniature instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'height': instance.height,
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
      translation: json['translation'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ExplanationToJson(_$_Explanation instance) =>
    <String, dynamic>{
      'value': instance.value,
      'translation': instance.translation,
      'image': instance.image,
    };

_$_WordExample _$$_WordExampleFromJson(Map<String, dynamic> json) =>
    _$_WordExample(
      value: json['value'] as String,
      translation: json['translation'] as String,
      voiceUrl: json['voice_url'] as String,
    );

Map<String, dynamic> _$$_WordExampleToJson(_$_WordExample instance) =>
    <String, dynamic>{
      'value': instance.value,
      'translation': instance.translation,
      'voice_url': instance.voiceUrl,
    };

_$_QuestionExample _$$_QuestionExampleFromJson(Map<String, dynamic> json) =>
    _$_QuestionExample(
      voiceUrl: json['voice_url'] as String,
      words: (json['words'] as List<dynamic>?)
              ?.map((e) =>
                  QuestionExampleWord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subtitles: (json['subtitles'] as List<dynamic>?)
              ?.map((e) => Subtitle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_QuestionExampleToJson(_$_QuestionExample instance) =>
    <String, dynamic>{
      'voice_url': instance.voiceUrl,
      'words': instance.words,
      'subtitles': instance.subtitles,
    };

_$_QuestionExampleWord _$$_QuestionExampleWordFromJson(
        Map<String, dynamic> json) =>
    _$_QuestionExampleWord(
      id: json['id'] as int,
      forms: (json['forms'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_QuestionExampleWordToJson(
        _$_QuestionExampleWord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forms': instance.forms,
    };

_$_Style _$$_StyleFromJson(Map<String, dynamic> json) => _$_Style(
      backgroundScreen: json['background_screen'] as String,
      backgroundChallenge: json['background_challenge'] as String,
      questionOpacity: (json['question_opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_StyleToJson(_$_Style instance) => <String, dynamic>{
      'background_screen': instance.backgroundScreen,
      'background_challenge': instance.backgroundChallenge,
      'question_opacity': instance.questionOpacity,
    };

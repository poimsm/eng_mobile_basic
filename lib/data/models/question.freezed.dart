// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  QuestionExample? get example => throw _privateConstructorUsedError;
  Style get style => throw _privateConstructorUsedError;
  List<Word>? get words => throw _privateConstructorUsedError;
  Scenario? get scenario => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int id,
      String question,
      int type,
      @JsonKey(name: 'voice_url') String voiceUrl,
      @JsonKey(name: 'image_url') String imageUrl,
      QuestionExample? example,
      Style style,
      List<Word>? words,
      Scenario? scenario});

  $QuestionExampleCopyWith<$Res>? get example;
  $StyleCopyWith<$Res> get style;
  $ScenarioCopyWith<$Res>? get scenario;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? type = null,
    Object? voiceUrl = null,
    Object? imageUrl = null,
    Object? example = freezed,
    Object? style = null,
    Object? words = freezed,
    Object? scenario = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as QuestionExample?,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Style,
      words: freezed == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>?,
      scenario: freezed == scenario
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as Scenario?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionExampleCopyWith<$Res>? get example {
    if (_value.example == null) {
      return null;
    }

    return $QuestionExampleCopyWith<$Res>(_value.example!, (value) {
      return _then(_value.copyWith(example: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StyleCopyWith<$Res> get style {
    return $StyleCopyWith<$Res>(_value.style, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScenarioCopyWith<$Res>? get scenario {
    if (_value.scenario == null) {
      return null;
    }

    return $ScenarioCopyWith<$Res>(_value.scenario!, (value) {
      return _then(_value.copyWith(scenario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String question,
      int type,
      @JsonKey(name: 'voice_url') String voiceUrl,
      @JsonKey(name: 'image_url') String imageUrl,
      QuestionExample? example,
      Style style,
      List<Word>? words,
      Scenario? scenario});

  @override
  $QuestionExampleCopyWith<$Res>? get example;
  @override
  $StyleCopyWith<$Res> get style;
  @override
  $ScenarioCopyWith<$Res>? get scenario;
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? type = null,
    Object? voiceUrl = null,
    Object? imageUrl = null,
    Object? example = freezed,
    Object? style = null,
    Object? words = freezed,
    Object? scenario = freezed,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as QuestionExample?,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Style,
      words: freezed == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>?,
      scenario: freezed == scenario
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as Scenario?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question implements _Question {
  const _$_Question(
      {required this.id,
      required this.question,
      required this.type,
      @JsonKey(name: 'voice_url') this.voiceUrl = '-',
      @JsonKey(name: 'image_url') this.imageUrl = '-',
      this.example,
      required this.style,
      final List<Word>? words,
      this.scenario})
      : _words = words;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final int id;
  @override
  final String question;
  @override
  final int type;
  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  final QuestionExample? example;
  @override
  final Style style;
  final List<Word>? _words;
  @override
  List<Word>? get words {
    final value = _words;
    if (value == null) return null;
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Scenario? scenario;

  @override
  String toString() {
    return 'Question(id: $id, question: $question, type: $type, voiceUrl: $voiceUrl, imageUrl: $imageUrl, example: $example, style: $style, words: $words, scenario: $scenario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.style, style) || other.style == style) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.scenario, scenario) ||
                other.scenario == scenario));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      type,
      voiceUrl,
      imageUrl,
      example,
      style,
      const DeepCollectionEquality().hash(_words),
      scenario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {required final int id,
      required final String question,
      required final int type,
      @JsonKey(name: 'voice_url') final String voiceUrl,
      @JsonKey(name: 'image_url') final String imageUrl,
      final QuestionExample? example,
      required final Style style,
      final List<Word>? words,
      final Scenario? scenario}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int get id;
  @override
  String get question;
  @override
  int get type;
  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  QuestionExample? get example;
  @override
  Style get style;
  @override
  List<Word>? get words;
  @override
  Scenario? get scenario;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  int get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;
  String get definition => throw _privateConstructorUsedError;
  Miniature get miniature => throw _privateConstructorUsedError;
  List<WordExample> get examples => throw _privateConstructorUsedError;
  List<Explanation> get explanations => throw _privateConstructorUsedError;
  StoryLine? get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call(
      {int id,
      String word,
      String translation,
      String definition,
      Miniature miniature,
      List<WordExample> examples,
      List<Explanation> explanations,
      StoryLine? story});

  $MiniatureCopyWith<$Res> get miniature;
  $StoryLineCopyWith<$Res>? get story;
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? translation = null,
    Object? definition = null,
    Object? miniature = null,
    Object? examples = null,
    Object? explanations = null,
    Object? story = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      miniature: null == miniature
          ? _value.miniature
          : miniature // ignore: cast_nullable_to_non_nullable
              as Miniature,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<WordExample>,
      explanations: null == explanations
          ? _value.explanations
          : explanations // ignore: cast_nullable_to_non_nullable
              as List<Explanation>,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryLine?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MiniatureCopyWith<$Res> get miniature {
    return $MiniatureCopyWith<$Res>(_value.miniature, (value) {
      return _then(_value.copyWith(miniature: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryLineCopyWith<$Res>? get story {
    if (_value.story == null) {
      return null;
    }

    return $StoryLineCopyWith<$Res>(_value.story!, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String word,
      String translation,
      String definition,
      Miniature miniature,
      List<WordExample> examples,
      List<Explanation> explanations,
      StoryLine? story});

  @override
  $MiniatureCopyWith<$Res> get miniature;
  @override
  $StoryLineCopyWith<$Res>? get story;
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res, _$_Word>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? translation = null,
    Object? definition = null,
    Object? miniature = null,
    Object? examples = null,
    Object? explanations = null,
    Object? story = freezed,
  }) {
    return _then(_$_Word(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      miniature: null == miniature
          ? _value.miniature
          : miniature // ignore: cast_nullable_to_non_nullable
              as Miniature,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<WordExample>,
      explanations: null == explanations
          ? _value._explanations
          : explanations // ignore: cast_nullable_to_non_nullable
              as List<Explanation>,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryLine?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word(
      {required this.id,
      required this.word,
      required this.translation,
      required this.definition,
      required this.miniature,
      final List<WordExample> examples = const [],
      final List<Explanation> explanations = const [],
      this.story})
      : _examples = examples,
        _explanations = explanations;

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final int id;
  @override
  final String word;
  @override
  final String translation;
  @override
  final String definition;
  @override
  final Miniature miniature;
  final List<WordExample> _examples;
  @override
  @JsonKey()
  List<WordExample> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  final List<Explanation> _explanations;
  @override
  @JsonKey()
  List<Explanation> get explanations {
    if (_explanations is EqualUnmodifiableListView) return _explanations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_explanations);
  }

  @override
  final StoryLine? story;

  @override
  String toString() {
    return 'Word(id: $id, word: $word, translation: $translation, definition: $definition, miniature: $miniature, examples: $examples, explanations: $explanations, story: $story)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.miniature, miniature) ||
                other.miniature == miniature) &&
            const DeepCollectionEquality().equals(other._examples, _examples) &&
            const DeepCollectionEquality()
                .equals(other._explanations, _explanations) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      word,
      translation,
      definition,
      miniature,
      const DeepCollectionEquality().hash(_examples),
      const DeepCollectionEquality().hash(_explanations),
      story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  const factory _Word(
      {required final int id,
      required final String word,
      required final String translation,
      required final String definition,
      required final Miniature miniature,
      final List<WordExample> examples,
      final List<Explanation> explanations,
      final StoryLine? story}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  int get id;
  @override
  String get word;
  @override
  String get translation;
  @override
  String get definition;
  @override
  Miniature get miniature;
  @override
  List<WordExample> get examples;
  @override
  List<Explanation> get explanations;
  @override
  StoryLine? get story;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}

Scenario _$ScenarioFromJson(Map<String, dynamic> json) {
  return _Scenario.fromJson(json);
}

/// @nodoc
mixin _$Scenario {
  String get title => throw _privateConstructorUsedError;
  List<ScenarioPart> get parts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioCopyWith<Scenario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioCopyWith<$Res> {
  factory $ScenarioCopyWith(Scenario value, $Res Function(Scenario) then) =
      _$ScenarioCopyWithImpl<$Res, Scenario>;
  @useResult
  $Res call({String title, List<ScenarioPart> parts});
}

/// @nodoc
class _$ScenarioCopyWithImpl<$Res, $Val extends Scenario>
    implements $ScenarioCopyWith<$Res> {
  _$ScenarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? parts = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      parts: null == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<ScenarioPart>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScenarioCopyWith<$Res> implements $ScenarioCopyWith<$Res> {
  factory _$$_ScenarioCopyWith(
          _$_Scenario value, $Res Function(_$_Scenario) then) =
      __$$_ScenarioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<ScenarioPart> parts});
}

/// @nodoc
class __$$_ScenarioCopyWithImpl<$Res>
    extends _$ScenarioCopyWithImpl<$Res, _$_Scenario>
    implements _$$_ScenarioCopyWith<$Res> {
  __$$_ScenarioCopyWithImpl(
      _$_Scenario _value, $Res Function(_$_Scenario) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? parts = null,
  }) {
    return _then(_$_Scenario(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      parts: null == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<ScenarioPart>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Scenario implements _Scenario {
  const _$_Scenario(
      {required this.title, required final List<ScenarioPart> parts})
      : _parts = parts;

  factory _$_Scenario.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioFromJson(json);

  @override
  final String title;
  final List<ScenarioPart> _parts;
  @override
  List<ScenarioPart> get parts {
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parts);
  }

  @override
  String toString() {
    return 'Scenario(title: $title, parts: $parts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Scenario &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_parts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScenarioCopyWith<_$_Scenario> get copyWith =>
      __$$_ScenarioCopyWithImpl<_$_Scenario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioToJson(
      this,
    );
  }
}

abstract class _Scenario implements Scenario {
  const factory _Scenario(
      {required final String title,
      required final List<ScenarioPart> parts}) = _$_Scenario;

  factory _Scenario.fromJson(Map<String, dynamic> json) = _$_Scenario.fromJson;

  @override
  String get title;
  @override
  List<ScenarioPart> get parts;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioCopyWith<_$_Scenario> get copyWith =>
      throw _privateConstructorUsedError;
}

ScenarioPart _$ScenarioPartFromJson(Map<String, dynamic> json) {
  return _ScenarioPart.fromJson(json);
}

/// @nodoc
mixin _$ScenarioPart {
  String get text => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_url')
  String? get voiceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_controls')
  bool get showControls => throw _privateConstructorUsedError;
  List<ScenarioPartOption>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioPartCopyWith<ScenarioPart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioPartCopyWith<$Res> {
  factory $ScenarioPartCopyWith(
          ScenarioPart value, $Res Function(ScenarioPart) then) =
      _$ScenarioPartCopyWithImpl<$Res, ScenarioPart>;
  @useResult
  $Res call(
      {String text,
      String type,
      @JsonKey(name: 'voice_url') String? voiceUrl,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'show_controls') bool showControls,
      List<ScenarioPartOption>? options});
}

/// @nodoc
class _$ScenarioPartCopyWithImpl<$Res, $Val extends ScenarioPart>
    implements $ScenarioPartCopyWith<$Res> {
  _$ScenarioPartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
    Object? voiceUrl = freezed,
    Object? imageUrl = freezed,
    Object? showControls = null,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      voiceUrl: freezed == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      showControls: null == showControls
          ? _value.showControls
          : showControls // ignore: cast_nullable_to_non_nullable
              as bool,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ScenarioPartOption>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScenarioPartCopyWith<$Res>
    implements $ScenarioPartCopyWith<$Res> {
  factory _$$_ScenarioPartCopyWith(
          _$_ScenarioPart value, $Res Function(_$_ScenarioPart) then) =
      __$$_ScenarioPartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String type,
      @JsonKey(name: 'voice_url') String? voiceUrl,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'show_controls') bool showControls,
      List<ScenarioPartOption>? options});
}

/// @nodoc
class __$$_ScenarioPartCopyWithImpl<$Res>
    extends _$ScenarioPartCopyWithImpl<$Res, _$_ScenarioPart>
    implements _$$_ScenarioPartCopyWith<$Res> {
  __$$_ScenarioPartCopyWithImpl(
      _$_ScenarioPart _value, $Res Function(_$_ScenarioPart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
    Object? voiceUrl = freezed,
    Object? imageUrl = freezed,
    Object? showControls = null,
    Object? options = freezed,
  }) {
    return _then(_$_ScenarioPart(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      voiceUrl: freezed == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      showControls: null == showControls
          ? _value.showControls
          : showControls // ignore: cast_nullable_to_non_nullable
              as bool,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ScenarioPartOption>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioPart implements _ScenarioPart {
  const _$_ScenarioPart(
      {required this.text,
      required this.type,
      @JsonKey(name: 'voice_url') this.voiceUrl,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'show_controls') required this.showControls,
      final List<ScenarioPartOption>? options})
      : _options = options;

  factory _$_ScenarioPart.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioPartFromJson(json);

  @override
  final String text;
  @override
  final String type;
  @override
  @JsonKey(name: 'voice_url')
  final String? voiceUrl;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'show_controls')
  final bool showControls;
  final List<ScenarioPartOption>? _options;
  @override
  List<ScenarioPartOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScenarioPart(text: $text, type: $type, voiceUrl: $voiceUrl, imageUrl: $imageUrl, showControls: $showControls, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScenarioPart &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.showControls, showControls) ||
                other.showControls == showControls) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type, voiceUrl, imageUrl,
      showControls, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScenarioPartCopyWith<_$_ScenarioPart> get copyWith =>
      __$$_ScenarioPartCopyWithImpl<_$_ScenarioPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioPartToJson(
      this,
    );
  }
}

abstract class _ScenarioPart implements ScenarioPart {
  const factory _ScenarioPart(
      {required final String text,
      required final String type,
      @JsonKey(name: 'voice_url') final String? voiceUrl,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'show_controls') required final bool showControls,
      final List<ScenarioPartOption>? options}) = _$_ScenarioPart;

  factory _ScenarioPart.fromJson(Map<String, dynamic> json) =
      _$_ScenarioPart.fromJson;

  @override
  String get text;
  @override
  String get type;
  @override
  @JsonKey(name: 'voice_url')
  String? get voiceUrl;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'show_controls')
  bool get showControls;
  @override
  List<ScenarioPartOption>? get options;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioPartCopyWith<_$_ScenarioPart> get copyWith =>
      throw _privateConstructorUsedError;
}

ScenarioPartOption _$ScenarioPartOptionFromJson(Map<String, dynamic> json) {
  return _ScenarioPartOption.fromJson(json);
}

/// @nodoc
mixin _$ScenarioPartOption {
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScenarioPartOptionCopyWith<ScenarioPartOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioPartOptionCopyWith<$Res> {
  factory $ScenarioPartOptionCopyWith(
          ScenarioPartOption value, $Res Function(ScenarioPartOption) then) =
      _$ScenarioPartOptionCopyWithImpl<$Res, ScenarioPartOption>;
  @useResult
  $Res call({@JsonKey(name: 'image_url') String imageUrl, String text});
}

/// @nodoc
class _$ScenarioPartOptionCopyWithImpl<$Res, $Val extends ScenarioPartOption>
    implements $ScenarioPartOptionCopyWith<$Res> {
  _$ScenarioPartOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScenarioPartOptionCopyWith<$Res>
    implements $ScenarioPartOptionCopyWith<$Res> {
  factory _$$_ScenarioPartOptionCopyWith(_$_ScenarioPartOption value,
          $Res Function(_$_ScenarioPartOption) then) =
      __$$_ScenarioPartOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'image_url') String imageUrl, String text});
}

/// @nodoc
class __$$_ScenarioPartOptionCopyWithImpl<$Res>
    extends _$ScenarioPartOptionCopyWithImpl<$Res, _$_ScenarioPartOption>
    implements _$$_ScenarioPartOptionCopyWith<$Res> {
  __$$_ScenarioPartOptionCopyWithImpl(
      _$_ScenarioPartOption _value, $Res Function(_$_ScenarioPartOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? text = null,
  }) {
    return _then(_$_ScenarioPartOption(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScenarioPartOption implements _ScenarioPartOption {
  const _$_ScenarioPartOption(
      {@JsonKey(name: 'image_url') required this.imageUrl, required this.text});

  factory _$_ScenarioPartOption.fromJson(Map<String, dynamic> json) =>
      _$$_ScenarioPartOptionFromJson(json);

  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  final String text;

  @override
  String toString() {
    return 'ScenarioPartOption(imageUrl: $imageUrl, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScenarioPartOption &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScenarioPartOptionCopyWith<_$_ScenarioPartOption> get copyWith =>
      __$$_ScenarioPartOptionCopyWithImpl<_$_ScenarioPartOption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScenarioPartOptionToJson(
      this,
    );
  }
}

abstract class _ScenarioPartOption implements ScenarioPartOption {
  const factory _ScenarioPartOption(
      {@JsonKey(name: 'image_url') required final String imageUrl,
      required final String text}) = _$_ScenarioPartOption;

  factory _ScenarioPartOption.fromJson(Map<String, dynamic> json) =
      _$_ScenarioPartOption.fromJson;

  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_ScenarioPartOptionCopyWith<_$_ScenarioPartOption> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryLine _$StoryLineFromJson(Map<String, dynamic> json) {
  return _StoryLine.fromJson(json);
}

/// @nodoc
mixin _$StoryLine {
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<Subtitle>? get subtitles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryLineCopyWith<StoryLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryLineCopyWith<$Res> {
  factory $StoryLineCopyWith(StoryLine value, $Res Function(StoryLine) then) =
      _$StoryLineCopyWithImpl<$Res, StoryLine>;
  @useResult
  $Res call(
      {@JsonKey(name: 'voice_url') String voiceUrl,
      String image,
      List<Subtitle>? subtitles});
}

/// @nodoc
class _$StoryLineCopyWithImpl<$Res, $Val extends StoryLine>
    implements $StoryLineCopyWith<$Res> {
  _$StoryLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voiceUrl = null,
    Object? image = null,
    Object? subtitles = freezed,
  }) {
    return _then(_value.copyWith(
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subtitles: freezed == subtitles
          ? _value.subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<Subtitle>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryLineCopyWith<$Res> implements $StoryLineCopyWith<$Res> {
  factory _$$_StoryLineCopyWith(
          _$_StoryLine value, $Res Function(_$_StoryLine) then) =
      __$$_StoryLineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'voice_url') String voiceUrl,
      String image,
      List<Subtitle>? subtitles});
}

/// @nodoc
class __$$_StoryLineCopyWithImpl<$Res>
    extends _$StoryLineCopyWithImpl<$Res, _$_StoryLine>
    implements _$$_StoryLineCopyWith<$Res> {
  __$$_StoryLineCopyWithImpl(
      _$_StoryLine _value, $Res Function(_$_StoryLine) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voiceUrl = null,
    Object? image = null,
    Object? subtitles = freezed,
  }) {
    return _then(_$_StoryLine(
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subtitles: freezed == subtitles
          ? _value._subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<Subtitle>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryLine implements _StoryLine {
  const _$_StoryLine(
      {@JsonKey(name: 'voice_url') required this.voiceUrl,
      required this.image,
      final List<Subtitle>? subtitles})
      : _subtitles = subtitles;

  factory _$_StoryLine.fromJson(Map<String, dynamic> json) =>
      _$$_StoryLineFromJson(json);

  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;
  @override
  final String image;
  final List<Subtitle>? _subtitles;
  @override
  List<Subtitle>? get subtitles {
    final value = _subtitles;
    if (value == null) return null;
    if (_subtitles is EqualUnmodifiableListView) return _subtitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StoryLine(voiceUrl: $voiceUrl, image: $image, subtitles: $subtitles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryLine &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._subtitles, _subtitles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, voiceUrl, image,
      const DeepCollectionEquality().hash(_subtitles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryLineCopyWith<_$_StoryLine> get copyWith =>
      __$$_StoryLineCopyWithImpl<_$_StoryLine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryLineToJson(
      this,
    );
  }
}

abstract class _StoryLine implements StoryLine {
  const factory _StoryLine(
      {@JsonKey(name: 'voice_url') required final String voiceUrl,
      required final String image,
      final List<Subtitle>? subtitles}) = _$_StoryLine;

  factory _StoryLine.fromJson(Map<String, dynamic> json) =
      _$_StoryLine.fromJson;

  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  String get image;
  @override
  List<Subtitle>? get subtitles;
  @override
  @JsonKey(ignore: true)
  _$$_StoryLineCopyWith<_$_StoryLine> get copyWith =>
      throw _privateConstructorUsedError;
}

Miniature _$MiniatureFromJson(Map<String, dynamic> json) {
  return _Miniature.fromJson(json);
}

/// @nodoc
mixin _$Miniature {
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiniatureCopyWith<Miniature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiniatureCopyWith<$Res> {
  factory $MiniatureCopyWith(Miniature value, $Res Function(Miniature) then) =
      _$MiniatureCopyWithImpl<$Res, Miniature>;
  @useResult
  $Res call({@JsonKey(name: 'image_url') String imageUrl, int height});
}

/// @nodoc
class _$MiniatureCopyWithImpl<$Res, $Val extends Miniature>
    implements $MiniatureCopyWith<$Res> {
  _$MiniatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MiniatureCopyWith<$Res> implements $MiniatureCopyWith<$Res> {
  factory _$$_MiniatureCopyWith(
          _$_Miniature value, $Res Function(_$_Miniature) then) =
      __$$_MiniatureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'image_url') String imageUrl, int height});
}

/// @nodoc
class __$$_MiniatureCopyWithImpl<$Res>
    extends _$MiniatureCopyWithImpl<$Res, _$_Miniature>
    implements _$$_MiniatureCopyWith<$Res> {
  __$$_MiniatureCopyWithImpl(
      _$_Miniature _value, $Res Function(_$_Miniature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? height = null,
  }) {
    return _then(_$_Miniature(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Miniature implements _Miniature {
  const _$_Miniature(
      {@JsonKey(name: 'image_url') required this.imageUrl,
      required this.height});

  factory _$_Miniature.fromJson(Map<String, dynamic> json) =>
      _$$_MiniatureFromJson(json);

  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  final int height;

  @override
  String toString() {
    return 'Miniature(imageUrl: $imageUrl, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Miniature &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MiniatureCopyWith<_$_Miniature> get copyWith =>
      __$$_MiniatureCopyWithImpl<_$_Miniature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiniatureToJson(
      this,
    );
  }
}

abstract class _Miniature implements Miniature {
  const factory _Miniature(
      {@JsonKey(name: 'image_url') required final String imageUrl,
      required final int height}) = _$_Miniature;

  factory _Miniature.fromJson(Map<String, dynamic> json) =
      _$_Miniature.fromJson;

  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  int get height;
  @override
  @JsonKey(ignore: true)
  _$$_MiniatureCopyWith<_$_Miniature> get copyWith =>
      throw _privateConstructorUsedError;
}

Subtitle _$SubtitleFromJson(Map<String, dynamic> json) {
  return _Subtitle.fromJson(json);
}

/// @nodoc
mixin _$Subtitle {
  int get start => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubtitleCopyWith<Subtitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtitleCopyWith<$Res> {
  factory $SubtitleCopyWith(Subtitle value, $Res Function(Subtitle) then) =
      _$SubtitleCopyWithImpl<$Res, Subtitle>;
  @useResult
  $Res call({int start, String value});
}

/// @nodoc
class _$SubtitleCopyWithImpl<$Res, $Val extends Subtitle>
    implements $SubtitleCopyWith<$Res> {
  _$SubtitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubtitleCopyWith<$Res> implements $SubtitleCopyWith<$Res> {
  factory _$$_SubtitleCopyWith(
          _$_Subtitle value, $Res Function(_$_Subtitle) then) =
      __$$_SubtitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, String value});
}

/// @nodoc
class __$$_SubtitleCopyWithImpl<$Res>
    extends _$SubtitleCopyWithImpl<$Res, _$_Subtitle>
    implements _$$_SubtitleCopyWith<$Res> {
  __$$_SubtitleCopyWithImpl(
      _$_Subtitle _value, $Res Function(_$_Subtitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? value = null,
  }) {
    return _then(_$_Subtitle(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subtitle implements _Subtitle {
  const _$_Subtitle({required this.start, required this.value});

  factory _$_Subtitle.fromJson(Map<String, dynamic> json) =>
      _$$_SubtitleFromJson(json);

  @override
  final int start;
  @override
  final String value;

  @override
  String toString() {
    return 'Subtitle(start: $start, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subtitle &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubtitleCopyWith<_$_Subtitle> get copyWith =>
      __$$_SubtitleCopyWithImpl<_$_Subtitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubtitleToJson(
      this,
    );
  }
}

abstract class _Subtitle implements Subtitle {
  const factory _Subtitle(
      {required final int start, required final String value}) = _$_Subtitle;

  factory _Subtitle.fromJson(Map<String, dynamic> json) = _$_Subtitle.fromJson;

  @override
  int get start;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_SubtitleCopyWith<_$_Subtitle> get copyWith =>
      throw _privateConstructorUsedError;
}

Explanation _$ExplanationFromJson(Map<String, dynamic> json) {
  return _Explanation.fromJson(json);
}

/// @nodoc
mixin _$Explanation {
  String get value => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExplanationCopyWith<Explanation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExplanationCopyWith<$Res> {
  factory $ExplanationCopyWith(
          Explanation value, $Res Function(Explanation) then) =
      _$ExplanationCopyWithImpl<$Res, Explanation>;
  @useResult
  $Res call({String value, String translation, String? image});
}

/// @nodoc
class _$ExplanationCopyWithImpl<$Res, $Val extends Explanation>
    implements $ExplanationCopyWith<$Res> {
  _$ExplanationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? translation = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExplanationCopyWith<$Res>
    implements $ExplanationCopyWith<$Res> {
  factory _$$_ExplanationCopyWith(
          _$_Explanation value, $Res Function(_$_Explanation) then) =
      __$$_ExplanationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String translation, String? image});
}

/// @nodoc
class __$$_ExplanationCopyWithImpl<$Res>
    extends _$ExplanationCopyWithImpl<$Res, _$_Explanation>
    implements _$$_ExplanationCopyWith<$Res> {
  __$$_ExplanationCopyWithImpl(
      _$_Explanation _value, $Res Function(_$_Explanation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? translation = null,
    Object? image = freezed,
  }) {
    return _then(_$_Explanation(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Explanation implements _Explanation {
  const _$_Explanation(
      {required this.value, required this.translation, this.image});

  factory _$_Explanation.fromJson(Map<String, dynamic> json) =>
      _$$_ExplanationFromJson(json);

  @override
  final String value;
  @override
  final String translation;
  @override
  final String? image;

  @override
  String toString() {
    return 'Explanation(value: $value, translation: $translation, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Explanation &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, translation, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExplanationCopyWith<_$_Explanation> get copyWith =>
      __$$_ExplanationCopyWithImpl<_$_Explanation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExplanationToJson(
      this,
    );
  }
}

abstract class _Explanation implements Explanation {
  const factory _Explanation(
      {required final String value,
      required final String translation,
      final String? image}) = _$_Explanation;

  factory _Explanation.fromJson(Map<String, dynamic> json) =
      _$_Explanation.fromJson;

  @override
  String get value;
  @override
  String get translation;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_ExplanationCopyWith<_$_Explanation> get copyWith =>
      throw _privateConstructorUsedError;
}

WordExample _$WordExampleFromJson(Map<String, dynamic> json) {
  return _WordExample.fromJson(json);
}

/// @nodoc
mixin _$WordExample {
  String get value => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordExampleCopyWith<WordExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordExampleCopyWith<$Res> {
  factory $WordExampleCopyWith(
          WordExample value, $Res Function(WordExample) then) =
      _$WordExampleCopyWithImpl<$Res, WordExample>;
  @useResult
  $Res call(
      {String value,
      String translation,
      @JsonKey(name: 'voice_url') String voiceUrl});
}

/// @nodoc
class _$WordExampleCopyWithImpl<$Res, $Val extends WordExample>
    implements $WordExampleCopyWith<$Res> {
  _$WordExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? translation = null,
    Object? voiceUrl = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordExampleCopyWith<$Res>
    implements $WordExampleCopyWith<$Res> {
  factory _$$_WordExampleCopyWith(
          _$_WordExample value, $Res Function(_$_WordExample) then) =
      __$$_WordExampleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      String translation,
      @JsonKey(name: 'voice_url') String voiceUrl});
}

/// @nodoc
class __$$_WordExampleCopyWithImpl<$Res>
    extends _$WordExampleCopyWithImpl<$Res, _$_WordExample>
    implements _$$_WordExampleCopyWith<$Res> {
  __$$_WordExampleCopyWithImpl(
      _$_WordExample _value, $Res Function(_$_WordExample) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? translation = null,
    Object? voiceUrl = null,
  }) {
    return _then(_$_WordExample(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordExample implements _WordExample {
  const _$_WordExample(
      {required this.value,
      required this.translation,
      @JsonKey(name: 'voice_url') required this.voiceUrl});

  factory _$_WordExample.fromJson(Map<String, dynamic> json) =>
      _$$_WordExampleFromJson(json);

  @override
  final String value;
  @override
  final String translation;
  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;

  @override
  String toString() {
    return 'WordExample(value: $value, translation: $translation, voiceUrl: $voiceUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordExample &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, translation, voiceUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordExampleCopyWith<_$_WordExample> get copyWith =>
      __$$_WordExampleCopyWithImpl<_$_WordExample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordExampleToJson(
      this,
    );
  }
}

abstract class _WordExample implements WordExample {
  const factory _WordExample(
          {required final String value,
          required final String translation,
          @JsonKey(name: 'voice_url') required final String voiceUrl}) =
      _$_WordExample;

  factory _WordExample.fromJson(Map<String, dynamic> json) =
      _$_WordExample.fromJson;

  @override
  String get value;
  @override
  String get translation;
  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  @JsonKey(ignore: true)
  _$$_WordExampleCopyWith<_$_WordExample> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionExample _$QuestionExampleFromJson(Map<String, dynamic> json) {
  return _QuestionExample.fromJson(json);
}

/// @nodoc
mixin _$QuestionExample {
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;
  List<QuestionExampleWord> get words => throw _privateConstructorUsedError;
  List<Subtitle> get subtitles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionExampleCopyWith<QuestionExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionExampleCopyWith<$Res> {
  factory $QuestionExampleCopyWith(
          QuestionExample value, $Res Function(QuestionExample) then) =
      _$QuestionExampleCopyWithImpl<$Res, QuestionExample>;
  @useResult
  $Res call(
      {@JsonKey(name: 'voice_url') String voiceUrl,
      List<QuestionExampleWord> words,
      List<Subtitle> subtitles});
}

/// @nodoc
class _$QuestionExampleCopyWithImpl<$Res, $Val extends QuestionExample>
    implements $QuestionExampleCopyWith<$Res> {
  _$QuestionExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voiceUrl = null,
    Object? words = null,
    Object? subtitles = null,
  }) {
    return _then(_value.copyWith(
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<QuestionExampleWord>,
      subtitles: null == subtitles
          ? _value.subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<Subtitle>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionExampleCopyWith<$Res>
    implements $QuestionExampleCopyWith<$Res> {
  factory _$$_QuestionExampleCopyWith(
          _$_QuestionExample value, $Res Function(_$_QuestionExample) then) =
      __$$_QuestionExampleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'voice_url') String voiceUrl,
      List<QuestionExampleWord> words,
      List<Subtitle> subtitles});
}

/// @nodoc
class __$$_QuestionExampleCopyWithImpl<$Res>
    extends _$QuestionExampleCopyWithImpl<$Res, _$_QuestionExample>
    implements _$$_QuestionExampleCopyWith<$Res> {
  __$$_QuestionExampleCopyWithImpl(
      _$_QuestionExample _value, $Res Function(_$_QuestionExample) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voiceUrl = null,
    Object? words = null,
    Object? subtitles = null,
  }) {
    return _then(_$_QuestionExample(
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<QuestionExampleWord>,
      subtitles: null == subtitles
          ? _value._subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<Subtitle>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionExample implements _QuestionExample {
  const _$_QuestionExample(
      {@JsonKey(name: 'voice_url') required this.voiceUrl,
      final List<QuestionExampleWord> words = const [],
      final List<Subtitle> subtitles = const []})
      : _words = words,
        _subtitles = subtitles;

  factory _$_QuestionExample.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionExampleFromJson(json);

  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;
  final List<QuestionExampleWord> _words;
  @override
  @JsonKey()
  List<QuestionExampleWord> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  final List<Subtitle> _subtitles;
  @override
  @JsonKey()
  List<Subtitle> get subtitles {
    if (_subtitles is EqualUnmodifiableListView) return _subtitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitles);
  }

  @override
  String toString() {
    return 'QuestionExample(voiceUrl: $voiceUrl, words: $words, subtitles: $subtitles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionExample &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            const DeepCollectionEquality()
                .equals(other._subtitles, _subtitles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      voiceUrl,
      const DeepCollectionEquality().hash(_words),
      const DeepCollectionEquality().hash(_subtitles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionExampleCopyWith<_$_QuestionExample> get copyWith =>
      __$$_QuestionExampleCopyWithImpl<_$_QuestionExample>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionExampleToJson(
      this,
    );
  }
}

abstract class _QuestionExample implements QuestionExample {
  const factory _QuestionExample(
      {@JsonKey(name: 'voice_url') required final String voiceUrl,
      final List<QuestionExampleWord> words,
      final List<Subtitle> subtitles}) = _$_QuestionExample;

  factory _QuestionExample.fromJson(Map<String, dynamic> json) =
      _$_QuestionExample.fromJson;

  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  List<QuestionExampleWord> get words;
  @override
  List<Subtitle> get subtitles;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionExampleCopyWith<_$_QuestionExample> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionExampleWord _$QuestionExampleWordFromJson(Map<String, dynamic> json) {
  return _QuestionExampleWord.fromJson(json);
}

/// @nodoc
mixin _$QuestionExampleWord {
  int get id => throw _privateConstructorUsedError;
  List<String> get forms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionExampleWordCopyWith<QuestionExampleWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionExampleWordCopyWith<$Res> {
  factory $QuestionExampleWordCopyWith(
          QuestionExampleWord value, $Res Function(QuestionExampleWord) then) =
      _$QuestionExampleWordCopyWithImpl<$Res, QuestionExampleWord>;
  @useResult
  $Res call({int id, List<String> forms});
}

/// @nodoc
class _$QuestionExampleWordCopyWithImpl<$Res, $Val extends QuestionExampleWord>
    implements $QuestionExampleWordCopyWith<$Res> {
  _$QuestionExampleWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? forms = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      forms: null == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionExampleWordCopyWith<$Res>
    implements $QuestionExampleWordCopyWith<$Res> {
  factory _$$_QuestionExampleWordCopyWith(_$_QuestionExampleWord value,
          $Res Function(_$_QuestionExampleWord) then) =
      __$$_QuestionExampleWordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<String> forms});
}

/// @nodoc
class __$$_QuestionExampleWordCopyWithImpl<$Res>
    extends _$QuestionExampleWordCopyWithImpl<$Res, _$_QuestionExampleWord>
    implements _$$_QuestionExampleWordCopyWith<$Res> {
  __$$_QuestionExampleWordCopyWithImpl(_$_QuestionExampleWord _value,
      $Res Function(_$_QuestionExampleWord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? forms = null,
  }) {
    return _then(_$_QuestionExampleWord(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      forms: null == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionExampleWord implements _QuestionExampleWord {
  const _$_QuestionExampleWord(
      {required this.id, required final List<String> forms})
      : _forms = forms;

  factory _$_QuestionExampleWord.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionExampleWordFromJson(json);

  @override
  final int id;
  final List<String> _forms;
  @override
  List<String> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  @override
  String toString() {
    return 'QuestionExampleWord(id: $id, forms: $forms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionExampleWord &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._forms, _forms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_forms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionExampleWordCopyWith<_$_QuestionExampleWord> get copyWith =>
      __$$_QuestionExampleWordCopyWithImpl<_$_QuestionExampleWord>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionExampleWordToJson(
      this,
    );
  }
}

abstract class _QuestionExampleWord implements QuestionExampleWord {
  const factory _QuestionExampleWord(
      {required final int id,
      required final List<String> forms}) = _$_QuestionExampleWord;

  factory _QuestionExampleWord.fromJson(Map<String, dynamic> json) =
      _$_QuestionExampleWord.fromJson;

  @override
  int get id;
  @override
  List<String> get forms;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionExampleWordCopyWith<_$_QuestionExampleWord> get copyWith =>
      throw _privateConstructorUsedError;
}

Style _$StyleFromJson(Map<String, dynamic> json) {
  return _Style.fromJson(json);
}

/// @nodoc
mixin _$Style {
  @JsonKey(name: 'background_screen')
  String get backgroundScreen => throw _privateConstructorUsedError;
  @JsonKey(name: 'background_challenge')
  String get backgroundChallenge => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_opacity')
  double get questionOpacity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StyleCopyWith<Style> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleCopyWith<$Res> {
  factory $StyleCopyWith(Style value, $Res Function(Style) then) =
      _$StyleCopyWithImpl<$Res, Style>;
  @useResult
  $Res call(
      {@JsonKey(name: 'background_screen') String backgroundScreen,
      @JsonKey(name: 'background_challenge') String backgroundChallenge,
      @JsonKey(name: 'question_opacity') double questionOpacity});
}

/// @nodoc
class _$StyleCopyWithImpl<$Res, $Val extends Style>
    implements $StyleCopyWith<$Res> {
  _$StyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundScreen = null,
    Object? backgroundChallenge = null,
    Object? questionOpacity = null,
  }) {
    return _then(_value.copyWith(
      backgroundScreen: null == backgroundScreen
          ? _value.backgroundScreen
          : backgroundScreen // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundChallenge: null == backgroundChallenge
          ? _value.backgroundChallenge
          : backgroundChallenge // ignore: cast_nullable_to_non_nullable
              as String,
      questionOpacity: null == questionOpacity
          ? _value.questionOpacity
          : questionOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StyleCopyWith<$Res> implements $StyleCopyWith<$Res> {
  factory _$$_StyleCopyWith(_$_Style value, $Res Function(_$_Style) then) =
      __$$_StyleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'background_screen') String backgroundScreen,
      @JsonKey(name: 'background_challenge') String backgroundChallenge,
      @JsonKey(name: 'question_opacity') double questionOpacity});
}

/// @nodoc
class __$$_StyleCopyWithImpl<$Res> extends _$StyleCopyWithImpl<$Res, _$_Style>
    implements _$$_StyleCopyWith<$Res> {
  __$$_StyleCopyWithImpl(_$_Style _value, $Res Function(_$_Style) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundScreen = null,
    Object? backgroundChallenge = null,
    Object? questionOpacity = null,
  }) {
    return _then(_$_Style(
      backgroundScreen: null == backgroundScreen
          ? _value.backgroundScreen
          : backgroundScreen // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundChallenge: null == backgroundChallenge
          ? _value.backgroundChallenge
          : backgroundChallenge // ignore: cast_nullable_to_non_nullable
              as String,
      questionOpacity: null == questionOpacity
          ? _value.questionOpacity
          : questionOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Style implements _Style {
  const _$_Style(
      {@JsonKey(name: 'background_screen') required this.backgroundScreen,
      @JsonKey(name: 'background_challenge') required this.backgroundChallenge,
      @JsonKey(name: 'question_opacity') required this.questionOpacity});

  factory _$_Style.fromJson(Map<String, dynamic> json) =>
      _$$_StyleFromJson(json);

  @override
  @JsonKey(name: 'background_screen')
  final String backgroundScreen;
  @override
  @JsonKey(name: 'background_challenge')
  final String backgroundChallenge;
  @override
  @JsonKey(name: 'question_opacity')
  final double questionOpacity;

  @override
  String toString() {
    return 'Style(backgroundScreen: $backgroundScreen, backgroundChallenge: $backgroundChallenge, questionOpacity: $questionOpacity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Style &&
            (identical(other.backgroundScreen, backgroundScreen) ||
                other.backgroundScreen == backgroundScreen) &&
            (identical(other.backgroundChallenge, backgroundChallenge) ||
                other.backgroundChallenge == backgroundChallenge) &&
            (identical(other.questionOpacity, questionOpacity) ||
                other.questionOpacity == questionOpacity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, backgroundScreen, backgroundChallenge, questionOpacity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StyleCopyWith<_$_Style> get copyWith =>
      __$$_StyleCopyWithImpl<_$_Style>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StyleToJson(
      this,
    );
  }
}

abstract class _Style implements Style {
  const factory _Style(
      {@JsonKey(name: 'background_screen')
          required final String backgroundScreen,
      @JsonKey(name: 'background_challenge')
          required final String backgroundChallenge,
      @JsonKey(name: 'question_opacity')
          required final double questionOpacity}) = _$_Style;

  factory _Style.fromJson(Map<String, dynamic> json) = _$_Style.fromJson;

  @override
  @JsonKey(name: 'background_screen')
  String get backgroundScreen;
  @override
  @JsonKey(name: 'background_challenge')
  String get backgroundChallenge;
  @override
  @JsonKey(name: 'question_opacity')
  double get questionOpacity;
  @override
  @JsonKey(ignore: true)
  _$$_StyleCopyWith<_$_Style> get copyWith =>
      throw _privateConstructorUsedError;
}

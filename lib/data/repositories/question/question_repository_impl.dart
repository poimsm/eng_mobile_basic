import 'package:eng_mobile_app/data/models/question.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:eng_mobile_app/data/repositories/question/question_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final Network _network;

  QuestionRepositoryImpl({required network}) : _network = network;

  @override
  Future<List<Question>> getQuestions() async {
    final resp = await _network.get('/questions');
    if (!resp.ok) return [];
    return (resp.data as List).map((x) => Question.fromJson(x)).toList();
  }
}

/// Provider used by rest of the app
final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return QuestionRepositoryImpl(network: Network());
});

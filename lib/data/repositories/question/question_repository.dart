
import 'package:eng_mobile_app/data/models/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestions();
}

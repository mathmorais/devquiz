import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  static const String _databasePath = 'assets/database';

  Future<UserModel> getUser() async {
    final jsonResponse =
        await rootBundle.loadString('$_databasePath/user.json');
    return UserModel.fromJson(jsonResponse);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString('$_databasePath/quizzes.json');
    final quizzes = jsonDecode(response) as List;
    return quizzes.map((quiz) => QuizModel.fromMap(quiz)).toList();
  }
}

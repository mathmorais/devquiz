import 'package:devquiz/screens/home/home_repository.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

enum HomeState { success, loading, error, empty }

class HomeController {
  UserModel? user;
  List<QuizModel>? quizzes;
  ValueNotifier<Difficulty> selectedDifficultyNotifier =
      ValueNotifier(Difficulty.facil);
  ValueNotifier<HomeState> stateNotifier = ValueNotifier(HomeState.empty);
  HomeRepository repository = HomeRepository();

  set state(HomeState state) => stateNotifier.value = state;
  get stateValue => stateNotifier.value;

  Difficulty get selectedDifficulty => selectedDifficultyNotifier.value;
  set selectedDifficulty(Difficulty difficulty) =>
      selectedDifficultyNotifier.value = difficulty;

  void setUser() async {
    try {
      this.state = HomeState.loading;
      this.user = await repository.getUser();
    } catch (err) {
      this.state = HomeState.error;
    }
  }

  void setQuizzes() async {
    try {
      this.quizzes = await repository.getQuizzes();
      this.state = HomeState.success;
    } catch (err) {
      this.state = HomeState.error;
    }
  }
}

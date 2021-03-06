import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/screens/challenge/challenge_screen.dart';
import 'package:devquiz/screens/home/home_controller.dart';
import 'package:devquiz/screens/home/widgets/appbar_widget.dart';
import 'package:devquiz/screens/home/widgets/error_warning_widget.dart';
import 'package:devquiz/screens/home/widgets/level_button_widget.dart';
import 'package:devquiz/screens/home/widgets/quiz_card_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  void handleQuizNavigation(int currentIndex) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => ChallengeScreen(
                user: controller.user!,
                quizName: controller.quizzes![currentIndex].quizTitle,
                questions: controller.quizzes![currentIndex].quizQuestions)));
  }

  dynamic loadQuizCards() {
    List<QuizModel?> filteredQuizzes = controller.quizzes!.map((quiz) {
      if (quiz.quizDifficulty == controller.selectedDifficulty) {
        return quiz;
      }
    }).toList();

    List<QuizCardWidget> quizWidgets = [];
    for (var index = 0; index < filteredQuizzes.length; ++index) {
      final quiz = filteredQuizzes[index];

      if (quiz != null)
        quizWidgets.add(QuizCardWidget(
            quiz: quiz, onTap: () => handleQuizNavigation(index)));
    }

    return quizWidgets.toList();
  }

  @override
  void initState() {
    super.initState();
    controller.setQuizzes();
    controller.setUser();
    controller.stateNotifier.addListener(() => setState(() {}));
  }

  List<ValueListenableBuilder> handleLoadDifficulties() {
    return Difficulty.values.map((difficulty) {
      String label = '';
      switch (difficulty) {
        case Difficulty.facil:
          label = 'F??cil';
          break;
        case Difficulty.medio:
          label = 'M??dio';
          break;
        case Difficulty.dificil:
          label = 'Dif??cil';
          break;
        case Difficulty.perito:
          label = 'Perito';
      }

      return ValueListenableBuilder(
        valueListenable: controller.selectedDifficultyNotifier,
        builder: (ctx, value, _) => LevelButtonWidget(
          onTap: (difficulty) => controller.selectedDifficulty = difficulty,
          difficulty: difficulty,
          label: label,
          isSelected: difficulty == controller.selectedDifficulty,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.stateValue == HomeState.error) {
      return ErroWarningWidget();
    }

    if (controller.stateValue == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(
              user: controller.user!, quizzes: controller.quizzes!),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: handleLoadDifficulties(),
                  ),
                ),
                Expanded(
                    child: ValueListenableBuilder<Difficulty>(
                  valueListenable: controller.selectedDifficultyNotifier,
                  builder: (ctx, value, _) => GridView.count(
                      physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: loadQuizCards()),
                )),
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColors.chartSecondary,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          ),
        ),
      );
    }
  }
}

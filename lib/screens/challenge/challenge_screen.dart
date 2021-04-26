import 'package:devquiz/screens/answer_result/answer_result_screen.dart';
import 'package:devquiz/screens/challenge/challenge_controller.dart';
import 'package:devquiz/screens/challenge/quiz_controller.dart';
import 'package:devquiz/screens/challenge/widgets/question_indicator_widget.dart';
import 'package:devquiz/screens/challenge/widgets/quiz_widget.dart';
import 'package:devquiz/screens/result/result_screen.dart';
import 'package:devquiz/shared/models/answer.model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:devquiz/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  final UserModel user;
  final List<QuestionModel> questions;
  final String quizName;

  const ChallengeScreen(
      {required this.user, required this.questions, required this.quizName});

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final challengeController = ChallengeController();
  final quizController = QuizController();

  int get currentQuestion => challengeController.currentQuestion;
  int get selectedAnswer => quizController.selectedAnswerIndex;

  List<AnswerModel> get currentQuestionAnswers =>
      widget.questions[currentQuestion].questionAnswers;

  String findCorrectAnswerContent() {
    String answerContent = '';

    currentQuestionAnswers.forEach((answer) {
      if (answer.isRight) {
        answerContent = answer.answerContent;
      }
    });

    return answerContent;
  }

  void handleAnswerValidation() {
    final isCurrentQuestionWrong =
        currentQuestionAnswers[selectedAnswer].isRight == false;
    if (isCurrentQuestionWrong) throw Error();
  }

  void handleAnswerConfirmation() {
    final answerContent = findCorrectAnswerContent();

    try {
      handleAnswerValidation();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => AnswerResultScreen.right(
                  rightAnswer: answerContent,
                  nextTapCallback: handleNextQuestion)));
      challengeController.totalCorrectQuestions += 1;
    } catch (err) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => AnswerResultScreen.wrong(
                  rightAnswer: answerContent,
                  nextTapCallback: handleNextQuestion)));
    }
  }

  void handleNextQuestion() {
    if (challengeController.currentQuestion + 1 >= widget.questions.length) {
      return showResultPage();
    }

    challengeController.nextQuestion();
    quizController.clearSelectedAnswers();
  }

  void showResultPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (ctx) => ResultScreen(
                quizName: widget.quizName,
                rightAnswers: challengeController.totalCorrectQuestions,
                totalAnswers: widget.questions.length)));
  }

  @override
  void initState() {
    super.initState();

    challengeController.currentQuestionNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(
              currentQuestion: challengeController.currentQuestion + 1,
              questionsLength: widget.questions.length),
        ),
      ),
      body: QuizWidget(
          quizController: quizController,
          question: widget.questions[challengeController.currentQuestion]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: SafeArea(
          bottom: true,
          child: Row(
            children: [
              Expanded(
                  child: ButtonWidget.white(
                      label: 'Pular', onPressed: handleNextQuestion)),
              Expanded(
                  child: ValueListenableBuilder<int>(
                valueListenable: quizController.selectedAnswerIndexNotifier,
                builder: (ctx, value, _) => ButtonWidget.green(
                    isBlocked: value < 0,
                    label: 'Confirmar',
                    onPressed: handleAnswerConfirmation),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

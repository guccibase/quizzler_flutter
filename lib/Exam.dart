import 'package:quizzler/questionsAndAnswers.dart';

class Exam {
  List<QuestionsAndAswers> _examQnA = [
    QuestionsAndAswers('question 1', true),
    QuestionsAndAswers('question 2', true),
    QuestionsAndAswers('question 3', false),
    QuestionsAndAswers('question 4', true),
    QuestionsAndAswers('question 5', false),
    QuestionsAndAswers('question 6', false),
    QuestionsAndAswers('question 7', false),
    QuestionsAndAswers('question 8', true),
    QuestionsAndAswers('question 9', true),
    QuestionsAndAswers('question 10', false),
    QuestionsAndAswers('question 11', true),
  ];

  Exam();

  getQuestion(int number) {
    return _examQnA[number].questions;
  }

  bool getAnswer(int number) {
    return _examQnA[number].answers;
  }

  numberOfQuestions() {
    return _examQnA.length;
  }
}

import 'question_class.dart';

class Quizbrain {
  int _currentQuestionNum = 0;

  final List<Question> _questionModel = [
    Question(q1: 'Ms Dhoni is great footballer', a1: false),
    Question(q1: 'India won the it\'s second world cup in 2011.', a1: true),
    Question(q1: 'The sky color is blue', a1: true),
    Question(q1: 'The red rose is blue', a1: false),
    Question(q1: 'You\'re an idiot!', a1: true),
    Question(q1: 'You\'re Rich', a1: true),
    Question(q1: 'Bumrah loves opening and he is great opener', a1: false),
    Question(q1: 'Abdul Kalam Azad was once a president of India', a1: true),
    Question(q1: 'The water is blue', a1: true),
    Question(q1: 'You\'re loves to talk right', a1: false),
  ];

  void getNextQuestion() {
    if (_currentQuestionNum < _questionModel.length - 1) {
      _currentQuestionNum++;
    }
  }

  getQuestionText() {
    return _questionModel[_currentQuestionNum].questionText;
  }

  getQuestionAns() {
    return _questionModel[_currentQuestionNum].questionAnswer;
  }

  // challenge code added below this

  isFinished(){
    if (_currentQuestionNum == _questionModel.length - 1){
      return true;
    }
  }

  void reset(){
    _currentQuestionNum = 0;
  }
}

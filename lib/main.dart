import 'package:flutter/material.dart';
import 'quizzbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Quizbrain quizbrain = Quizbrain();

void main() {
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Play Quiz',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const AppBody(),
        backgroundColor: Colors.black12,
      ),
    );
  }
}

// Main body of App
class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  List<Icon> scoreKeeper = [];

  showAlert(){
    if (quizbrain.isFinished() == true){
      Alert(
        context: context,
        type: AlertType.error,
        title: 'GAME END',
        desc: 'Hurray, you Successfully completed this quiz',
        buttons: [
          DialogButton(
            child: Text(
              "Play Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                quizbrain.reset();
                scoreKeeper.clear();
              });

            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  checkAnswer(bool userAns){
    setState(() {
      bool correctAns = quizbrain.getQuestionAns();
      if (correctAns == userAns) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green,),);
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red,),);
      }
      // calling other functions
      quizbrain.getNextQuestion();
      showAlert();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                quizbrain.getQuestionText(),
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  'True',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}

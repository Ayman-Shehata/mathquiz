import 'package:flutter/material.dart';

import 'question.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // initial values

  late String question;
  late List<int> answers;
  late int correctAnswer;

  generateQuestion() {
    (String, List<int>, int) randomAnswers = divideAndGenerateRandomAnswers();
    question = randomAnswers.$1;
    answers = randomAnswers.$2;
    correctAnswer = randomAnswers.$3;
  }

  @override
  void initState() {
    generateQuestion();
    super.initState();
  }

  void _getQuestion() {
    setState(() {
      generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Math question'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(question, style: const TextStyle(fontSize: 30)),
                  )),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          leading: const Icon(Icons.question_answer),
                          trailing: Text(
                            "${index + 1} ) ",
                            style: const TextStyle(
                                color: Colors.green, fontSize: 15),
                          ),
                          title: Text(
                            answers[index].toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      onTap: () {
                        (answers[index] == correctAnswer)
                            ? _showDialog(
                                context: context,
                                content: 'إجابة صحيحة',
                                message: 'أحسنت')
                            : _showDialog(
                                context: context,
                                content: 'حاول مرة أخرى ',
                                message: 'خطأ');
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getQuestion,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_circle_right_rounded),
      ),
    );
  }
}

void _showDialog(
    {required BuildContext context,
    required String message,
    required String content}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        content: Text(content),
        actions: <Widget>[
          ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

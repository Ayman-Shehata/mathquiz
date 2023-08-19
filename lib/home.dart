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

  generateQuestion() {
    (List<int>, String) randomAnswers = divideAndGenerateRandomAnswers();
    question = randomAnswers.$2;
    answers = randomAnswers.$1;
    print(randomAnswers.$1);
    print(randomAnswers.$2);
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
                    return Card(
                      elevation: 10,
                      child: ListTile(
                          leading: const Icon(Icons.question_answer),
                          trailing: Text(
                            "${index + 1} ) ",
                            style: const TextStyle(
                                color: Colors.green, fontSize: 15),
                          ),
                          title: Text(answers[index].toString(),
                              style: const TextStyle(fontSize: 20))),
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

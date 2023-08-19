import 'dart:math';

(List<int>, String) divideAndGenerateRandomAnswers() {
  Random random = Random();
  int dividend;
  int divisor;
  int quotient;

  do {
    dividend = random.nextInt(90) + 10;
    divisor = random.nextInt(9) + 2;
    quotient = dividend ~/ divisor;
  } while (dividend % divisor != 0);
  String question = '$dividend divided by $divisor = .......';
  List<int> answers = [quotient];

  while (answers.length < 4) {
    int randomAnswer = quotient + random.nextInt(10);
    if (!answers.contains(randomAnswer)) {
      answers.add(randomAnswer);
    }
  }

  answers.shuffle();

  return (answers, question);
}

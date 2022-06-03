import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, Object?>> questions = [
    {
      "question": "What is my name?",
      "option_a": "David",
      "option_b": "Solomon",
      "option_c": "Michael",
      "option_d": "Samuel",
      "answer": "Samuel",
    },
    {
      "question": "What is my age?",
      "option_a": 18,
      "option_b": 25,
      "option_c": 24,
      "option_d": 23,
      "answer": 24,
    },
    {
      "question": "What is my month?",
      "option_a": "February",
      "option_b": "January",
      "option_c": "March",
      "option_d": "April",
      "answer": "February",
    },
    {
      "question": "What is my surname?",
      "option_a": "David",
      "option_b": "Olajide",
      "option_c": "Michael",
      "option_d": "Samuel",
      "answer": "Olajide",
    },
  ];
  int index = 0, right = 0, wrong = 0;
  String result = '';
  validateAnswer(userInput) {
    setState(() {
      if (index < questions.length - 1) {
        if (userInput == questions[index]["answer"]) {
          right++;
        } else {
          wrong++;
        }
        index++;
      } else if (index == questions.length - 1) {
        if (userInput == questions[index]["answer"]) {
          right++;
        } else {
          wrong++;
        }
        result = "Hey, you got $right right and $wrong wrong!.";
      }
    });
  }

  endQuiz() {
    setState(() {
      index = 0;
      right = 0;
      wrong = 0;
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "QUESTION ${index + 1}: ${questions[index]["question"]}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 30.0,
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                ),
                onPressed: () {
                  validateAnswer(questions[index]["option_a"]);
                },
                child: Text(
                  "${questions[index]["option_a"]}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                ),
                onPressed: () {
                  validateAnswer(questions[index]["option_b"]);
                },
                child: Text(
                  "${questions[index]["option_b"]}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                ),
                onPressed: () {
                  validateAnswer(questions[index]["option_c"]);
                },
                child: Text(
                  "${questions[index]["option_c"]}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                ),
                onPressed: () {
                  validateAnswer(questions[index]["option_d"]);
                },
                child: Text(
                  "${questions[index]["option_d"]}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: endQuiz,
                  child: const Text(
                    "Take Quiz Again?",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
  List questions = [
    "FIRST PAGE",
    {
      "question": "What is my name?",
      "option_a": "David",
      "option_b": "Solomon",
      "option_c": "Michael",
      "option_d": "Samuel",
      "answer": "Samuel",
      "right": 0,
      "selected": "",
    },
    {
      "right": 0,
      "question": "What is my age?",
      "option_a": 18,
      "option_b": 25,
      "option_c": 24,
      "option_d": 23,
      "answer": 24,
      "selected": "",
    },
    {
      "right": 0,
      "question": "What is my month?",
      "option_a": "February",
      "option_b": "January",
      "option_c": "March",
      "option_d": "April",
      "answer": "February",
      "selected": "",
    },
    {
      "right": 0,
      "question": "What is my surname?",
      "option_a": "David",
      "option_b": "Olajide",
      "option_c": "Michael",
      "option_d": "Samuel",
      "answer": "Olajide",
      "selected": "",
    },
    "LAST PAGE",
  ];
  Map isSelected = {
    "option_a": false,
    "option_b": false,
    "option_c": false,
    "option_d": false,
  };
  int index = 0, score = 0;

  String result = '';

  tickAndValidateAnswer({required userInput}) {
    setState(() {
      bool a = isSelected[userInput];
      questions[index]["selected"] = userInput;

      isSelected["option_a"] = false;
      isSelected["option_b"] = false;
      isSelected["option_c"] = false;
      isSelected["option_d"] = false;
      isSelected[userInput] = !a;

      if (questions[index][userInput] == questions[index]["answer"] &&
          isSelected[userInput] == true) {
        questions[index]["right"] = 1;
      } else {
        questions[index]["right"] = 0;
      }
    });
  }

  next() {
    setState(() {
      if (index < questions.length - 2) {
        index++;
        if (questions[index]["selected"] == "option_a") {
          isSelected["option_b"] = false;
          isSelected["option_c"] = false;
          isSelected["option_d"] = false;
          isSelected["option_a"] = true;
        } else if (questions[index]["selected"] == "option_b") {
          isSelected["option_a"] = false;

          isSelected["option_c"] = false;
          isSelected["option_d"] = false;
          isSelected["option_b"] = true;
        } else if (questions[index]["selected"] == "option_c") {
          isSelected["option_a"] = false;
          isSelected["option_b"] = false;

          isSelected["option_d"] = false;
          isSelected["option_c"] = true;
        } else if (questions[index]["selected"] == "option_d") {
          isSelected["option_a"] = false;
          isSelected["option_b"] = false;
          isSelected["option_c"] = false;
          isSelected["option_d"] = true;
        } else {
          isSelected["option_a"] = false;
          isSelected["option_b"] = false;
          isSelected["option_c"] = false;
          isSelected["option_d"] = false;
        }
      }
    });
  }

  previous() {
    setState(() {
      if (1 < index) {
        index--;
        if (questions[index]["selected"] == "option_a") {
          isSelected["option_b"] = false;
          isSelected["option_c"] = false;
          isSelected["option_d"] = false;
          isSelected["option_a"] = true;
        } else if (questions[index]["selected"] == "option_b") {
          isSelected["option_a"] = false;

          isSelected["option_c"] = false;
          isSelected["option_d"] = false;
          isSelected["option_b"] = true;
        } else if (questions[index]["selected"] == "option_c") {
          isSelected["option_a"] = false;
          isSelected["option_b"] = false;

          isSelected["option_d"] = false;
          isSelected["option_c"] = true;
        } else if (questions[index]["selected"] == "option_d") {
          isSelected["option_a"] = false;
          isSelected["option_b"] = false;
          isSelected["option_c"] = false;
          isSelected["option_d"] = true;
        } else {
          isSelected["option_a"] = false;
          isSelected["option_b"] = false;
          isSelected["option_c"] = false;
          isSelected["option_d"] = false;
        }
      }
    });
  }

  done() {
    setState(() {
      index = 0;

      score = 0;
      isSelected["option_a"] = false;
      isSelected["option_b"] = false;
      isSelected["option_c"] = false;
      isSelected["option_d"] = false;
      result = '';
      for (var i = 1; i < questions.length - 1; i++) {
        questions[i]["selected"] = "";
      }
    });
  }

  showResult() {
    setState(() {
      result =
          "RESULT: You got $score right and ${questions.length - 2 - score} wrong!";
    });
  }

  endQuizAndCalculateScore() {
    setState(() {
      index = questions.length - 1;
      for (var i = 1; i < questions.length - 1; i++) {
        score += questions[i]["right"] as int;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: (index == 0)
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: next,
                        child: const Text(
                          "CLICK TO START QUIZ",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                )
              : (0 < index && index < questions.length - 1)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "QUESTION $index: ${questions[index]["question"]}",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          height: 30.0,
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          padding: const EdgeInsets.all(5.0),
                          child: CheckboxListTile(
                            title: Text(
                              "${questions[index]["option_a"]}",
                              style: const TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            tileColor: Colors.blue,
                            // secondary: const Icon(Icons.check),
                            value: isSelected["option_a"],
                            onChanged: (value) {
                              tickAndValidateAnswer(userInput: "option_a");
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          padding: const EdgeInsets.all(5.0),
                          child: CheckboxListTile(
                            title: Text(
                              "${questions[index]["option_b"]}",
                              style: const TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            tileColor: Colors.blue,
                            // secondary: const Icon(Icons.check),
                            value: isSelected["option_b"],
                            onChanged: (value) {
                              tickAndValidateAnswer(userInput: "option_b");
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          padding: const EdgeInsets.all(5.0),
                          child: CheckboxListTile(
                            title: Text(
                              "${questions[index]["option_c"]}",
                              style: const TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            tileColor: Colors.blue,
                            // secondary: const Icon(Icons.check),
                            value: isSelected["option_c"],
                            onChanged: (value) {
                              tickAndValidateAnswer(userInput: "option_c");
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          padding: const EdgeInsets.all(5.0),
                          child: CheckboxListTile(
                            title: Text(
                              "${questions[index]["option_d"]}",
                              style: const TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            tileColor: Colors.blue,
                            // secondary: const Icon(Icons.check),
                            value: isSelected["option_d"],
                            onChanged: (value) {
                              tickAndValidateAnswer(userInput: "option_d");
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: previous,
                                child: const Text("PREVIOUS")),
                            ElevatedButton(
                              onPressed: endQuizAndCalculateScore,
                              child: const Text(
                                "END QUIZ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: next, child: const Text("NEXT")),
                          ],
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: showResult,
                            child: const Text(
                              "SHOW RESULT",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              result,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: done,
                            child: const Text(
                              "DONE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}

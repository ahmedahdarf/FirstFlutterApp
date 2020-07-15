import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score=0;
  var quiz = [
    {
      "Title": "1: c'est quoi CLoudSim",
      "answers": [
        {"answer": "logiciel", "correct": false},
        {"answer": "Simulateur Cloud", "correct": true},
        {"answer": "langage de programmation", "correct": false},
      ]
    },
    {
      "Title": "2) l'unité de base pour Docker ",
      "answers": [
        {"answer": "container", "correct": true},
        {"answer": "pod", "correct": false},
        {"answer": "les deux", "correct": false},
      ]
    },
    {
      "Title": "3) Java c'est un langage ",
      "answers": [
        {"answer": "structuré", "correct": false},
        {"answer": "semi structuré", "correct": false},
        {"answer": "Orienté objet", "correct": true},
      ]
    },
    {
      "Title": "4) IP c'est un protocole de la couche",
      "answers": [
        {"answer": "physique", "correct": false},
        {"answer": "transport", "correct": false},
        {"answer": "reseau", "correct": true},
      ]
    },
    {
      "Title": "5) complexité de la fonction fact(n)",
      "answers": [
        {"answer": "O(n)", "correct": false},
        {"answer": "O(nlog(n))", "correct": true},
        {"answer": "O(n2)", "correct": false},
      ]
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body:(this.currentQuestion>=quiz.length)?
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

        Text(
          "Score :${(100*score/quiz.length).round()} %",
          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),
        ),
              RaisedButton(
                child:Text("Redemarrer le Quiz",style: TextStyle(fontSize: 17),) ,
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                onPressed: (){
                  setState(() {
                    this.currentQuestion=0;
                    this.score=0;
                  });
                },
              )

            ],
        ),
        )
        :ListView(
          children: <Widget>[
            ListTile(
              title: Center(
                  child: Text(
                "Question ${currentQuestion + 1}/${quiz.length}",
                style: TextStyle(
                    color: Colors.black ,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
            ),
            ListTile(
              title: Text(
                quiz[currentQuestion]["Title"],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ...(quiz[currentQuestion]["answers"] as List<Map<String, Object>>)
                .map((answer) {
            return  ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        if(answer['correct']==true){
                          ++score;
                        }
                        ++currentQuestion;
                      });
                    },
                    child: Text(answer['answer'],style: TextStyle(fontSize: 20),),
                  ),
                ),
              );
            })
          ],
        ));
  }
}

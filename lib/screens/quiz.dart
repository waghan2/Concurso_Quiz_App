// Make a quiz app
// Language: dart
// Path: lib\screens\quiz.dart
// Compare this snippet from lib\widgets\perguntas.dart:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

late Stream<QuerySnapshot<Map<String, dynamic>>> quizStream =
    FirebaseFirestore.instance.collection('Quiz').snapshots();

void initState() {
  initState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: quizStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                width: double.infinity,
                child: PerguntaWidget(
                  snapshot: snapshot.data!.docs[index].data(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PerguntaWidget extends StatelessWidget {
  var snapshot;
  PerguntaWidget({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(snapshot['pergunta']),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(snapshot['respostas'][0]),
                  Text(snapshot['respostas'][1]),
                  Text(snapshot['respostas'][2]),
                  Text(snapshot['respostas'][3]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(onPressed: () {}, child: Text('A')),
                  ElevatedButton(onPressed: () {}, child: Text('B')),
                  ElevatedButton(onPressed: () {}, child: Text('C')),
                  ElevatedButton(onPressed: () {}, child: Text('D')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

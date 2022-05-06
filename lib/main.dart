import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concurso_quiz_app/screens/addquestions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        ),
    );
  } else {
    await Firebase.initializeApp();
  }
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddQuestion(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late Stream quizStream;
  Widget quizList() {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Quiz').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var docs = snapshot.data.docs;
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return QuizTitle(
                pergunta: docs[index].data()['pergunta'],
                respostas: docs[index].data()['respostas'],
              );
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    quizStream = FirebaseFirestore.instance.collection('Quiz').snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //TODO: Quiz section
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(2),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: quizList()),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class QuizTitle extends StatelessWidget {
  String pergunta;

  var respostas;
  QuizTitle({Key? key, required this.pergunta, required this.respostas})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // pergunta

          Center(
            child: Text(
              pergunta,
              style: TextStyle(fontSize: 20),
            ),
          ),
          // respostas
          ...respostas.map((e) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(e),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

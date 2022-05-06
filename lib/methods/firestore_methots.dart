import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concurso_quiz_app/screens/addquestions.dart';
import 'package:concurso_quiz_app/widgets/perguntas.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadQuiz(
    String pergunta,
    String respostaCerta,
    String categoria,
    String dificuldade,
    String imagemUrl,
    String assunto,
    respostas,
  ) async {
    String res = "erro";
    try {
      String id = const Uuid().v4();

      Perguntas quiz = Perguntas(
        id: id,
        pergunta: pergunta,
        respostaCerta: respostaCerta,
        categoria: categoria,
        dificuldade: dificuldade,
        imagemUrl: imagemUrl,
        assunto: assunto,
        respostas: respostas,
      );
      _firestore.collection('Quiz').doc();
      await _firestore.collection('Quiz').doc(id).set(quiz.toJson());
      res = "sucesso";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  getQuizData() async {
    return await FirebaseFirestore.instance.collection('Quizes').snapshots();
  }

  Future<String> AddQuestion(
      String quizName,
      String quizDescription,
      String quizImage,
      String quizCategory,
      String quizDifficulty,
      String quizAssunto,
      List<String> quizQuestions) async {
    String res = "erro";
    try {} catch (e) {
      res = e.toString();
    }
    return res;
  }

//   Future<Perguntas> getQuizes() async {
//     List<Perguntas> quizes = [];
//     QuerySnapshot querySnapshot = await _firestore.collection('quizes').get();
//     for (var i = 0; i < querySnapshot.docs.length; i++) {
//       // quizes.add(Perguntas.perguntasFromSnapshot(querySnapshot.docs[i]));

//     }
//     return quizes;
//   }

//   Future<List<Perguntas>> getQuizesByCategory(String category) async {
//     List<Perguntas> quizes = [];
//     QuerySnapshot querySnapshot = await _firestore
//         .collection('quizes')
//         .where('categoria', isEqualTo: category)
//         .get();
//     for (var i = 0; i < querySnapshot.docs.length; i++) {
//       quizes.add(Perguntas.perguntasFromSnapshot(querySnapshot.docs[i]));
//     }
//     return quizes;
//   }
//
}

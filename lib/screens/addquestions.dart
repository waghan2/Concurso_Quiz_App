import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concurso_quiz_app/methods/firestore_methots.dart';
import 'package:concurso_quiz_app/screens/quiz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}
/*    id: id,
        pergunta: quizName,
        Pergunta: quizQuestions,
        respostaCerta: quizQuestions[0],
        categoria: quizCategory,
        dificuldade: quizDifficulty,
        imagemUrl: quizImage,
        assunto: quizAssunto,*/

class _AddQuestionState extends State<AddQuestion> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController pergunta = TextEditingController();
  TextEditingController respostaCerta = TextEditingController();
  TextEditingController categoria = TextEditingController();
  TextEditingController dificuldade = TextEditingController();
  TextEditingController imagemUrl = TextEditingController();
  TextEditingController assunto = TextEditingController();
  TextEditingController resposta1 = TextEditingController();
  TextEditingController resposta2 = TextEditingController();
  TextEditingController resposta3 = TextEditingController();
  TextEditingController resposta4 = TextEditingController();

  String id = const Uuid().v4();

  late List<String> respostas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Pergunta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: pergunta,
                  decoration: InputDecoration(
                    labelText: 'Pergunta',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma pergunta';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: respostaCerta,
                  decoration: InputDecoration(
                    labelText: 'Resposta Certa',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma resposta certa';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: categoria,
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma categoria';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: dificuldade,
                  decoration: InputDecoration(
                    labelText: 'Dificuldade',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma dificuldade';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: imagemUrl,
                  decoration: InputDecoration(
                    labelText: 'Imagem Url',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma imagem url';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: assunto,
                  decoration: InputDecoration(
                    labelText: 'Assunto',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira um assunto';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: resposta1,
                  decoration: InputDecoration(
                    labelText: 'Resposta 1',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma resposta';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: resposta2,
                  decoration: InputDecoration(
                    labelText: 'Resposta 2',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma resposta';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: resposta3,
                  decoration: InputDecoration(
                    labelText: 'Resposta 3',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma resposta';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: resposta4,
                  decoration: InputDecoration(
                    labelText: 'Resposta 4',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma resposta';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      respostas = [
                        resposta1.text,
                        resposta2.text,
                        resposta3.text,
                        resposta4.text
                      ];
                      print(respostas);

                      if (_formkey.currentState!.validate()) {
                        FireStoreMethods().uploadQuiz(
                          /*pergunta, respostaCerta, categoria, dificuldade, imagemUrl, assunto, resposta1, resposta2, resposta3, resposta4*/
                          pergunta.text,
                          respostaCerta.text,
                          categoria.text,
                          dificuldade.text,
                          imagemUrl.text,
                          assunto.text,
                          respostas,
                        );
                      }
                    },
                    child: const Text('Adicionar Pergunta')),
                // Go to quiz page
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuizPage()));
                    },
                    child: const Text('Quiz Page')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

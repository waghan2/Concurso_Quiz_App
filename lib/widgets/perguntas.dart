import 'package:cloud_firestore/cloud_firestore.dart';

class Perguntas {
  final String id;
  final String pergunta;
  
  final String respostaCerta;
  final String categoria;
  final String dificuldade;
  final String assunto;

  final String imagemUrl;
  final List<String> respostas;

  const Perguntas(
      {required this.id,
      required this.pergunta,
      required this.respostaCerta,
      required this.categoria,
      required this.dificuldade,
      required this.imagemUrl,
      required this.assunto, 

      required this.respostas,
});

  static perguntasFromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;

    return Perguntas(
      id: data['id'],
      pergunta: data['pergunta'],
      respostaCerta: data['respostaCerta'],
      categoria: data['categoria'],
      dificuldade: data['dificuldade'],
      imagemUrl: data['imagemUrl'],
      assunto: data['assunto'],
      respostas: data['respostas'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pergunta': pergunta,
      'respostaCerta': respostaCerta,
      'categoria': categoria,
      'dificuldade': dificuldade,
      'imagemUrl': imagemUrl,
      'assunto': assunto,

      'respostas': respostas,
    };
  }
}

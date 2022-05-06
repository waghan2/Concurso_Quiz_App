import 'package:cloud_firestore/cloud_firestore.dart';

class user {
  final String id;
  final String nome;
  final String email;
  final String senha;
  final String fotoUrl;

  const user({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.fotoUrl,
  });
  static user fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return user(
      id: snapshot['id'],
      nome: snapshot['nome'],
      email: snapshot['email'],
      senha: snapshot['senha'],
      fotoUrl: snapshot['fotoUrl'],
    );
  }
}

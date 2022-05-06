import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> quizStream;

  void initState() {
    super.initState();
    quizStream = FirebaseFirestore.instance.collection('Quiz').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // head section
      appBar: AppBar(
        title: const Text('Home'),
      ),
      // body section - content of the page goes here
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Category section
              Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: quizStream,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Text('Loading...');
                      }
                      var docs = snapshot.data.docs;
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return CategoryTitle(
                            categoria:
                                snapshot.data.docs[index].data()['categoria'],
                            length: snapshot.data.docs.length,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Text('Go to Quiz'),
              )

              // // Quiz section
              // SingleChildScrollView(
              //   child: Container(
              //     padding: EdgeInsets.all(2),
              //     child: SizedBox(
              //         height: MediaQuery.of(context).size.height * 0.5,
              //         child: Text('Quiz')),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String categoria;
  int length;
  CategoryTitle({Key? key, required this.categoria, required this.length})
      : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 4,
          ),
          children: <Widget>[
            Container(
                child: Text(categoria),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(2)),
          ],
        ),
      ],
    );
  }
}

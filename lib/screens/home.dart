import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController movieController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Encontre um Filme"),
          backgroundColor: Colors.indigo,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: movieController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    hintText: "Digite o nome do filme", border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo,
            child: Icon(Icons.search),
            onPressed: () {
              //print('${movieController.text}');
              if(movieController.text != ''){
                Navigator.of(context)
                    .pushNamed('/list', arguments: movieController.text);
              }
            }),
      ),
    );
  }
}

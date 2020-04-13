import 'package:flutter/material.dart';
import './screens/movie_list_screen.dart';
import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmes',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/list':
        if(args is String){
          return MaterialPageRoute(
            builder: (_) => MovieListScreen(searchQ: args,),
          );
        }
        // se os argumentos não forem do tipo correto, retornar uma rota de erro
        return _errorRoute();
      default:
      // se não encontrar a rota retorna erro
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
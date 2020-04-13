import 'package:flutter/material.dart';
import '../models/movie_list_model.dart';
import '../requests/movie_api_request.dart';

class MovieListScreen extends StatelessWidget {
  final String searchQ;

  MovieListScreen({
    @required this.searchQ,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados para: $searchQ'),
        centerTitle: true,
      ),
      body: createBody(searchQ),
    );
  }
}

createBody(String search) {
  var futureBuilder = new FutureBuilder(
    future: getMovie(search),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return buildCenter('Conexão falha');
        case ConnectionState.waiting:
          return buildCenter('Carregando...');
        case ConnectionState.active:
          return buildList(snapshot.data);
        case ConnectionState.done:
          return buildList(snapshot.data);
        default:
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          else
            return new Text('Result: ${snapshot.data}');
      }
    },
  );
  return futureBuilder;
}

buildCenter(String text) {
  return Center(
    child: Text(
      '$text',
      style: TextStyle(
        fontSize: 30.0,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}

buildList(MovieList movieList) {
  if (movieList.results.length == 0) {
    return buildCenter('Sem resultados');
  }

  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
      color: Colors.black,
    ),
    itemCount: movieList.results.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(movieList.results[index].title),
      );
    },
  );
}

Future<MovieList> getMovie(String search) async {
  MovieList response = await MovieApiRequest().searchForMovie(search);
  response.results.forEach((item) => print(item.title));
  return response;
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_dart/imdb_movies/movies_model.dart';

class IMDBAPITest extends StatefulWidget {
  const IMDBAPITest({super.key});

  @override
  State<IMDBAPITest> createState() => _IMDBAPITestState();
}

class _IMDBAPITestState extends State<IMDBAPITest> {
  List<MovieData> moviesList = [];
  String url = "https://imdb-top-100-movies.p.rapidapi.com/";

  Future<void> fetchMovieData() async {
    const Map<String, String> headers = {
      'x-rapidapi-key': '570c4aeef1mshd32df10eb8890f1p1c677bjsn7c0607998d14',
      'x-rapidapi-host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseData = jsonDecode(response.body.toString());
    print(responseData);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> x in responseData) {
        final data = MovieData.fromJson(x);
        moviesList.add(data);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CupertinoButton(
            onPressed: fetchMovieData, child: const Text("Please press")),
        Expanded(
            child: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            final data = moviesList[index];
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all()),
              child: ListTile(
                leading: Image.network(data.image),
                title: Text(data.title),
                subtitle: Text(data.description),
              ),
            );
          },
        ))
      ],
    ));
  }
}

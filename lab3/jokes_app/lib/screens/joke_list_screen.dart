import 'package:flutter/material.dart';

import '../models/joke.dart';
import '../services/api_services.dart';

class JokesListScreen extends StatelessWidget {
  final String type;
  final List<Joke> favoriteJokes;
  final Function(Joke) toggleFavorite;
  final Function(Joke) isFavorite;

  JokesListScreen({
    required this.type,
    required this.favoriteJokes,
    required this.toggleFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(jokes[index].setup),
                  subtitle: Text(jokes[index].punchline),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite(jokes[index])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite(jokes[index]) ? Colors.red : null,
                    ),
                    onPressed: () {
                      toggleFavorite(jokes[index]);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

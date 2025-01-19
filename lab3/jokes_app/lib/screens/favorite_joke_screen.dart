import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';

class FavoriteJokeScreen extends StatelessWidget {
  final List<Joke> favoriteJokes;

  FavoriteJokeScreen({required this.favoriteJokes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
      ),
      body: favoriteJokes.isEmpty
          ? const Center(child: Text('No favorite jokes yet.'))
          : ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteJokes[index].setup),
            subtitle: Text(favoriteJokes[index].punchline),
          );
        },
      ),
    );
  }
}


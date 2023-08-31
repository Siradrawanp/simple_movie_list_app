import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/features/movie_list/data/model/movie_model.dart';
import 'package:movie_app/src/features/movie_list/presentation/provider/ui_movie_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getMovieListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
        centerTitle: true,
      ),
      body: data.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Card(
                color: Colors.blue,
                elevation: 4,
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(data[index].title),
                ),
              );
            }
          );
        }, 
        error: (err, s) => Text(err.toString()), 
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

}
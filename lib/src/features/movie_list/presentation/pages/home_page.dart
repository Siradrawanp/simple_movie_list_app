import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/features/movie_list/presentation/widgets/card_widget.dart';

import '../provider/ui_movie_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getMovieListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: data.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return CardPoster(
                data: data[index],
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
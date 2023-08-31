import 'package:flutter/material.dart';
import 'package:movie_app/src/features/movie_list/data/model/movie_model.dart';

class CardPoster extends StatelessWidget {
  final MovieModel data;
  const CardPoster({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: data.poster != "no image"
                  ? Image.network(
                      data.poster,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "No Image Available",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
              ),
            ),
            const SizedBox(height: 16.0,),
            Text("Title: ${data.title}"),
            Text("Release: ${data.year}"),
            Text("Runtime ${data.runtime}"),
          ],
        ),
      ),
    );
  }
}

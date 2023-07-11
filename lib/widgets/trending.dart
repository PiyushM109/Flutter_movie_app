import 'package:flutter/material.dart';

import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({
    super.key,
    required this.trending,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyText(
              text: 'Trending Movies',
              color: Colors.white,
              size: 15,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']))),
                      ),
                      Container(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: 
                              MyText(
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'Loading',
                                  color: Colors.white,
                                  size: 10),
                           
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

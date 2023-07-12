import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class TvList extends StatelessWidget {
  final String name;
  final List list;
  const TvList({
    super.key,
    required this.list,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 MyText(
                  text: name,
                  color: Colors.white,
                  size: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionPage(
                          name: list[index]['original_name'] != null || list[index]['original_name'].toString().isEmpty
                                      ? list[index]['original_name']
                                      : 'Loading',
                          description: list[index]['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              list[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              list[index]['poster_path'],
                          vote: list[index]['vote_average'].toString(),
                          launchOn: list[index]['first_air_date'],
                          clist:list,
                          ),
                          
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        list[index]['poster_path']))),
                      ),
                      Container(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: 
                              MyText(
                                  text: list[index]['original_name'] != null
                                      ? list[index]['original_name']
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

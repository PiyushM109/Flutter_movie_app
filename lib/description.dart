import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class DescriptionPage extends StatelessWidget {
  final String name;
  final String description;
  final String bannerUrl;
  final String posterUrl;
  final String vote;
  final String launchOn;

  const DescriptionPage({
    super.key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image: NetworkImage(bannerUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                MyText(
                        text: '   Rating - ' + vote + '⭐',
                        color: Colors.white,
                        size: 10,
                      ),
                MyText(
                        text: 'Releasing Date- ' + launchOn,
                        color: Colors.white,
                        size: 10,
                      ),
              ],),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: MyText(
                  text: name != null ? name : 'loading..',
                  color: Colors.white,
                  size: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 130,
                    child: Image.network(posterUrl)),
                  Flexible(
                    child: Container(
                      padding:EdgeInsets.only(right: 10,left: 8),
                      child: MyText(
                        text: 'Overview :-   ' + description,
                        color: Colors.grey.shade200,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

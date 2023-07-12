import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/list_builder.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topRatedMovies = [];
  List tv =[];
  final String apikey = '6966f7b14c11f50a575a75f402ee6d59';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OTY2ZjdiMTRjMTFmNTBhNTc1YTc1ZjQwMmVlNmQ1OSIsInN1YiI6IjY0YWMzMDVmZTI0YjkzMDExZDc0NTk1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lhnS77QAMk_MSdjvJT_5Bhzb_QyKCN-tJY-PFhREOLw';
  
  @override
  void initState() {
    loadMovies(); 
    super.initState();
  }
  void loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    print(tvResult);

    trendingResult.removeWhere((key, value) => value == null || value.toString().trim().isEmpty);
    topRatedResult.removeWhere((key, value) => value == null || value.toString().trim().isEmpty);
    tvResult.removeWhere((key, value) => value == null || value.toString().trim().isEmpty);

    setState(() {
     trendingmovies = trendingResult['results'];
     topRatedMovies = topRatedResult['results'];
     tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title:  const MyText(
          text:'CineMa📹',
          color: Colors.white,
          size: 20,
        ),
        backgroundColor: Colors.black12,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          MoviesList(list: topRatedMovies, name: 'Top Rated Movies ⭐',),
          MoviesList(list: trendingmovies, name: 'Trending Movies 🔥'),
          TvList(list: tv, name: 'Top TV Shows 📺',),
          
          
        ],
      ),
    );
  }
}

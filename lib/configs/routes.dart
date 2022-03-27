import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_db_app/constants/navigation.dart';
import 'package:movie_db_app/screens/movie_detail.dart';
import 'package:movie_db_app/screens/movie_home.dart';
import 'package:movie_db_app/screens/search.dart';

import '../blocs/moviecast/movie_cast_cubit.dart';
import '../blocs/moviedetail/movie_detail_cubit.dart';
import '../blocs/searchmovie/search_movie_cubit.dart';

Route? generateRoutes(RouteSettings settings) {
  final Object? args = settings.arguments;

  switch (settings.name) {
    case Navigation.MovieHome:
      return buildRoute(settings, MovieHome());
    case Navigation.SearchPage:
      // return buildRoute(settings, SearchPage());
      return buildRoute(
          settings,
          BlocProvider<SearchMovieCubit>(
            create: (context) => SearchMovieCubit(),
            child: SearchPage(),
          ));
    case Navigation.MovieDetail:
      // return buildRoute(settings, DetailMovie(movieId: args as int));
      //---------------------------------------------------
      // return buildRoute(settings,
      //     BlocProvider<MovieDetailCubit>(
      //       create: (context) => MovieDetailCubit(),
      //       child: DetailMovie(movieId: args as int),
      //     ),
      // );
      //----------------------------------------------------
      return buildRoute(
        settings,
        BlocProvider<MovieDetailCubit>(
          create: (context) => MovieDetailCubit(),
          child: BlocProvider<MovieCastCubit>(
            create: (context) => MovieCastCubit(),
            child: DetailMovie(movieId: args as int),
          ),
        ),
      );

    default:
      return null;
  }
}

CupertinoPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}

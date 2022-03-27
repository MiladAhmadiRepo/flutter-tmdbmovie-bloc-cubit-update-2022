class MovieList {
  double popularity=0;
  double voteCount=0;
  bool video=false;
  String posterPath="";
  int id=0;
  bool adult=false;
  String backdropPath="";
  String originalLanguage="";
  String originalTitle="";
  List<int> genreIds=[];
  String title="";
  double voteAverage=0;
  String overview="";
  String releaseDate="";

  MovieList({
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.posterPath,
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  MovieList.fromJson(Map<String, dynamic> json) {
    popularity =
        json['popularity'] == null ? 0.0 : json['popularity'].toDouble();
    voteCount =
        json['vote_count'] == null ? 0.0 : json['vote_count'].toDouble();
    video = json['video']?? false;
    posterPath = json['poster_path']?? '';
    id = json['id'] == null ? 0 : json['id'].toInt();
    adult = json['adult']?? false;
    backdropPath = json['backdrop_path']?? '';
    originalLanguage = json['original_language']?? '';
    originalTitle = json['original_title']?? '';
    genreIds = (json['genre_ids']??[]).cast<int>();
    title = json['title']?? '';
    voteAverage =
        json['vote_average'] == null ? 0.0 : json['vote_average'].toDouble();
    overview = json['overview']?? '';
    releaseDate = json['release_date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}

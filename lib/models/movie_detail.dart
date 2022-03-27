class MovieDetail {
  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.images,
  });

  bool adult;
  String backdropPath;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  Images images;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
    adult: json["adult"]?? false,
    backdropPath: json["backdrop_path"]?? '',
    budget: json["budget"]?? 0,
    genres: List<Genre>.from((json["genres"]??[]).map((x) => Genre.fromJson(x))),
    homepage: json["homepage"]?? '',
    id: json["id"]??0,
    imdbId: json["imdb_id"]?? '',
    originalLanguage: json["original_language"]?? '',
    originalTitle: json["original_title"]?? '',
    overview: json["overview"]?? '',
    popularity: json["popularity"]?.toDouble()??0,
    posterPath: json["poster_path"]?? '',
    releaseDate: DateTime.parse(json["release_date"]??DateTime.now()),
    revenue: json["revenue"]?? 0,
    runtime: json["runtime"]??  0,
    status: json["status"]?? '',
    tagline: json["tagline"]?? '',
    title: json["title"]?? '',
    video: json["video"]?? false,
    voteAverage: json["vote_average"].toDouble()?? 0,
    voteCount: json["vote_count"]?? 0,
    images: Images.fromJson(json["images"] ??Images(
      backdrops: [],posters: []
    )),
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "budget": budget,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "revenue": revenue,
    "runtime": runtime,
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "images": images.toJson(),
  };
}

class Genre {
  Genre({
    required  this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"]?? 0,
    name: json["name"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Images {
  Images({
    required  this.backdrops,
    required  this.posters,
  });

  List<Backdrop> backdrops;
  List<Backdrop> posters;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    backdrops: List<Backdrop>.from((json["backdrops"]??[]).map((x) => Backdrop.fromJson(x))),
    posters: List<Backdrop>.from((json["posters"]??[]).map((x) => Backdrop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
    "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
  };
}

class Backdrop {
  Backdrop({
    required  this.aspectRatio,
    required this.filePath,
    required this.height,
    required this.iso6391,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  double aspectRatio;
  String filePath;
  int height;
  String iso6391;
  double voteAverage;
  int voteCount;
  int width;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
    aspectRatio: json["aspect_ratio"].toDouble()?? 0,
    filePath: json["file_path"]?? '',
    height: json["height"]?? 0,
    iso6391: json["iso_639_1"] ??'',
    voteAverage: json["vote_average"]?? 0.toDouble(),
    voteCount: json["vote_count"]?? 0,
    width: json["width"]?? 0,
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio,
    "file_path": filePath,
    "height": height,
    "iso_639_1": iso6391 == null ? '' : iso6391,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "width": width,
  };
}
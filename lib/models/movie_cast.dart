class MovieCast {
  MovieCast({
    required this.cast,
    required this.crew,
  });

  List<Cast> cast;
  List<Crew> crew;

  factory MovieCast.fromJson(Map<String, dynamic> json) => MovieCast(
    cast: List<Cast>.from((json["cast"]??[]).map((x) => Cast.fromJson(x))),
    crew: List<Crew>.from((json["crew"]??[]).map((x) => Crew.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
}

class Cast {
  Cast({
    required this.castId,
    required  this.character,
    required this.creditId,
    required this.gender,
    required this.id,
    required this.name,
    required this.order,
    required this.profilePath,
  });

  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    castId: json["cast_id"]?? 0,
    character: json["character"]?? '',
    creditId: json["credit_id"]?? '',
    gender: json["gender"]?? 0,
    id: json["id"]?? 0,
    name: json["name"]?? '',
    order: json["order"]?? 0,
    profilePath: json["profile_path"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "cast_id": castId,
    "character": character,
    "credit_id": creditId,
    "gender": gender,
    "id": id,
    "name": name,
    "order": order,
    "profile_path": profilePath,
  };
}

class Crew {
  Crew({
    required  this.creditId,
    required this.department,
    required this.gender,
    required this.id,
    required this.job,
    required this.name,
    required this.profilePath,
  });

  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
    creditId: json["credit_id"]?? '',
    department: json["department"]?? '',
    gender: json["gender"]?? 0,
    id: json["id"]?? 0,
    job: json["job"]?? '',
    name: json["name"]?? '',
    profilePath: json["profile_path"] == null ? '' : json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "credit_id": creditId,
    "department": department,
    "gender": gender,
    "id": id,
    "job": job,
    "name": name,
    "profile_path": profilePath == null ? null : profilePath,
  };
}
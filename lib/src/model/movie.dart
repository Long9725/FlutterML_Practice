class Movie {
  Movie({required this.title, required this.genre});

  // Json 데이터를 받아와 객체 생성, read
  Movie.fromJson(Map<String, Object?> json)
      : this(
    title: json['title']! as String,
    genre: json['genre']! as String,
  );

  final String title;
  final String genre;

  // 생성된 객체를 통해 Json 데이터 생성, create or update
  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': genre,
    };
  }
}
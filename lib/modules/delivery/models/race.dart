class Race {
  int id;
  String race;

  Race({
    required this.id,
    required this.race,
  });


  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
      id: json['id'],
      race: json['race'],
    );
  }

}

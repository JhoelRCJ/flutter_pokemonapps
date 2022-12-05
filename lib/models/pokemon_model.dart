class PokemonModel {
  String name;
  String img;
  List<String> type;
  String numPokemon;
  String height;
  String weight;
  String candy;
  String egg;

  PokemonModel(
      {required this.name,
      required this.img,
      required this.type,
      required this.numPokemon,
      required this.height,
      required this.weight,
      required this.candy,
      required this.egg});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((e) => e)),
        numPokemon: json["num"],
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        egg: json["egg"],
      );
}

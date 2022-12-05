import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/ui/widgets/item_pokemon_widget.dart';
import '../models/pokemon_model.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons=[];
  List<PokemonModel> pokemonModel = [];

  @override
  initState(){
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async{
    Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String,dynamic> myMap = json.decode(response.body);
      // pokemons = myMap["pokemon"];
      pokemonModel = myMap["pokemon"].map<PokemonModel>((e)=>PokemonModel.fromJson(e)).toList();
      print(pokemonModel);
      setState(() {
      });

      // pokemons.forEach((element) {
      //   print(element["type"]);
      // });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0,),
                const Text("Pokedex", style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30.0,),
                GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.35,
                  children: pokemonModel.map((e) => ItemPokemonWidget(
                    // name: e.name,
                    // image: e.img,
                    // types: e.type,
                    pokemon: e,
                  ),
                  ).toList(),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

////car iu
car general//
colors.dart
import 'package:flutter/material.dart';

Map<String, Color> colorsPokemon = {
  "Grass": Color(0xff4ACFB0),
  "Bug": Color(0xffC0C0C0),
  "Fire": Color(0xffFB6C6C),
  "Water": Color(0xff76BCFD),
  "Electric": Color(0xffFFD86F),
  "Normal": Color(0xff030303),
  "Ground": Color(0xff808000),
  "Poison": Color(0xff800000),
  "Rock": Color(0xff008080),
  "Psychic": Color(0xffC77AEE),
  "Fighting": Color(0xff753E13),
  "Ice": Color(0xff29F4F1),
  "Dragon": Color(0xffF8AD58),
};

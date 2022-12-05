detail_page.dart
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/ui/general/colors.dart';
import 'package:pokedex/ui/widgets/item_data_widget.dart';
import 'package:pokedex/ui/widgets/item_type_widget.dart';

class DetailPage extends StatelessWidget {

  PokemonModel pokemon;
  DetailPage({required this.pokemon,});
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite_border_outlined,),),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              top: height * 0.1,
              right: -30,
              child: Image.asset('assets/images/pokeball.png',
              height: 260,
              color: Colors.white.withOpacity(0.2),)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 6.0,),
                    Row(
                      children: pokemon.type.map((e) => ItemTypeWidget(text: e)).toList(),
                    ),
                  ],
                ),
                Text("#${pokemon.numPokemon}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(flex: 4,child: SizedBox()),
              Expanded(
                flex: 8,
                  child: Container(
                    width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        //datos
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            children: [
                              const Text("Pokemon Data",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                              ItemDataWidget(
                                tittle: "Height",
                                data:pokemon.height,
                              ),
                              ItemDataWidget(
                                tittle: "Weight",
                                data:pokemon.weight,
                              ),
                              ItemDataWidget(
                                tittle: "Candy",
                                data:pokemon.candy,
                              ),
                              ItemDataWidget(
                                tittle: "Eggs",
                                data:pokemon.egg,
                              ),
                            ],
                          ),
                        ),
                        // imagen
                        Positioned.fill(
                          top: -90,

                          child:Align(
                            alignment: Alignment.topCenter,
                          child: Image.network(pokemon.img,),),)
                      ],
                    ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
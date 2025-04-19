import 'dart:convert';
import 'package:app6/screens/pokemandetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pokepedia = [];
  void initState() {
    if (mounted) {
      fetchdata();
    }
    super.initState();
  }

  var papi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -10,
              right: -50,
              child: Image.asset(
                "assets/pokeball.png",
                width: 300,
                fit: BoxFit.fitHeight,
              )),
          Positioned(
              top: 100,
              child: Text(
                "pokepedia",
                style: TextStyle(color: Colors.black, fontSize: 30),
              )),
          Positioned(
              top: 160,
              bottom: 0,
              width: w,
              child: Column(
                children: [
                  pokepedia != null
                      ? Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 1.4),
                              itemCount: pokepedia.length,
                              itemBuilder: (context, index) {
                                var type = pokepedia[index]['type'][0];
                                return InkWell(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: type == 'Grass'
                                          ? Colors.greenAccent
                                          : type == 'Electric'
                                              ? Colors.yellow
                                              : type == 'Fire'
                                                  ? Colors.redAccent
                                                  : type == 'Ground'
                                                      ? Colors.brown
                                                      : type == 'Poison'
                                                          ? Colors.purpleAccent
                                                          : type == 'Water'
                                                              ? Colors
                                                                  .blueAccent
                                                              : type == 'Rock'
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .blueGrey,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            bottom: -10,
                                            right: -10,
                                            child: Image.asset(
                                              "assets/pokeball.png",
                                              width: 100,
                                              fit: BoxFit.fitHeight,
                                            )),
                                        Positioned(
                                            bottom: 10,
                                            left: 10,
                                            child: Text(
                                              pokepedia[index]['name'],
                                            )),
                                        Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: CachedNetworkImage(
                                              imageUrl: pokepedia[index]['img'],
                                            ))
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PokeDetail(
                                                tag: index,
                                                pokedetails: pokepedia[index],
                                                color: type == 'Grass'
                                                    ? Colors.greenAccent
                                                    : type == 'Electric'
                                                        ? Colors.yellow
                                                        : type == 'Fire'
                                                            ? Colors.redAccent
                                                            : type == 'Ground'
                                                                ? Colors.brown
                                                                : type ==
                                                                        'Poison'
                                                                    ? Colors
                                                                        .purpleAccent
                                                                    : type ==
                                                                            'Water'
                                                                        ? Colors
                                                                            .blueAccent
                                                                        : type ==
                                                                                'Rock'
                                                                            ? Colors.grey
                                                                            : Colors.blueGrey,
                                              )),
                                    );
                                  },
                                );
                              }),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ))
        ],
      ),
    );
  }

  void fetchdata() {
    var url = Uri.http("raw.githubusercontent.com",
        "Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedData = jsonDecode(value.body);
        pokepedia = decodedData["pokemon"];
        setState(() {});
      }
    });
  }
}

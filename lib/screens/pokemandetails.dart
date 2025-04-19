import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokeDetail extends StatefulWidget {
  final tag;
  final pokedetails;
  final Color color;
  const PokeDetail(
      {super.key,
      required this.tag,
      required this.pokedetails,
      required this.color});

  @override
  State<PokeDetail> createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back))),
          Positioned(
              top: 80,
              left: 20,
              child: Text(
                widget.pokedetails['name'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Positioned(
              top: 150,
              right: -30,
              child: Image.asset(
                "assets/pokeball.png",
                width: 200,
                fit: BoxFit.fitHeight,
              )),
          Positioned(
              top: 200,
              left: 15,
              child: CachedNetworkImage(
                  imageUrl: widget.pokedetails['img'],
                  fit: BoxFit.fitHeight,
                  height: 200)),
          Positioned(
            bottom: 0,
            child: Container(
              width: 600,
              height: 330,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 140,
                            child: Text(
                              'name',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: Text(
                              widget.pokedetails['name'],
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Text(
                            'height',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 140,
                          child: Text(
                            widget.pokedetails['height'],
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 120,
                          width: 15,
                          child: Text(
                            'weight',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Text(
                            widget.pokedetails['weight'],
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 120,
                          width: 140,
                          child: Text(
                            'spawntime',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Text(
                            widget.pokedetails['spawntime'],
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 120,
                          width: 140,
                          child: Text(
                            'weakness',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Text(
                            widget.pokedetails['wakenwss'],
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

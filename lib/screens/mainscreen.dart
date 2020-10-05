import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:superhero_app/model/superhero.dart';
import 'package:superhero_app/screens/description.dart';
import 'package:superhero_app/screens/settings.dart';
import 'package:superhero_app/search.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var url = "https://akabab.github.io/superhero-api/api/all.json";

  List superHero = List();

  @override
  void initState() {
    super.initState();
    fetchSuperHeroes();
  }

  bool loading = true;

  fetchSuperHeroes() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        superHero = json.decode(response.body);
      });
      setState(() {
        loading = false;
      });
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SuperHeroes',
            style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Feather.search,
                color: Theme.of(context).accentColor,
              ),
              iconSize: 25,
              onPressed: () {
                superHero == null
                    ? print("Chill")
                    : showSearch(
                        context: context,
                        delegate: HeroSearch(all: superHero),
                      );
              }),
          IconButton(
              icon: Icon(Feather.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Settings(),
                  ),
                );
              })
        ],
      ),
      body: Center(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GridView.builder(
                  itemCount: superHero.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.8 / 2.3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    SuperHero superhero = SuperHero.fromJson(superHero[index]);
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HeroDetails(
                                  hero: superhero,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: superhero.images.lg,
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: superhero.images.lg,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: SpinKitFadingCircle(
                                        size: 25,
                                        color: Theme.of(context).accentColor
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                      child: Icon(
                                        Icons.sentiment_very_dissatisfied,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          superhero.name,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}

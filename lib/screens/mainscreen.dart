import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:superhero_app/model/superhero.dart';
import 'package:superhero_app/screens/description.dart';

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
      throw Exception('Failed to Load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3.0,
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
                iconSize: 30,
                onPressed: () {})
          ],
        ),
        body: Center(
          child: loading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
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
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => HeroDetails(hero: superhero,)));},
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      superhero.images.lg,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                          Text(
                            superhero.name,
                            style:
                                TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    },
                  ),
              ),
        ));
  }
}

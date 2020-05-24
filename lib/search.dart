import 'package:flutter/material.dart';
import 'package:superhero_app/model/superhero.dart';
import 'package:superhero_app/screens/description.dart';

class HeroSearch extends SearchDelegate {
  final List all;

  HeroSearch({@required this.all});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Must be Longer than two characters",
            ),
          )
        ],
      );
    }

    var query1;
    var query2 = " ";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    //Search in the json for the query entered
    var search = all.where((hero) => hero['name'].contains(query2)).toList();

    return search == null
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Theme.of(context).accentColor),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: GridView.builder(
              itemCount: search == null ? 0 : search.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.8 / 2.3,
              ),
              itemBuilder: (BuildContext context, int position) {
                SuperHero superhero = SuperHero.fromJson(search[position]);
                return Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => HeroDetails(
                                      hero: superhero,
                                    )));
                      },
                      child: Hero(
                        tag: superhero.images.lg,
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
                    ),
                    Text(
                      superhero.name,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                );
              },
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var query1;
    var query2 = " ";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var search = all.where((hero) => hero['name'].contains(query2)).toList();

    return search == null
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          )
        : Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GridView.builder(
        itemCount: search == null ? 0 : search.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.8 / 2.3,
        ),
        itemBuilder: (BuildContext context, int position) {
          SuperHero superhero = SuperHero.fromJson(search[position]);
          return Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HeroDetails(
                            hero: superhero,
                          )));
                },
                child: Hero(
                  tag: superhero.images.lg,
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
              ),
              Text(
                superhero.name,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          );
        },
      ),
    );
  }
}

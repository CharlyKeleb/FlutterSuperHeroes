import 'package:flutter/material.dart';
import 'package:superhero_app/model/superhero.dart';

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
    if(query.length != 0){
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    //Search in the json for the query entered
    var search = all.where(
            (hero)=> hero['name'].contains(query2)
    ).toList();

    return search == null
        ? Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
      ),
    ) :
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: search == null ? 0 : search.length,
        itemBuilder: (BuildContext context, int position){
          SuperHero hero = SuperHero.fromJson(search[position]);

          return Container(
            height: 80,
            width: MediaQuery.of(context).size.width - 20,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:NetworkImage(hero.images.lg),
                  radius: 40,
                ),
                title:  Text(hero.biography.fullName.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(hero.biography.publisher.toUpperCase(),
              ),
                ),
            ),
          ));
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    var query1;
    var query2 = " ";
    if(query.length != 0){
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }


    var search = all.where(
            (hero)=> hero['name'].contains(query2)
    ).toList();

    return search == null
        ? Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    ) :
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: search == null ? 0 : search.length,
        itemBuilder: (BuildContext context, int position){
          SuperHero hero = SuperHero.fromJson(search[position]);

          return Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:NetworkImage(hero.images.lg),
                  ),
                  title: Text(hero.biography.fullName.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(hero.biography.publisher.toUpperCase(),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

}
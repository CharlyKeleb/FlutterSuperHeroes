import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:superhero_app/model/superhero.dart';

class HeroDetails extends StatefulWidget {
  final hero;

  const HeroDetails({Key key, this.hero});

  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            elevation: 0.0,
            title: Text(
              widget.hero.name,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.hero.images.lg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index > 0) return null;
            return Column(
              children: <Widget>[
                PowerStats(hero: widget.hero),
                Divider(
                  thickness: 1,
                ),
                Appearance(
                  hero: widget.hero,
                ),
                Divider(
                  thickness: 1,
                ),
                Biography(
                  hero: widget.hero,
                ),
                Divider(
                  thickness: 1,
                ),
                Work(
                  hero: widget.hero,
                ),
                Divider(
                  thickness: 1,
                ),
                Connections(
                  hero: widget.hero,
                ),
              ],
            );
          }))
        ],
      ),
    );
  }
}

class PowerStats extends StatelessWidget {
  final SuperHero hero;

  const PowerStats({Key key, this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'PowerStats',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
            title: Text("Intelligence".toUpperCase() +
                "  ${hero.powerstats.intelligence}%"),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.intelligence.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.blue,
            )),
        ListTile(
            title: Text(
                'Strength'.toUpperCase() + "  ${hero.powerstats.strength}%"),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.strength.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            )),
        ListTile(
            title: Text('Speed'.toUpperCase() + "  ${hero.powerstats.speed}%"),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.speed.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Theme.of(context).accentColor,
            )),
        ListTile(
            title: Text(
              'Durability'.toUpperCase(),
            ),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.durability.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.red,
            )),
        ListTile(
            title: Text('Power'.toUpperCase() + "  ${hero.powerstats.power}%"),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.power.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.purple,
            )),
        ListTile(
            title: Text(
                'Combat'.toUpperCase() + "  ${hero.powerstats.intelligence}%"),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.combat.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.amber,
            )),
      ],
    );
  }
}

class Appearance extends StatelessWidget {
  final SuperHero hero;

  const Appearance({Key key, this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Appearance',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Gender'.toUpperCase(),
          ),
          subtitle: Text(hero.appearance.gender),
        ),
        ListTile(
          title: Text(
            'Race'.toUpperCase(),
          ),
          subtitle: Text(hero.appearance.race.toString()),
        ),
        ListTile(
          title: Text(
            'Height'.toUpperCase(),
          ),
          subtitle: Text(hero.appearance.height.toString()),
        ),
        ListTile(
          title: Text(
            'Weight'.toUpperCase(),
          ),
          subtitle: Text(hero.appearance.weight.toString()),
        ),
        ListTile(
          title: Text(
            'Hair Color'.toUpperCase(),
          ),
          subtitle: Text(hero.appearance.hairColor),
        ),
        ListTile(
          title: Text(
            'Eye Color'.toUpperCase(),
          ),
          subtitle: Text(hero.appearance.eyeColor),
        ),
      ],
    );
  }
}

class Biography extends StatelessWidget {
  final SuperHero hero;

  const Biography({Key key, this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Biography',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Full Name'.toUpperCase(),
          ),
          subtitle: Text(hero.biography.fullName),
        ),
        ListTile(
          title: Text(
            'Alter Ego(s)'.toUpperCase(),
          ),
          subtitle: Text(hero.biography.alterEgos),
        ),
        ListTile(
          title: Text(
            'Aliases'.toUpperCase(),
          ),
          subtitle: Text(hero.biography.aliases),
        ),
        ListTile(
          title: Text(
            'Place Of Birth'.toUpperCase(),
          ),
          subtitle: Text(hero.biography.placeOfBirth),
        ),
        ListTile(
          title: Text(
            'Publisher'.toUpperCase(),
          ),
          subtitle: Text(hero.biography.publisher),
        ),
        ListTile(
          title: Text(
            'Alignment'.toUpperCase(),
          ),
          subtitle: Text(
            hero.biography.alignment,
          ),
        ),
      ],
    );
  }
}

class Work extends StatelessWidget {
  final SuperHero hero;

  const Work({Key key, this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Work',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Occupation'.toUpperCase(),
          ),
          subtitle: Text(hero.work.occupation),
        ),
        ListTile(
            title: Text(
              'Base'.toUpperCase(),
            ),
            subtitle: Text(
              (hero.work.base),
            ))
      ],
    );
  }
}

class Connections extends StatelessWidget {
  final SuperHero hero;

  const Connections({Key key, this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Connections',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Group Affiliation'.toUpperCase(),
          ),
          subtitle: Text(hero.connections.groupAffiliation),
        ),
        ListTile(
          title: Text(
            'Relatives'.toUpperCase(),
          ),
          subtitle: Text(hero.connections.relatives),
        )
      ],
    );
  }
}

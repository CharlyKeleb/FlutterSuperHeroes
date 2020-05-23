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
        appBar: AppBar(
          elevation: 0.0,
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              widget.hero.name,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          )),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(widget.hero.images.lg),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                    height: 300,
                    width: MediaQuery.of(context).size.width - 20,
                    child: ListView(
                      children: <Widget>[
                        PowerStats(hero: widget.hero),
                        Divider(
                          thickness: 1,
                        ),
                        ExpansionTile(
                          title: Text(
                            'Appearance',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Gender'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.appearance.gender),
                            ),
                            ListTile(
                              title: Text(
                                'Race'.toUpperCase(),
                              ),
                              subtitle:
                                  Text(widget.hero.appearance.race.toString()),
                            ),
                            ListTile(
                              title: Text(
                                'Height'.toUpperCase(),
                              ),
                              subtitle: Text(
                                  widget.hero.appearance.height.toString()),
                            ),
                            ListTile(
                              title: Text(
                                'Weight'.toUpperCase(),
                              ),
                              subtitle: Text(
                                  widget.hero.appearance.weight.toString()),
                            ),
                            ListTile(
                              title: Text(
                                'Hair Color'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.appearance.hairColor),
                            ),
                            ListTile(
                              title: Text(
                                'Eye Color'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.appearance.eyeColor),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        ExpansionTile(
                          title: Text(
                            'Biography',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Full Name'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.biography.fullName),
                            ),
                            ListTile(
                              title: Text(
                                'Alter Ego(s)'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.biography.alterEgos),
                            ),
                            ListTile(
                              title: Text(
                                'Aliases'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.biography.aliases),
                            ),
                            ListTile(
                              title: Text(
                                'Place Of Birth'.toUpperCase(),
                              ),
                              subtitle:
                                  Text(widget.hero.biography.placeOfBirth),
                            ),
                            ListTile(
                              title: Text(
                                'Publisher'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.biography.publisher),
                            ),
                            ListTile(
                              title: Text(
                                'Alignment'.toUpperCase(),
                              ),
                              subtitle: Text(
                                widget.hero.biography.alignment,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        ExpansionTile(
                          title: Text(
                            'Work',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Occupation'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.work.occupation),
                            ),
                            ListTile(
                                title: Text(
                                  'Base'.toUpperCase(),
                                ),
                                subtitle: Text(
                                  (widget.hero.work.base),
                                ))
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        ExpansionTile(
                          title: Text(
                            'Connections',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Group Affiliation'.toUpperCase(),
                              ),
                              subtitle: Text(
                                  widget.hero.connections.groupAffiliation),
                            ),
                            ListTile(
                              title: Text(
                                'Relatives'.toUpperCase(),
                              ),
                              subtitle: Text(widget.hero.connections.relatives),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
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
            title: Text("Intelligence".toUpperCase() +  "  ${hero.powerstats.intelligence}%"
            ),
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
              'Strength'.toUpperCase() +  "  ${hero.powerstats.strength}%"
            ),
            subtitle: LinearPercentIndicator(
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2500,
              percent: hero.powerstats.strength.toDouble() / 100.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            )),
        ListTile(
            title: Text(
              'Speed'.toUpperCase() +  "  ${hero.powerstats.speed}%"
            ),
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
            title: Text(
              'Power'.toUpperCase() +  "  ${hero.powerstats.power}%"
            ),
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
              'Combat'.toUpperCase() +  "  ${hero.powerstats.intelligence}%"
            ),
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

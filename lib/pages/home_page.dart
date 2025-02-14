import 'package:fifa_v1/models/tournament_model.dart';
import 'package:fifa_v1/pages/tournament_pages/tournament_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'U F C',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: tournamentList.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TournamentPage(tournament: tournamentList[index],))),
          title: Text(
            tournamentList[index].tournamentName,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
          leading: Icon(
            Icons.sports_soccer,
            color: Colors.white,
          ),
          subtitle: Text(
            'Season ${tournamentList[index].currentSeason.toString()}',
          ),
          subtitleTextStyle: TextStyle(
            color: Colors.white
          ),
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}
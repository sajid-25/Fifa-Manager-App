import 'package:fifa_v1/models/tournament_model.dart';
import 'package:flutter/material.dart';

class DetailedTournament extends StatelessWidget {
  final Tournament tournament;
  const DetailedTournament({
    super.key,
    required this.tournament
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        tournament.tournamentName,
                        style: TextStyle(
                          fontSize: 50
                        ),
                      ),
                      Text(
                        tournament.tournamentType
                      ),
                      Text(
                        'Season: ${tournament.currentSeason.toString()}'
                      )
                    ],
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/logo1.jpg').image
                      )
                    ),
                  ),
                ],
              ),
              Divider(
                height: 50,
                thickness: 2,
                endIndent: 20,
                indent: 20,
                color: const Color.fromARGB(59, 255, 255, 255),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${tournament.totalTeams.toString()} Teams Playing'
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
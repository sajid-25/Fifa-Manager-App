import 'package:fifa_v1/actions/add_tournament.dart';
import 'package:fifa_v1/fetch_data/build_document_stream.dart';
import 'package:fifa_v1/fetch_data/show_document_stream.dart';
import 'package:flutter/material.dart';

class TournamentPage extends StatelessWidget {
  final FireStoreService _tournamentService = FireStoreService();
  TournamentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowDocumentStream(documentStream: _tournamentService.getTournamentStream()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTournament()));
        },
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        
      ),  
    );
  }
}
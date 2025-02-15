import 'package:fifa_v1/fetch_data/build_document_stream.dart';
import 'package:fifa_v1/fetch_data/show_document_stream.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  final FireStoreService _tournamentService = FireStoreService();
  TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowDocumentStream(documentStream: _tournamentService.getTeamStream())
    );
  }
}
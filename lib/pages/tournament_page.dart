import 'package:fifa_v1/fetch_data/show_document_stream.dart';
import 'package:flutter/material.dart';

class TournamentPage extends StatelessWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowDocumentStream(),
    );
  }
}
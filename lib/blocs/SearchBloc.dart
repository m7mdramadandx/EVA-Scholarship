import 'dart:async';

import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Bloc.dart';

class SearchBloc implements Bloc {
  Repository _repository;
  PublishSubject oppFetcher;

  Stream<List<Opportunity>> get opportunityList => oppFetcher.stream;

  SearchBloc(String query) {
    _repository = Repository();
    oppFetcher = PublishSubject<List<Opportunity>>();
    searchScholarships(query);
  }

  searchScholarships(String query) async {
    List<Opportunity> oppResponse = await _repository.searchScholarship(query);
    oppFetcher.sink.add(oppResponse);
  }

  @override
  void dispose() {
    oppFetcher.close();
  }
}

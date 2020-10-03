import 'dart:async';

import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Bloc.dart';

class SearchBloc implements Bloc {
  Repository _repository;

  Stream<List<Opportunity>> get opportunityList => oppFetcher.stream;

  PublishSubject oppFetcher;

  List<Opportunity> oppList = List();

  // StreamSink<List<Opportunity>> get opportunity2 => oppFetcher.sink;
  SearchBloc(String query) {
    _repository = Repository();
    oppFetcher = PublishSubject<List<Opportunity>>();
    searchScholarships(query);
  }

  searchScholarships(String query) async {
    print(query);
    List<Opportunity> oppResponse = await _repository.searchScholarship(query);
    oppFetcher.sink.add(oppResponse);
  }

  fetchOpportunities() async {
    List<Opportunity> oppResponse = await _repository.fetchOpp();
    oppFetcher.sink.add(oppResponse);
    oppList = oppResponse;
  }

  @override
  void dispose() {
    oppFetcher.close();
  }
}

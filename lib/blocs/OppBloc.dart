import 'dart:async';

import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Bloc.dart';

class OppBloc implements Bloc {
  Repository _repository;
  PublishSubject oppFetcher;

  Stream<List<Opportunity>> get opportunityList => oppFetcher.stream;

  OppBloc() {
    oppFetcher = PublishSubject<List<Opportunity>>();
    _repository = Repository();
    fetchOpportunities();
  }

  fetchOpportunities() async {
    List<Opportunity> oppResponse = await _repository.fetchOpp();
    oppFetcher.sink.add(oppResponse);
  }

  @override
  void dispose() {
    oppFetcher.close();
  }
}

final oppBloc = OppBloc();

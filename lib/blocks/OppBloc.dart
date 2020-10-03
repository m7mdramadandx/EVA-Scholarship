import 'dart:async';

import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Block.dart';

class OppBloc implements Bloc {
  Repository _repository;

  PublishSubject oppFetcher;

  Stream<List<Opportunity>> get opportunityList => oppFetcher.stream;

  List<Opportunity> oppList = List();

  // StreamSink<List<Opportunity>> get opportunity2 => oppFetcher.sink;

  OppBloc() {
    oppFetcher = PublishSubject<List<Opportunity>>();
    _repository = Repository();
    fetchOpportunities();
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

final oppBloc = OppBloc();

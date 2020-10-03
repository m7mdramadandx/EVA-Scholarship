import 'dart:async';

import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Block.dart';

class OppBloc implements Bloc {
  Repository _repository;

  final oppFetcher = PublishSubject<List<Opportunity>>();
  StreamController _oppListController;

  Stream<List<Opportunity>> get opportunityList => oppFetcher.stream;

  // StreamSink<List<Opportunity>> get opportunity2 => oppFetcher.sink;

  OppBloc() {
    _oppListController = StreamController<List<Opportunity>>();
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

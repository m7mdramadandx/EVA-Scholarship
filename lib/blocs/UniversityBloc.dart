import 'package:eva_pharma/models/University.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Bloc.dart';

class UniversityBloc implements Bloc {
  Repository _repository;
  PublishSubject universityFetcher;
  static List<University> universityList;

  Stream<List<University>> get university => universityFetcher.stream;

  UniversityBloc() {
    _repository = Repository();
    universityFetcher = PublishSubject<List<University>>();
    fetchUniversities();
  }

  fetchUniversities() async {
    List<University> universityResponse = await _repository.fetchUniversity();
    universityFetcher.sink.add(universityResponse);
    universityList = await _repository.fetchUniversity();
  }

  @override
  void dispose() {
    universityFetcher.close();
  }
}

final universityBloc = UniversityBloc();

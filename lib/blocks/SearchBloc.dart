import 'package:eva_pharma/models/University.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Block.dart';

class SearchBlock implements Bloc {
  Repository _repository = Repository();
  final oppFetcher = PublishSubject<List<University>>();

  Stream<List<University>> get university => oppFetcher.stream;

  fetchUniversities() async {
    List<University> oppResponse = await _repository.search();
    oppFetcher.sink.add(oppResponse);
  }

  void submitQuery(String query) async {
    final results = await _repository.search2(query);
    oppFetcher.sink.add(results);
  }

  @override
  void dispose() {
    oppFetcher.close();
  }
}

final universityBloc = SearchBlock();

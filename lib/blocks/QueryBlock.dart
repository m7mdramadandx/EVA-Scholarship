import 'package:eva_pharma/models/Place.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Block.dart';

class QueryBLock implements Block {
  Repository _repository = Repository();
  final _weatherFetcher = PublishSubject<Place>();

  Stream<Place> get weather => _weatherFetcher.stream;

  void submitQuery(String query) async {
    // 1
    // final results = await _client.fetchLocations(query);
    // _weatherFetcher.sink.add(results);
  }

  @override
  void dispose() {
    _weatherFetcher.close();
  }
}

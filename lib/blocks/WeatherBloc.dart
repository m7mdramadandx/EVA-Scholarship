import 'package:eva_pharma/models/Place.dart';
import 'package:eva_pharma/repository/OppRepository.dart';
import 'package:rxdart/rxdart.dart';

import 'Block.dart';

class PlaceBloc implements Block {
  Repository _repository = Repository();
  final _weatherFetcher = PublishSubject<Place>();

  Stream<Place> get weather => _weatherFetcher.stream;

  fetchLondonWeather() async {
    Place _weatherResponse = await _repository.fetchLondonWeather();

    _weatherFetcher.sink.add(_weatherResponse);
  }

  @override
  void dispose() {
    _weatherFetcher.close();
  }
}

final placeBloc = PlaceBloc();

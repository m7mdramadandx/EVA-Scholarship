import 'package:eva_pharma/models/Opportunity.dart';
import 'package:eva_pharma/models/University.dart';

class OppResponse {
  static List<Opportunity> parseOpportunities(List<dynamic> list) {
    return list.map((i) => Opportunity.fromJson(i)).toList();
  }

  static List<University> parseUniversities(List<dynamic> list) {
    return list.map((i) => University.fromJson(i)).toList();
  }
}

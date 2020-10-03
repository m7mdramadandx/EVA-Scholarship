import 'package:eva_pharma/models/Benefits.dart';
import 'package:eva_pharma/models/Eligibility.dart';
import 'package:eva_pharma/models/University.dart';

class Opportunity {
  final int id;
  final int eligibilityId;
  final int benefitId;
  final int universityId;
  final University university;
  final Benefits benefits;
  final Eligibility eligibility;
  final String universityName;
  final bool financialAid;
  final String applicationProcess;
  final String extraInfo;
  final String otherLanguageTests;
  final String applicationDeadline;
  final String description;
  final String deliveryMode;
  final String duration;
  final String fundType;
  final double ieltsLevel;
  final double toeflLevel;
  final String specialization;
  final String neededLanguageInfo;
  final String aidCoverage;
  final String startDate;
  final String title;

  Opportunity(
      {this.id,
      this.eligibilityId,
      this.benefitId,
      this.universityId,
      this.university,
      this.benefits,
      this.eligibility,
      this.universityName,
      this.financialAid,
      this.applicationProcess,
      this.extraInfo,
      this.otherLanguageTests,
      this.applicationDeadline,
      this.description,
      this.deliveryMode,
      this.duration,
      this.fundType,
      this.ieltsLevel,
      this.toeflLevel,
      this.specialization,
      this.neededLanguageInfo,
      this.aidCoverage,
      this.startDate,
      this.title});

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      id: json['id'] ?? '',
      eligibilityId: json['eligibilityId'] ?? '',
      benefitId: json['benefitId'] ?? '',
      universityId: json['universityId'] ?? '',
      university: json['university'] ?? University(),
      universityName: json['universityName'] ?? '',
      financialAid: json['financialAid'] ?? false,
      applicationProcess: json['applicationProcess'] ?? '',
      extraInfo: json['extraInfo'] ?? '',
      otherLanguageTests: json['otherLanguageTests'] ?? '',
      applicationDeadline: json['applicationDeadline'].substring(0, 10) ?? '',
      startDate: json['startDate'] ?? '',
      duration: json['duration'] ?? '',
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      deliveryMode: json['deliveryMode'] ?? '',
      fundType: json['fundType'] ?? '',
      ieltsLevel:
          json['ieltsLevel'] != null ? json['ieltsLevel'].toDouble() : 0.0,
      toeflLevel:
          json['toeflLevel'] != null ? json['toeflLevel'].toDouble() : 0.0,
      specialization: json['specialization'] ?? '',
      neededLanguageInfo: json['neededLanguageInfo'] ?? '',
      aidCoverage: json['aidCoverage'] ?? '',
    );
  }
}

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
      // geometry: Geometry.fromJson(json['geometry']),
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

/*
class Opportunity {
  final String applicationProcess;
  List<Benefits> benefits = new List();
  final String city;
  final String deadline;
  final String description;
  final String duration;
  List<Eligibility> eligibility = new List();
  final String financialAid;
  final String fundingType;
  final String imageUrl;
  final String moreDetails;
  final double rate;
  List<RequiredDegree> requiredDegree = new List();
  List<RequiredTests> requiredTests = new List();
  final String requiredDocuments;
  List<RequiredSchoolDegree> requiredSchoolDegree = new List();
  final String specialties;
  final String startDate;
  final String title;
  final String type;
  final String universityName;

  Opportunity({
    this.applicationProcess,
    this.benefits,
    this.city,
    this.deadline,
    this.description,
    this.duration,
    this.eligibility,
    this.financialAid,
    this.fundingType,
    this.imageUrl,
    this.moreDetails,
    this.rate,
    this.requiredDegree,
    this.requiredTests,
    this.requiredDocuments,
    this.requiredSchoolDegree,
    this.specialties,
    this.startDate,
    this.title,
    this.type,
    this.universityName,
  });
}

List<Opportunity> opportunityList = [
  Opportunity(
    deadline: '31/08/2020',
    title:
        'Nile University_Banque Misr Foundation for Social Development scholarship',
    universityName: 'Nile University',
    city: 'Cairo',
    fundingType: 'Fully/Partially Funded',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/04/acc-2017.jpg',
    rate: 4.0,
    benefits: [
      Benefits(benefitName: 'Cover Tuition Fees', details: 'Full tuition fee'),
      Benefits(
          benefitName: 'Accommodation',
          details:
              'Allowance for accommodation in University shared a dormitory'),
      Benefits(
          benefitName: 'Salary',
          details: 'Total Value: \$8,000 as \$2,000 renewable award each year'),
    ],
    eligibility: [
      Eligibility(eligibilityName: 'Age', details: '18-24'),
      Eligibility(eligibilityName: 'Gender', details: 'All'),
      Eligibility(eligibilityName: 'Nationality', details: 'Egypt'),
      Eligibility(
          eligibilityName: 'Required Languages',
          details: 'Arabic, English, French'),
    ],
    requiredSchoolDegree: [
      RequiredSchoolDegree(
          schoolType: 'Thanwya Amma',
          constrains:
              '94% MIN. Score Math Division, 90% MIN. Score Arts Division'),
      RequiredSchoolDegree(
          schoolType: 'STEM School', constrains: '94% MIN. Score'),
      RequiredSchoolDegree(
          schoolType: 'Nile School', constrains: '90% MIN. Score'),
    ],
    requiredDegree: [],
    requiredTests: [
      RequiredTests(testName: 'IELTS', score: '7/9 MIN. Score'),
      RequiredTests(testName: 'TOEFL-ITP', score: '500/667 MIN. Score'),
      RequiredTests(testName: 'TOEFL-IBT', score: '61/120 MIN. Score'),
    ],
    type: 'Bachelor',
    startDate: '',
    duration: 'More than year',
    moreDetails:
        'High academic progress toward completion of degree requirements. A scholarship recipient is required to maintain minimum 3.0 GPA throughout the course of study. Failure to maintain the required GPA will result in losing their place on the scholarship program.',
    description:
        'Banque Misr Foundation for Social Development is offering full scholarships to Egyptian students from all over Egypt applying for undergraduate studies at Nile University at the School of Engineering and Applied Sciences, School of Business Administration covering the full duration of study.',
    specialties:
        'Business & Management, Business Studies, Civil Engineering & Construction, Economics, Electronics & Embedded Technology, Engineering & Technology, Entrepreneurship, Finance, General Engineering & Technology, Management, Marketing, Mechanical Engineering, Social Sciences',
  ),
  Opportunity(
    deadline: '31/08/2020',
    title:
        'Nile University_Banque Misr Foundation for Social Development scholarship',
    universityName: 'Nile University',
    city: 'Cairo',
    fundingType: 'Fully/Partially Funded',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/07/woman-in-black-and-white-stripe-shirt-holding-books-3807735.jpg',
    rate: 4.0,
    benefits: [
      Benefits(benefitName: 'Cover Tuition Fees', details: 'Full tuition fee'),
      Benefits(
          benefitName: 'Accommodation',
          details:
              'Allowance for accommodation in University shared a dormitory'),
      Benefits(
          benefitName: 'Salary',
          details: 'Total Value: \$8,000 as \$2,000 renewable award each year'),
    ],
    requiredDegree: [],
    eligibility: [
      Eligibility(eligibilityName: 'Age', details: '18-24'),
      Eligibility(eligibilityName: 'Gender', details: 'All'),
      Eligibility(eligibilityName: 'Nationality', details: 'Egypt'),
      Eligibility(
          eligibilityName: 'Required Languages',
          details: 'Arabic, English, French'),
    ],
    requiredSchoolDegree: [
      RequiredSchoolDegree(
          schoolType: 'Thanwya Amma',
          constrains:
              '94% MIN. Score Math Division, 90% MIN. Score Arts Division'),
      RequiredSchoolDegree(
          schoolType: 'STEM School', constrains: '94% MIN. Score'),
      RequiredSchoolDegree(
          schoolType: 'Nile School', constrains: '90% MIN. Score'),
    ],
    requiredTests: [
      RequiredTests(testName: 'IELTS', score: '7/9 MIN. Score'),
      RequiredTests(testName: 'TOEFL-ITP', score: '500/667 MIN. Score'),
      RequiredTests(testName: 'TOEFL-IBT', score: '61/120 MIN. Score'),
    ],
    type: 'Bachelor',
    startDate: '',
    duration: 'More than year',
    moreDetails:
        'High academic progress toward completion of degree requirements. A scholarship recipient is required to maintain minimum 3.0 GPA throughout the course of study. Failure to maintain the required GPA will result in losing their place on the scholarship program.',
    description:
        'Banque Misr Foundation for Social Development is offering full scholarships to Egyptian students from all over Egypt applying for undergraduate studies at Nile University at the School of Engineering and Applied Sciences, School of Business Administration covering the full duration of study.',
    specialties:
        'Business & Management, Business Studies, Civil Engineering & Construction, Economics, Electronics & Embedded Technology, Engineering & Technology, Entrepreneurship, Finance, General Engineering & Technology, Management, Marketing, Mechanical Engineering, Social Sciences',
  ),
];

List<Opportunity> opportunityList2 = [
  Opportunity(
    deadline: '31/08/2020',
    title: 'Academic Achievement Scholarship',
    universityName: 'Egypt-Japan University',
    city: 'Cairo',
    fundingType: 'Fully/Partially Funded',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/08/69904.jpg',
    rate: 4.0,
    benefits: [
      Benefits(benefitName: 'Cover Tuition Fees', details: 'Full tuition fee'),
      Benefits(
          benefitName: 'Accommodation',
          details:
              'Allowance for accommodation in University shared a dormitory'),
      Benefits(
          benefitName: 'Salary',
          details: 'Total Value: \$8,000 as \$2,000 renewable award each year'),
    ],
    requiredDegree: [],
    eligibility: [
      Eligibility(eligibilityName: 'Age', details: '18-24'),
      Eligibility(eligibilityName: 'Gender', details: 'All'),
      Eligibility(eligibilityName: 'Nationality', details: 'Egypt'),
      Eligibility(
          eligibilityName: 'Required Languages',
          details: 'Arabic, English, French'),
    ],
    requiredSchoolDegree: [
      RequiredSchoolDegree(
          schoolType: 'Thanwya Amma',
          constrains:
              '94% MIN. Score Math Division, 90% MIN. Score Arts Division'),
      RequiredSchoolDegree(
          schoolType: 'STEM School', constrains: '94% MIN. Score'),
      RequiredSchoolDegree(
          schoolType: 'Nile School', constrains: '90% MIN. Score'),
    ],
    requiredTests: [
      RequiredTests(testName: 'IELTS', score: '7/9 MIN. Score'),
      RequiredTests(testName: 'TOEFL-ITP', score: '500/667 MIN. Score'),
      RequiredTests(testName: 'TOEFL-IBT', score: '61/120 MIN. Score'),
    ],
    type: 'Bachelor',
    startDate: '',
    duration: 'More than year',
    moreDetails:
        'High academic progress toward completion of degree requirements. A scholarship recipient is required to maintain minimum 3.0 GPA throughout the course of study. Failure to maintain the required GPA will result in losing their place on the scholarship program.',
    description:
        'Banque Misr Foundation for Social Development is offering full scholarships to Egyptian students from all over Egypt applying for undergraduate studies at Nile University at the School of Engineering and Applied Sciences, School of Business Administration covering the full duration of study.',
    specialties:
        'Business & Management, Business Studies, Civil Engineering & Construction, Economics, Electronics & Embedded Technology, Engineering & Technology, Entrepreneurship, Finance, General Engineering & Technology, Management, Marketing, Mechanical Engineering, Social Sciences',
  ),
  Opportunity(
    deadline: '31/08/2020',
    title: 'AUC International Graduate Fellowships',
    universityName: 'AUC ',
    city: 'Cairo',
    fundingType: 'Fully/Partially Funded',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/09/Screenshot-540.png',
    rate: 4.0,
    benefits: [
      Benefits(benefitName: 'Cover Tuition Fees', details: 'Full tuition fee'),
      Benefits(
          benefitName: 'Accommodation',
          details:
              'Allowance for accommodation in University shared a dormitory'),
      Benefits(
          benefitName: 'Salary',
          details: 'Total Value: \$8,000 as \$2,000 renewable award each year'),
    ],
    requiredDegree: [],
    eligibility: [
      Eligibility(eligibilityName: 'Age', details: '18-24'),
      Eligibility(eligibilityName: 'Gender', details: 'All'),
      Eligibility(eligibilityName: 'Nationality', details: 'Egypt'),
      Eligibility(
          eligibilityName: 'Required Languages',
          details: 'Arabic, English, French'),
    ],
    requiredSchoolDegree: [
      RequiredSchoolDegree(
          schoolType: 'Thanwya Amma',
          constrains:
              '94% MIN. Score Math Division, 90% MIN. Score Arts Division'),
      RequiredSchoolDegree(
          schoolType: 'STEM School', constrains: '94% MIN. Score'),
      RequiredSchoolDegree(
          schoolType: 'Nile School', constrains: '90% MIN. Score'),
    ],
    requiredTests: [
      RequiredTests(testName: 'IELTS', score: '7/9 MIN. Score'),
      RequiredTests(testName: 'TOEFL-ITP', score: '500/667 MIN. Score'),
      RequiredTests(testName: 'TOEFL-IBT', score: '61/120 MIN. Score'),
    ],
    type: 'Bachelor',
    startDate: '',
    duration: 'More than year',
    moreDetails:
        'High academic progress toward completion of degree requirements. A scholarship recipient is required to maintain minimum 3.0 GPA throughout the course of study. Failure to maintain the required GPA will result in losing their place on the scholarship program.',
    description:
        'Banque Misr Foundation for Social Development is offering full scholarships to Egyptian students from all over Egypt applying for undergraduate studies at Nile University at the School of Engineering and Applied Sciences, School of Business Administration covering the full duration of study.',
    specialties:
        'Business & Management, Business Studies, Civil Engineering & Construction, Economics, Electronics & Embedded Technology, Engineering & Technology, Entrepreneurship, Finance, General Engineering & Technology, Management, Marketing, Mechanical Engineering, Social Sciences',
  ),
];
*/

class Opportunity {
  String age;
  String aidCoverage;
  String applicationProcess;
  String benefits;
  String city;
  String deadline;
  String description;
  String duration;
  String field;
  String financialAid;
  String fundingType;
  String gender;
  String imageUrl;
  String ieltsLevel;
  String moreDetails;
  String nationality;
  double rate;
  String requiredDegree;
  String requiredDocuments;
  String requiredEnglishTests;
  String specialties;
  String startDate;
  String title;
  String toeflLevel;
  String type;
  String universityName;

  Opportunity({
    this.age,
    this.aidCoverage,
    this.applicationProcess,
    this.benefits,
    this.city,
    this.deadline,
    this.description,
    this.duration,
    this.field,
    this.financialAid,
    this.fundingType,
    this.gender,
    this.imageUrl,
    this.ieltsLevel,
    this.moreDetails,
    this.nationality,
    this.rate,
    this.requiredDegree,
    this.requiredDocuments,
    this.requiredEnglishTests,
    this.specialties,
    this.startDate,
    this.title,
    this.toeflLevel,
    this.type,
    this.universityName,
  });
}

List<Opportunity> opportunityList = [
  Opportunity(
    age: '18-24',
    deadline: '31/08/2020',
    title:
        'Nile University_Banque Misr Foundation for Social Development scholarship',
    universityName: 'Nile University',
    city: 'Cairo',
    field: '',
    fundingType: 'Fully/Partially Funded',
    gender: 'All',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/07/woman-in-black-and-white-stripe-shirt-holding-books-3807735.jpg',
    toeflLevel: '61/120 MIN Score',
    ieltsLevel: '6/9 MIN Score',
    rate: 4.0,
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
    age: 'Not Specified',
    deadline: '15/10/2021',
    title:
        'Cynthia Nelson Endowed Fellowships in Gender and Women’s Studies (IGWS)',
    city: 'Cairo',
    universityName: 'AUC',
    field: '',
    fundingType: 'Partially Funded',
    gender: 'All',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/09/Screenshot-540.png ',
    toeflLevel: '',
    ieltsLevel: ' ',
    rate: 4.0,
    type: 'Fellowships',
    startDate: '',
    duration: 'From 6 months to 12 months',
    moreDetails: ' ',
    description:
        " The late Cynthia Nelson, professor of anthropology, founding director of the Cynthia Nelson Institute of Gender and Women Studies (IGWS) and former dean of the School of Humanities and Social Sciences, joined AUC in 1963. Her efforts to further gender and women’s studies in Egypt and the Arab world have made her a notable and respected figure in her field. Her outstanding lifetime contributions to AUC remain unparalleled as she is a role model for generations of young and aspiring scholars."
        " In addition to full or partial tuition support, the highly competitive Cynthia Nelson Endowed Fellowships in Gender and Women’s Studies (IGWS) will provide students with the opportunity to work with a faculty member on research and other professional endeavors.",
    specialties: 'Gender & Sexuality Studies, Humanities, Social Sciences',
  ),
  Opportunity(
    age: ' ',
    deadline: ' ',
    title: 'Laboratory Instruction Graduate Fellowships',
    city: 'Cairo',
    universityName: 'AUC',
    field: '',
    fundingType: 'Fully Funded',
    gender: 'All',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/07/0-4-1536x1022.jpg ',
    toeflLevel: '61/120 MIN Score',
    ieltsLevel: '6/9 MIN Score',
    rate: 5.0,
    type: 'Fellowships ',
    startDate: '11/01/2021',
    duration: 'More than year',
    moreDetails: ' ',
    description:
        'International Graduate Fellowships are offered to highly qualified international students who wish to pursue full-time study (nine credits per semester) toward a master degree in one of the graduate programs at AUC.',
    specialties:
        'Art, Business & Management, Business Administration, Business Information Systems, Creative, Applied Arts and Design, Education & Training, Engineering & Technology, Global studies, Law Sciences, Management, Medicine & Health, Public Administration, Public Health, Public Policy, Social Sciences, Web Technologies & Cloud Computing',
  ),
  Opportunity(
    age: ' ',
    deadline: ' ',
    title: 'Apply For Master Scholarship To Study At Nile University 2020',
    city: 'Cairo',
    universityName: 'Nile University',
    field: '',
    fundingType: 'Fully Funded',
    gender: 'All',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/06/foreign-students.jpg ',
    toeflLevel: '61/120 MIN Score',
    ieltsLevel: '6/9 MIN Score',
    rate: 4.0,
    type: 'Master',
    startDate: '11/01/2021',
    duration: '2-3 Years',
    moreDetails: ' ',
    description:
        'International Graduate Fellowships are offered to highly qualified international students who wish to pursue full-time study (nine credits per semester) toward a master degree in one of the graduate programs at AUC.',
    specialties:
        'Art, Business & Management, Business Administration, Business Information Systems, Creative, Applied Arts and Design, Education & Training, Engineering & Technology, Global studies, Law Sciences, Management, Medicine & Health, Public Administration, Public Health, Public Policy, Social Sciences, Web Technologies & Cloud Computing',
  ),
  Opportunity(
    age: ' ',
    deadline: ' ',
    title: 'AUC International Graduate Fellowships',
    city: 'Cairo',
    universityName: 'AUC',
    field: '',
    fundingType: 'Fully Funded',
    gender: 'All',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/09/Screenshot-540.png ',
    toeflLevel: '61/120 MIN Score',
    ieltsLevel: '6/9 MIN Score',
    rate: 4.0,
    type: 'Master',
    startDate: '11/01/2021',
    duration: 'More than year',
    moreDetails: ' ',
    description:
        'International Graduate Fellowships are offered to highly qualified international students who wish to pursue full-time study (nine credits per semester) toward a master degree in one of the graduate programs at AUC.',
    specialties:
        'Art, Business & Management, Business Administration, Business Information Systems, Creative, Applied Arts and Design, Education & Training, Engineering & Technology, Global studies, Law Sciences, Management, Medicine & Health, Public Administration, Public Health, Public Policy, Social Sciences, Web Technologies & Cloud Computing',
  ),
  Opportunity(
    age: ' ',
    deadline: ' ',
    title: 'AUC International Graduate Fellowships',
    city: 'Cairo',
    universityName: 'AUC',
    field: '',
    fundingType: 'Fully Funded',
    gender: 'All',
    imageUrl:
        'https://marj3.azureedge.net/wp-content/uploads/2020/09/Screenshot-540.png ',
    toeflLevel: '61/120 MIN Score',
    ieltsLevel: '6/9 MIN Score',
    rate: 4.0,
    type: 'Master',
    startDate: '11/01/2021',
    duration: 'More than year',
    moreDetails: ' ',
    description:
        'International Graduate Fellowships are offered to highly qualified international students who wish to pursue full-time study (nine credits per semester) toward a master degree in one of the graduate programs at AUC.',
    specialties:
        'Art, Business & Management, Business Administration, Business Information Systems, Creative, Applied Arts and Design, Education & Training, Engineering & Technology, Global studies, Law Sciences, Management, Medicine & Health, Public Administration, Public Health, Public Policy, Social Sciences, Web Technologies & Cloud Computing',
  ),
];

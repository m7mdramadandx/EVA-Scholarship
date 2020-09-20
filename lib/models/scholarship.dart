class Scholarship {
  String imageUrl;
  String city;
  String type;
  String fundingType;
  String field;
  double rate;
  String description;

  Scholarship({
    this.imageUrl,
    this.city,
    this.type,
    this.fundingType,
    this.field,
    this.rate,
    this.description,
  });
}

List<Scholarship> scholarship = [
  Scholarship(
    imageUrl:
        'https://cdn.uncf.org/wp-content/uploads/member_colleges/talledega/TalladegaLibrary800.jpg',
    city: 'Paris',
    type: 'Master',
    fundingType: 'Fully funded',
    field: 'Biology',
    rate: 5.0,
    description: 'Visit Paris for an amazing and unforgettable adventure.',
  ),
  Scholarship(
    imageUrl:
        'https://cdn.uncf.org/wp-content/uploads/heroes/2018LaneCollege1440-1024x544.jpg',
    city: 'New Delhi',
    type: 'PHD',
    fundingType: 'Partially funded',
    field: 'Computer Science',
    rate: 4.5,
    description: 'PHD Description1.',
  ),
  Scholarship(
    imageUrl:
        'https://cdn.uncf.org/wp-content/uploads/heroes/2018LaneCollege1440-1024x544.jpg',
    city: 'New Delhi',
    type: 'PHD',
    fundingType: 'Partially funded',
    field: 'Computer Science',
    rate: 4.5,
    description: 'PHD Description2.',
  ),
  Scholarship(
    imageUrl:
        'https://static01.nyt.com/images/2020/03/14/upshot/14up-colleges-remote/14up-colleges-remote-facebookJumbo.jpg',
    city: 'Sao Paulo',
    type: 'FellowShip',
    fundingType: 'Awarded',
    field: 'Business',
    rate: 4.0,
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
  ),
  Scholarship(
    imageUrl:
        'https://www.bestvalueschools.org/wp-content/uploads/2017/08/7633545e449854b939174fafc89bf5.jpg',
    city: 'Venice',
    type: 'IB',
    fundingType: 'Partially funded',
    field: 'Law',
    rate: 5.0,
    description: 'Visit Venice for an amazing and unforgettable adventure.',
  ),
];

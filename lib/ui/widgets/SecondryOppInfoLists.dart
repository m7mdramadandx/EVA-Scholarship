// import 'package:eva_pharma/models/Benefits.dart';
// import 'package:eva_pharma/models/Eligibility.dart';
// import 'package:eva_pharma/models/Opportunity.dart';
// import 'package:eva_pharma/models/RequiredDegree.dart';
// import 'package:eva_pharma/models/RequiredHighSchoolDegree.dart';
// import 'package:eva_pharma/models/RequiredTests.dart';
// import 'package:eva_pharma/ui/widgets/colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SecondaryOppInfo extends StatelessWidget {
//   final Opportunity opportunity;
//
//   SecondaryOppInfo({
//     Key key,
//     this.opportunity,
//   }) : super(key: key);
//
//   final divider = Container(height: 1, color: Colors.black12);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Padding(
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     eligibility(opportunity.eligibility),
//                     SizedBox(height: 16),
//                     requiredDegree(opportunity.requiredDegree),
//                     SizedBox(height: 16),
//                     requiredSchoolDegree(opportunity.requiredSchoolDegree),
//                     SizedBox(height: 16),
//                     requiredTests(opportunity.requiredTests),
//                     SizedBox(height: 16),
//                     benefits(opportunity.benefits),
//                   ]))
//         ]);
//   }
//
//   Widget requiredDegree(List<RequiredDegree> requiredDegree) {
//     return requiredDegree.isEmpty
//         ? Container()
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header('Required Degree'),
//               SizedBox(height: 4),
//               ...List.generate(requiredDegree.length, (index) {
//                 return Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       children: [
//                         Row(children: [
//                           Expanded(
//                             flex: 40,
//                             child: Text(requiredDegree[index].degreeType,
//                                 style: TextStyle(
//                                     color: kPrimaryColor,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                           SizedBox(width: 4),
//                           Expanded(
//                             flex: 80,
//                             child: Text(requiredDegree[index].constrains,
//                                 style: TextStyle(height: 1.5)),
//                           )
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2),
//                           child: divider,
//                         ),
//                       ],
//                     ));
//               }),
//             ],
//           );
//   }
//
//   Widget requiredSchoolDegree(List<RequiredSchoolDegree> requiredSchoolDegree) {
//     return requiredSchoolDegree.isEmpty
//         ? Container()
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header('Required High School Degree'),
//               SizedBox(height: 4),
//               ...List.generate(requiredSchoolDegree.length, (index) {
//                 return Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       children: [
//                         Row(children: [
//                           Expanded(
//                             flex: 40,
//                             child: Text(requiredSchoolDegree[index].schoolType,
//                                 style: TextStyle(
//                                     color: kPrimaryColor,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                           SizedBox(width: 4),
//                           Expanded(
//                             flex: 80,
//                             child: Text(requiredSchoolDegree[index].constrains,
//                                 style: TextStyle(height: 1.5)),
//                           )
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2),
//                           child: divider,
//                         ),
//                       ],
//                     ));
//               }),
//             ],
//           );
//   }
//
//   Widget benefits(List<Benefits> benefits) {
//     return benefits.isEmpty
//         ? Container()
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header('Benefits'),
//               SizedBox(height: 4),
//               ...List.generate(benefits.length, (index) {
//                 return Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       children: [
//                         Row(children: [
//                           Expanded(
//                             flex: 40,
//                             child: Text(benefits[index].benefitName,
//                                 style: TextStyle(
//                                     color: kPrimaryColor,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                           SizedBox(width: 4),
//                           Expanded(
//                             flex: 80,
//                             child: Text(benefits[index].details,
//                                 style: TextStyle(height: 1.5)),
//                           )
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2),
//                           child: divider,
//                         ),
//                       ],
//                     ));
//               }),
//             ],
//           );
//   }
//
//   Widget requiredTests(List<RequiredTests> requiredTests) {
//     return requiredTests.isEmpty
//         ? Container()
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header('Required Tests'),
//               SizedBox(height: 4),
//               ...List.generate(requiredTests.length, (index) {
//                 return Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       children: [
//                         Row(children: [
//                           Expanded(
//                             flex: 40,
//                             child: Text(requiredTests[index].testName,
//                                 style: TextStyle(
//                                     color: kPrimaryColor,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                           SizedBox(width: 4),
//                           Expanded(
//                             flex: 80,
//                             child: Text(requiredTests[index].score,
//                                 style: TextStyle(height: 1.5)),
//                           )
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2),
//                           child: divider,
//                         ),
//                       ],
//                     ));
//               }),
//             ],
//           );
//   }
//
//   Widget eligibility(List<Eligibility> eligibility) {
//     return eligibility.isEmpty
//         ? Container()
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               header('Eligibility'),
//               SizedBox(height: 4),
//               ...List.generate(eligibility.length, (index) {
//                 return Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       children: [
//                         Row(children: [
//                           Expanded(
//                             flex: 40,
//                             child: Text(eligibility[index].eligibilityName,
//                                 style: TextStyle(
//                                     color: kPrimaryColor,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                           SizedBox(width: 4),
//                           Expanded(
//                             flex: 80,
//                             child: Text(eligibility[index].details,
//                                 style: TextStyle(height: 1.5)),
//                           )
//                         ]),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2),
//                           child: divider,
//                         ),
//                       ],
//                     ));
//               }),
//             ],
//           );
//   }
//
//   Widget info(String text) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 5, 0, 20),
//       child: Text(
//         text,
//         style: TextStyle(height: 1.5),
//       ),
//     );
//   }
//
//   Widget header(String header) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(header,
//               style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//           Container(
//               margin: EdgeInsets.only(top: 4), //top padding 5
//               height: 2,
//               width: 40,
//               color: kPrimaryColor)
//         ],
//       ),
//     );
//   }
// }

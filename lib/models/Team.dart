import 'package:cloud_firestore/cloud_firestore.dart';
enum CompetitionType { suiveur, toutTerrain, autonome, junior }
class Team {

  final String teamName;
  final String robotName;
  final String teamChef;
  final String competitionType;
  final String phoneNumber;


  Team({
    required this.teamName,
    required this.robotName,
    required this.teamChef,
    required this.competitionType,
    required this.phoneNumber,
  });

  // Create a map from Team object
  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'robotName': robotName,
      'teamChef': teamChef,
      'competitionType': competitionType,
      'phoneNumber': phoneNumber,
    };
  }

  // Create a Team object from DocumentSnapshot
  factory Team.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return Team(
      teamName: data['teamName'],
      robotName: data['robotName'],
      teamChef: data['teamChef'],
      competitionType: data['competitionType'],
      phoneNumber:data['phoneNumber'] ,
    );
  }
}
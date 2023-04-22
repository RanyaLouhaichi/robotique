import 'dart:js';

import 'package:flutter/material.dart';
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

class TeamList extends StatelessWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c1 = Theme.of(context).primaryColor;
    final CollectionReference teams =
    FirebaseFirestore.instance.collection('teams');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team List'),
        backgroundColor: c1,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: teams.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final Team team =
              Team.fromSnapshot(snapshot.data!.docs[index]);
              String teamId =snapshot.data!.docs[index].id ;
              return ListTile(
                title: Text(team.teamName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Robot Name: ${team.robotName}'),
                    Text('Team Chef: ${team.teamChef}'),
                    Text('Competition Type: ${team.competitionType}'),
                    Text('Phone Number: ${team.phoneNumber}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    teams.doc(teamId).delete();
                  },
                ),
                onTap: () {
                  _openEditTeamDialog(context, teams, team ,teamId);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              final teamNameController = TextEditingController();
              final robotNameController = TextEditingController();
              final teamChefController = TextEditingController();
              final competitionTypeController = TextEditingController();
              final phoneNumberController = TextEditingController();

              return AlertDialog(
                title: const Text('Add Team'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: teamNameController,
                      decoration: const InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    TextField(
                      controller: robotNameController,
                      decoration: const InputDecoration(
                        labelText: 'Robot Name',
                      ),
                    ),
                    TextField(
                      controller: teamChefController,
                      decoration: const
                      InputDecoration(
                        labelText: 'Team Chef',
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {

                              competitionTypeController.text = CompetitionType.suiveur.toString();

                            },
                            child: Text('suiveur'),
                          ),
                          ElevatedButton(
                            onPressed: () {

                              competitionTypeController.text = CompetitionType.toutTerrain.toString();

                            },
                            child: Text('Tout terrain'),
                          ),]
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            competitionTypeController.text = CompetitionType.autonome.toString();

                          },
                          child: Text('autonome'),
                        ),
                        ElevatedButton(
                          onPressed: () {

                            competitionTypeController.text = CompetitionType.junior.toString();

                          },
                          child: Text('junior'),
                        ),
                      ],
                    ),

                    TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      final teamName = teamNameController.text;
                      final robotName = robotNameController.text;
                      final teamChef = teamChefController.text;
                      final competitionType = competitionTypeController;
                      final phoneNumber = phoneNumberController.text;
                      teams.add(Team(
                        teamName: teamName,
                        robotName: robotName,
                        teamChef: teamChef,
                        competitionType: competitionType.text,
                        phoneNumber: phoneNumber,
                      ).toMap());

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openEditTeamDialog(BuildContext context, CollectionReference teams, Team team , String teamId) {
    final teamNameController = TextEditingController(text: team.teamName);
    final robotNameController = TextEditingController(text: team.robotName);
    final teamChefController = TextEditingController(text: team.teamChef);
    final competitionTypeController =
    TextEditingController(text: team.competitionType);
    final phoneNumberController =
    TextEditingController(text: team.phoneNumber);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Team'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: teamNameController,
                decoration: const InputDecoration(
                  labelText: 'Team Name',
                ),
              ),
              TextField(
                controller: robotNameController,
                decoration: const InputDecoration(
                  labelText: 'Robot Name',
                ),
              ),
              TextField(
                controller: teamChefController,
                decoration: const InputDecoration(
                  labelText: 'Team Chef',
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        competitionTypeController.text = CompetitionType.suiveur.toString();

                      },
                      child: Text('suiveur'),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        competitionTypeController.text = CompetitionType.toutTerrain.toString();

                      },
                      child: Text('Tout terrain'),
                    ),]
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {

                      competitionTypeController.text = CompetitionType.autonome.toString();

                    },
                    child: Text('autonome'),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      competitionTypeController.text = CompetitionType.junior.toString();

                    },
                    child: Text('junior'),
                  ),
                ],
              ),

              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final teamName = teamNameController.text;
                final robotName = robotNameController.text;
                final teamChef = teamChefController.text;
                final competitionType = competitionTypeController.text;
                final phoneNumber = phoneNumberController.text;

                teams.doc(teamId).update(Team(
                  teamName: teamName,
                  robotName: robotName,
                  teamChef: teamChef,
                  competitionType: competitionType,
                  phoneNumber: phoneNumber,
                ).toMap());

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
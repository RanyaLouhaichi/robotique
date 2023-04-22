import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String? username;
  String? password;
  String? role;


  //User({this.username, this.password});
  User( String username , String password, String role){
    this.username = username;
    this.password = password;
    this.role = role;

  }
  User.fromMap(Map<String, dynamic> map)
      : assert(map['username'] != null),
        assert(map['password'] != null),
        assert(map['role'] != null),
        username = map['username'],
        password = map['password'],
        role = map['role'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }

  //Map<String, dynamic> toMap() {}
}
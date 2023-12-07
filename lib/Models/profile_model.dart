// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String name;
  int age;
  String address;
  String pinCode;
  String emailId;
  int phoneNumber;
  int gender;
  List<String> skills;
  String linkedinUrl;
  String profileUrl;
  int noOfViews;

  ProfileModel({
    required this.name,
    required this.age,
    required this.address,
    required this.pinCode,
    required this.emailId,
    required this.phoneNumber,
    required this.gender,
    required this.skills,
    required this.linkedinUrl,
    required this.profileUrl,
    required this.noOfViews,
  });

  ProfileModel copyWith({
    String? name,
    int? age,
    String? address,
    String? pinCode,
    String? emailId,
    int? phoneNumber,
    int? gender,
    List<String>? skills,
    String? linkedinUrl,
    String? profileUrl,
    int? noOfViews,
  }) =>
      ProfileModel(
        name: name ?? this.name,
        age: age ?? this.age,
        address: address ?? this.address,
        pinCode: pinCode ?? this.pinCode,
        emailId: emailId ?? this.emailId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        skills: skills ?? this.skills,
        linkedinUrl: linkedinUrl ?? this.linkedinUrl,
        profileUrl: profileUrl ?? this.profileUrl,
        noOfViews: noOfViews ?? this.noOfViews,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        age: json["age"],
        address: json["address"],
        pinCode: json["pin_code"],
        emailId: json["email_id"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        linkedinUrl: json["linkedin_url"],
        profileUrl: json["profile_url"],
        noOfViews: json["no_of_views"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "address": address,
        "pin_code": pinCode,
        "email_id": emailId,
        "phone_number": phoneNumber,
        "gender": gender,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "linkedin_url": linkedinUrl,
        "profile_url": profileUrl,
        "no_of_views": noOfViews,
      };
}

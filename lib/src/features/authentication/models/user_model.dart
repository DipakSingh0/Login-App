/*

first step to create user model then create user controller,repository and then create user service
 */
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phoneNo});

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  // step 1 to map fetched user from firebase to usermodel so that we can update it

  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
    );
  }
}

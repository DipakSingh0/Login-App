/*

first step to create user model then create user controller,repository and then create user service
 */
 class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

 const UserModel({
  this.id,
  required this.fullName,
  required this.email,
  required this.password,
  required this.phoneNo

 });

 toJson(){
  return {
    "FullName" : fullName,
    "Email" : email,
    "Phone" : phoneNo,
    "Password" : password,
 };
 }
 }

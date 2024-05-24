// This file contains the model class for users
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  //@JsonKey(name:'idd') اذا  كان الاسم مختلف في json وبدنا نجيب الاسم الغلط ونخليه عنا صح !
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;
  Users({this.id, this.name, this.email, this.gender, this.status});
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

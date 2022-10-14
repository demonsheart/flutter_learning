import 'package:json_annotation/json_annotation.dart';

part 'userTest.g.dart';

@JsonSerializable()
class UserTest {
  UserTest();

  String? name;
    String? email;
    
  factory UserTest.fromJson(Map<String,dynamic> json) => _$UserTestFromJson(json);
  Map<String, dynamic> toJson() => _$UserTestToJson(this);
}
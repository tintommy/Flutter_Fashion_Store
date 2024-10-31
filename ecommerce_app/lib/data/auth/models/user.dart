import '../../../domain/auth/entity/user.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserModel(
      this.userId, this.firstName, this.lastName, this.email, this.gender, this.image);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'image': image,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['userId'] as String? ??"",
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['gender'] as int,
      json['image'] as String? ?? ""
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(userId, firstName, lastName, email, gender,image!);
  }
}

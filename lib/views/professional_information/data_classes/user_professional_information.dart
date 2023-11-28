





class UserProfessionalInformation {

  final String institutionalBody;
  final String Uorg;
  final String id;
  final String role;

  UserProfessionalInformation({required this.institutionalBody, required this.Uorg, required this.id, required this.role});


  static UserProfessionalInformation fromMap(Map<String, dynamic> map) {
    return UserProfessionalInformation(
        institutionalBody: map["institutionalBody"],
        Uorg: map["Uorg"], id: map["id"],
        role: map["role"]);
  }

}
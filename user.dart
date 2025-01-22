class User {
  final String userCode;
  final String displayName;
  final String email;
  final String employeeCode;
  final String companyCode;
  final List<dynamic> userLocations;
  final List<dynamic> userPermissions;

  User({
    required this.userCode,
    required this.displayName,
    required this.email,
    required this.employeeCode,
    required this.companyCode,
    required this.userLocations,
    required this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userCode: json['User_Code'],
      displayName: json['User_Display_Name'],
      email: json['Email'],
      employeeCode: json['User_Employee_Code'],
      companyCode: json['Company_Code'],
      userLocations: json['User_Locations'],
      userPermissions: json['User_Permissions'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userCode': userCode,
      'displayName': displayName,
      'email': email,
      'employeeCode': employeeCode,
      'companyCode': companyCode,
    };
  }
}

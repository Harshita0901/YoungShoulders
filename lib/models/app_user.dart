class AppUser {
  String firstName;
  String lastName;
  String email;
  String? phoneNumber;
  String? password;
  DateTime? birthDate;

  AppUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.password,
    this.birthDate,
  });

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
    'password': password,
    'birthDate': birthDate?.toIso8601String(),
  };

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      birthDate:
      json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
    );
  }
}

class CreateUser {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String? refCode;

  const CreateUser({
    required this.firstName, required this.lastName, required this.email, required this.phone, required this.password, this.refCode
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['emailAddress'],
      phone: json['phoneNumber'],
      password: json['password'],
      refCode: json['refCode']
    );
  }
}
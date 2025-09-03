class SignUpUseCaseParameters {
  final String? username;
  final String email;
  final String password;
  final String? phone;
  final String? date;

  SignUpUseCaseParameters({required this.username, required this.email, required this.password, this.phone, this.date});
}

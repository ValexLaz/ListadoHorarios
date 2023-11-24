class Professor {
  final String name;
  final String lastname;
  final String cellphoneNumber;
  final String ciNumber;
  final String email;

  Professor({
    required this.name,
    required this.lastname,
    required this.cellphoneNumber,
    required this.ciNumber,
    required this.email,
  });

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      name: json['name'] ?? '',
      lastname: json['lastname'] ?? '',
      cellphoneNumber: json['cellphone_number'] ?? '',
      ciNumber: json['ci_number'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastname': lastname,
      'cellphone_number': cellphoneNumber,
      'ci_number': ciNumber,
      'email': email,
    };
  }
}

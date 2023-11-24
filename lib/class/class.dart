class Class {
  final String name;
  final String description;
  final String hoursDemanded;
  final String semester;
  final String universityProgram;

  Class({
    required this.name,
    required this.description,
    required this.hoursDemanded,
    required this.semester,
    required this.universityProgram,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      hoursDemanded: json['hours_demanded'] ?? '',
      semester: json['semester'] ?? '',
      universityProgram: json['university_program'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'hours_demanded': hoursDemanded,
      'semester': semester,
      'university_program': universityProgram,
    };
  }
}

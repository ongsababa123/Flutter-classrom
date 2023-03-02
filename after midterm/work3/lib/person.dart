class Person {
  final int id;
  final String name;
  final int age;

  static final Map<String, dynamic> info = {
    "id": "id",
    "name": 'name',
    "age": "age",
  };

  const Person({
    required this.id,
    required this.name,
    required this.age,
  });

  Person copy({
    int? id,
    String? name,
    int? age,
  }) =>
      Person(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
      );

  static Person fromJson(Map<String, Object?> json) {
    return Person(
      id: json["id"] as int,
      name: json["name"] as String,
      age: json["age"] as int,
    );
  }

  Map<String, Object> toJson() => {
        info['id']: id,
        info['name']: name,
        info['age']: age,
      };
}

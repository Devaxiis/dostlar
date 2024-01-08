class User{
  String name;
  int age;
  String description;

  User({
    required this.name,
    required this.age,
    required this.description,
});

  factory User.fromJson(Map<String,Object?> json) {
    return User(name: json["name"] as String, age: json["age"] as int, description: json["description"] as String);
  }


  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "age": age,
  };

  @override
  String toString() {
    return "User(name: $name, age: $age, description: $description)";
  }
}
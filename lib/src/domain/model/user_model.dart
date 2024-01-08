class User{
  String name;
  String age;
  String description;

  User({
    required this.name,
    required this.age,
    required this.description,
});

  factory User.fromJson(Map<String,Object?> json) {
    return User(name: json["name"] as String, age: json["age"] as String, description: json["description"] as String);
  }


  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "description": description,
  };

  @override
  String toString() {
    return "User(name: $name, age: $age, description: $description)";
  }

  @override
  int get hashCode => Object.hash(name,age);
}
class PersonModel {
  String id;
  String name;
  String email;
  String phone;
  String group;
  String image;

  PersonModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.group,
    required this.image,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      group: json['group'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'group': group,
      'image': image,
    };
  }
}

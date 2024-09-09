class User {
  final String id;
  final String name;
  final String email;
  final String contactNumber;
  final String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNumber,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['login']['uuid'], // Using uuid as an ID
      name: '${json['name']['first']} ${json['name']['last']}', // Combining first and last name
      email: json['email'],
      contactNumber: json['phone'],
      profilePicture: json['picture']['large'], // Large profile picture
    );
  }
}

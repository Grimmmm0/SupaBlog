class Profile {
  final String id;
  final String? email;

  Profile({required this.id, required this.email});

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(id: map['id'] as String, email: map['email'] as String?);
  }
}

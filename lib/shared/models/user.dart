class User {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });
}

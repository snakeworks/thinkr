class UserModel {
  const UserModel({
    this.id,
    this.fullName,
    this.username,
    this.password,
    this.avatarUrl,
    this.city,
    this.country,
    this.createdAt,
    this.favoritesIds,
    this.quizStars
  });

  final String? id;
  final String? fullName;
  final String? username;
  final String? password;
  final String? avatarUrl;
  final String? city;
  final String? country;
  final DateTime? createdAt;
  final List<dynamic>? favoritesIds;
  final int? quizStars;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      fullName: map['fullName'],
      username: map['username'],
      password: map['password'],
      avatarUrl: map['avatar'],
      city: map['city'],
      country: map['country'],
      createdAt: DateTime.tryParse(map['createdAt'] ?? ''),
      favoritesIds: map['favoritesIds'] ?? [],
      quizStars: map['quizStars'] ?? 0
    );
  }
}
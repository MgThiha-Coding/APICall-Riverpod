class UserProfileModel {
  final Name name;
  final String email;
  final String country;
  final String imageUrlLarge;
  final String imageUrlMedium;
  final String imageUrlThumbnail;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.country,
    required this.imageUrlLarge,
    required this.imageUrlMedium,
    required this.imageUrlThumbnail,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: Name.fromJson(json['name']),
      email: json['email'],
      country: json['location']['country'],
      imageUrlLarge: json['picture']['large'],
      imageUrlMedium: json['picture']['medium'],
      imageUrlThumbnail: json['picture']['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.toJson(),
      'email': email,
      'country': country,
      'picture': {
        'large': imageUrlLarge,
        'medium': imageUrlMedium,
        'thumbnail': imageUrlThumbnail,
      },
    };
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }
}

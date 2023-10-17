class UpdateUserDto {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String image;
  UpdateUserDto({
    required this.username,
    required this.firstname,
    required this.email,
    required this.lastname,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    var params = <String, dynamic>{};
    if (username != '') params['username'] = username;
    if (email != '') params['email'] = email;
    if (firstname != '') params['firstName'] = firstname;
    if (lastname != '') params['lastName'] = lastname;
    if (image != '') params['image'] = image;
    return params;
  }
}

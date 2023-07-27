class UserModal {
  String? uid;
  String? email;
  String? name;
  String? phone;

  UserModal({this.uid, this.email, this.name, this.phone});

  factory UserModal.fromMap(map) {
    return UserModal(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        phone: map['phone']);
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name, 'phone': phone};
  }
}
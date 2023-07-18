class UserModel {
  String? id;
  String? name;
  String? cnic;
  String? number;

  UserModel(
      {required this.id,
      required this.name,
      required this.cnic,
      required this.number});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cnic = json['cnic'];
    number = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cnic'] = cnic;
    data['phoneNumber'] = number;
    return data;
  }
}

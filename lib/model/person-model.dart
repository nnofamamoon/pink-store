class PersonModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? verifycode;
  int? userApprove;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? token;

  PersonModel(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.verifycode,
      this.userApprove,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.token
      });

  PersonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    verifycode = json['verifycode'];
    userApprove = json['user_approve'];
    image = json['image'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['verifycode'] = this.verifycode;
    data['user_approve'] = this.userApprove;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
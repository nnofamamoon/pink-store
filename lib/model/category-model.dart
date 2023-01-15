// class CategoryModel{
//   String? title;
//   String? image;
//   CategoryModel({this.image,this.title});
// }
class CategoriesModel {
  int? id;
  String? name;
  String? arName;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoriesModel(
      {this.id,
      this.name,
      this.arName,
      this.image,
      this.createdAt,
      this.updatedAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

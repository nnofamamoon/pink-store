class AllproductModel {
  int? id;
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? price;
  String? priceAfterDiscount;
  int? discount;
  String? image;
  String? rate;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
 bool? selfLiked;

  AllproductModel(
      {this.id,
      this.name,
      this.arName,
      this.description,
      this.arDescription,
      this.price,
      this.priceAfterDiscount,
      this.discount,
      this.image,
      this.rate,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.selfLiked});

  AllproductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arName = json['ar_name'];
    description = json['description'];
    arDescription = json['ar_description'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    discount = json['discount'];
    image = json['image'];
    rate = json['rate'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // selfLiked= json['wishlists'].length > 0;
     selfLiked= json['wishlists']!=null?json['wishlists'].length > 0:null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ar_name'] = this.arName;
    data['description'] = this.description;
    data['ar_description'] = this.arDescription;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
  
    return data;
  }
}
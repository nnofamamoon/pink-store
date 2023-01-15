class CartModel {
  int? id;
  int? personId;
  int? pinkProductId;
  int? quantity;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;
  Pinkproduct? pinkproduct;
String? allproductPrice;
  CartModel(
      {this.id,
      this.personId,
      this.pinkProductId,
      this.quantity,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.pinkproduct,
      this.allproductPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personId = json['person_id'];
    pinkProductId = json['pink_product_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pinkproduct = json['pinkproduct'] != null
        ? new Pinkproduct.fromJson(json['pinkproduct'])
        : null;
          allproductPrice = json['allproductPrice'] != null?json['allproductPrice']: null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['person_id'] = this.personId;
    data['pink_product_id'] = this.pinkProductId;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pinkproduct != null) {
      data['pinkproduct'] = this.pinkproduct!.toJson();
    }
    return data;
  }
}

class Pinkproduct {
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

  Pinkproduct(
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
      this.updatedAt});

  Pinkproduct.fromJson(Map<String, dynamic> json) {
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
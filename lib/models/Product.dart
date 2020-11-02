class Product {
  String id;
  String productCode;
  String productName;
  String createdAt;
  String name; // image URL

  // json serialize
  Product.fromJSON(Map json) {
    this.id = json['id'];
    this.productCode = json['product_code'];
    this.productName = json['product_name'];
    this.createdAt = json['created_at'];
    this.name = json['name'];
  }
}
/*
*
*        "id":"6",
         "product_code":"106.0490.203 ",
         "product_name":"Dominox DHX 604 4G XS S E Gazl\u0131 Ocak",
         "created_at":"2020-10-23 18:06:43",
         "name":"https:\/\/goray.com.tr\.com"
* */

class Products {
  final String productname;
  final String postid;
  final String gender;
  final String colors;
  final String price;
  final String brand;

  Products(
      {required this.productname,
      required this.postid,
      required this.gender,
      required this.colors,
      required this.price,
      required this.brand});

  Map<String, dynamic> tojson() => {
        'productname': productname,
        'postid': postid,
        'gender': gender,
        'colors': colors,
        'price': price,
        'brand': brand,
      };
}

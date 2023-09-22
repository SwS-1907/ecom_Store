class Product{
  var title = "";
  var image = '';
  var description = "";
  var discount = "";
  int? price = 0 ;
  var is_fav = false ;

  Product({required this.title , required this.description ,required this.image , required this.discount ,required this.price , required this.is_fav});
  @override
  String toString() {
    return "$title - $price - $discount";
  }
}
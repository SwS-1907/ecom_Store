import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  String img ;
  ProductCard(this.img, {super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(widget.img),fit: BoxFit.cover,height: MediaQuery.of(context).size.height),
        Container(
          margin: const EdgeInsets.only(top: 500),
          padding: const EdgeInsets.only(top: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
         ),
         child: const Column(
            children: [
              Text('Product Name - Style'),
            ],
          ),
       ) ,
      ]
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';
import 'home.dart';

class BasketPage extends StatefulWidget {
  int selectedindex ;
  BasketPage({super.key,required this.selectedindex});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool isExpanded = false ;
  bool more = true  ;
  bool moreTwo = true  ;
  Color? mainColor = Colors.yellow[700] ;
  Color? secColor = Colors.black ;
  Color? trdColor = Colors.white ;
  final List<String> less_Lst =[
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
  ];
  final List<String> all_Lst =[
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpg',
    'assets/images/product5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:60,left: 30,right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isExpanded ? 350 : 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left:8.0),
                            child: Icon(Icons.search),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: isExpanded ? const TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top:0),
                                border: InputBorder.none
                              ),
                            ) : Container(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text('Your SwS Product.',
                style: TextStyle(
                  color: secColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Product ',
                          style: TextStyle(
                            color: secColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        Text('${all_Lst.length}',
                          style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      child: more ?
                        const Text('Show all',style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,decorationColor: Colors.blue),) :
                        const Text('Show less',style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,decorationColor: Colors.blue),),
                      onTap: (){
                        setState(() {
                          more ? more = false : more = true ;
                        });
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              more ? gridViewDisposition(less_Lst,220,Axis.horizontal,1) : gridViewDisposition(all_Lst,450,Axis.vertical,2),
              const SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Other Product ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  InkWell(
                    onTap: () {
                      setState(() {
                        moreTwo ? moreTwo = false : moreTwo = true ;
                      });
                    },
                    child: moreTwo ?
                      const Text('Show more',style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,decorationColor: Colors.blue),) :
                      const Text('Show less',style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,decorationColor: Colors.blue),),
                  ),
                ],
              ),
              const SizedBox(height:30),
              Container(
                  height: 220,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    mainAxisSpacing: 10.0, // Spacing between items vertically
                    crossAxisSpacing: 10.0, // Spacing between items horizontally
                    children:all_Lst.map((e){
                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Center(
                                  child: ElevatedButton(
                                    child: const Text('Closed'),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(e),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.white60,BlendMode.dstOut)),
                                    borderRadius:BorderRadius.circular(15)
                                ),
                                width:double.infinity,
                                child: Image(image: AssetImage(e)),
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('product 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                // Text('description',style: TextStyle(fontSize: 15,color: Colors.black54)),
                                Text('\$150.00',style: TextStyle(fontSize: 15,color: Colors.black54)),
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  )
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secColor,
        unselectedItemColor: trdColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: widget.selectedindex,
        selectedItemColor: Colors.amber[800],
        onTap: (index){
          setState(() {
            widget.selectedindex = index;
            if (widget.selectedindex == 2){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=> ProfilePage(selectedindex:widget.selectedindex)
              ));
            }else if (widget.selectedindex == 0){
              Navigator.pushReplacement(context,MaterialPageRoute(
                  builder: (context) => Home(selectedindex:widget.selectedindex)
              ));
            }
          });
        },
      ),
    );
  }

  Widget gridViewDisposition( List<String> lst ,double h ,Axis axis , int crossCount){
    return Container(
      height: h,
      child: GridView.count(
        scrollDirection: axis,
        crossAxisCount: crossCount,
        mainAxisSpacing: 10.0, // Spacing between items vertically
        crossAxisSpacing: 10.0, // Spacing between items horizontally
        children:lst.map((e){
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(left :20 ,right :20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(e),fit: BoxFit.cover),
                                borderRadius:BorderRadius.circular(15)
                            ),
                            width:double.infinity,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.shopping_cart,color: Colors.lightBlue,),
                                  Text(' Shopping',style: TextStyle(color: Colors.lightBlue),)
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text('Product Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                              SizedBox(height: 10,),
                              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: TextStyle(fontSize: 15,color: Colors.black54)),
                              SizedBox(height: 30,),
                              Text('\$150.00',style: TextStyle(fontSize: 15,color: Colors.black87)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(e),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.white60,BlendMode.dstOut)),
                        borderRadius:BorderRadius.circular(15)
                    ),
                    width:double.infinity,
                    child: Image(image: AssetImage(e)),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('product 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    // Text('description',style: TextStyle(fontSize: 15,color: Colors.black54)),
                    Text('\$150.00',style: TextStyle(fontSize: 15,color: Colors.black54)),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

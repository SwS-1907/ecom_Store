import 'package:ecomsws/Basket.dart';
import 'package:ecomsws/ProductCard.dart';
import 'package:ecomsws/Profile.dart';
import 'package:flutter/material.dart';
import 'package:ecomsws/product.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  int selectedindex;
  Home({super.key,required this.selectedindex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _searchController = TextEditingController();
  Color? mainColor = Colors.yellow;
  Color? secColor = Colors.black ;
  Color? trdColor = Colors.white ;

  int _selectedIndex = 0;
  IconData heartactive =  Icons.favorite;
  IconData heartnotactive = Icons.favorite_border;
  IconData heart = Icons.favorite_border;


  final List<Product> numbers = [
      Product(title: 'product 1', description: 'desc 1', image: 'assets/images/product1.jpg', discount: '10%', price: 1000, is_fav: false),
      Product(title: 'product 2', description: 'desc 2', image: 'assets/images/product2.jpg', discount: '10%', price: 78, is_fav: true),
      Product(title: 'product 3', description: 'desc 3', image: 'assets/images/product3.jpg', discount: '10%', price: 533, is_fav: false),
      Product(title: 'product 4', description: 'desc 4', image: 'assets/images/product4.jpg', discount: '10%', price: 725, is_fav: true),
      Product(title: 'product 5', description: 'desc 5', image: 'assets/images/product5.jpg', discount: '10%', price: 918, is_fav: false),
      Product(title: 'product 6', description: 'desc 6', image: 'assets/images/product1.jpg', discount: '10%', price: 626, is_fav: true ),
      Product(title: 'product 7', description: 'desc 7', image: 'assets/images/product2.jpg', discount: '10%', price: 277, is_fav: false),
      Product(title: 'product 8', description: 'desc 8', image: 'assets/images/product3.jpg', discount: '10%', price: 749, is_fav: true),
      Product(title: 'product 9', description: 'desc 9', image: 'assets/images/product4.jpg', discount: '10%', price: 737, is_fav: false),
      Product(title: 'product 10', description: 'desc 10', image: 'assets/images/product5.jpg', discount: '10%', price: 739, is_fav: true ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Color.fromRGBO(251,200,91,255),Color.fromRGBO(254,243,114,1)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:50,left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center ,
              children: [
                Text('SwS Cloths',
                  style: GoogleFonts.alice(
                    textStyle:  TextStyle(
                        color: secColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    )
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    label: const Text('search'),
                    alignLabelWithHint: true ,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    prefixIconColor: secColor,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.qr_code_2),
                    suffixIconColor: secColor,
                  ),
                ),
                const SizedBox(height: 10,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      catButton('cat1', (){}),
                      const SizedBox(width: 10,),
                      catButton('cat2', (){}),
                      const SizedBox(width: 10,),
                      catButton('cat3', (){}),
                      const SizedBox(width: 10,),
                      catButton('cat4', (){}),
                      const SizedBox(width: 10,),
                      catButton('cat5', (){}),
                      const SizedBox(width: 10,),
                      catButton('cat6', (){}),
                      const SizedBox(width: 10,),
                      catButton('cat7', (){}),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.66,
                  width: double.infinity,
                  child: GridView.count(
                    padding: const EdgeInsets.only(top: 0),
                    crossAxisCount: 2, // Number of columns in the grid
                    mainAxisSpacing: 10.0, // Spacing between items vertically
                    crossAxisSpacing: 10.0, // Spacing between items horizontally
                    children: numbers.map((e) {
                      return Column(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  ProductCard(e.image)));
                            },
                            child: Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(e.image),fit: BoxFit.cover),
                                  borderRadius:BorderRadius.circular(15)
                                ),
                                width:double.infinity,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              border: Border.all(
                                                color: Colors.white60,
                                                // width: 0,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Text(e.discount,
                                              style:const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ) ,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                e.is_fav ? e.is_fav = false :  e.is_fav = true  ;
                                              });
                                            },
                                            child: e.is_fav ?  Icon(heartactive,color: trdColor,) :  Icon(heartnotactive,color: trdColor,),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(e.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(e.description,style: const TextStyle(fontSize: 15,color: Colors.black54))
                            ],
                          )
                        ],
                      );
                    }).toList()
                  )
                ),
              ],
            ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 1){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context)=> BasketPage(selectedindex: _selectedIndex,)
              ));
            }else if (_selectedIndex == 2){
              Navigator.pushReplacement(context,MaterialPageRoute(
                  builder: (context) =>  ProfilePage(selectedindex: _selectedIndex,)
              ));
            }
          });
        },
      ),

    );

  }
  Widget catButton(String cat , Function() fct){
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(secColor!),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: fct,
      child: Text(cat,
        style: GoogleFonts.actor(
          textStyle:   TextStyle(
              color: mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
          )
        ),
      )
    );
  }
}
/*
final List numbers = List.generate(30, (index) => "Item $index");
GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: numbers
              .map((e) => Container(
                  color: Colors.amber,
                  alignment: Alignment.center,
                  child: Text(e)))
              .toList(),
)

white the builder :
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
  ),
  itemCount: 10, // Number of items in the grid
  itemBuilder: (BuildContext context, int index) {
    return Container(
      color: Colors.red,
    );
  },
)

two rows using listview:
ListView.builder(
  itemCount: items.length ~/ 2 + (items.length % 2 == 0 ? 0 : 1),
  itemBuilder: (BuildContext context, int index) {
    final int rowIndex = index * 2;
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(items[rowIndex]),
            onTap: () {
              // Handle onTap event for the first item in the row
            },
          ),
        ),
        SizedBox(width: 8.0), // Spacing between the two items in the row
        Expanded(
          child: ListTile(
            title: Text(rowIndex + 1 < items.length ? items[rowIndex + 1] : ''),
            onTap: () {
              // Handle onTap event for the second item in the row
            },
          ),
        ),
      ],
    );
  },
)

bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
            // backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            // backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            // backgroundColor: Colors.black
          ),
        ],
      ),

*/
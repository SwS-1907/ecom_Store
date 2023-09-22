import 'package:ecomsws/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Basket.dart';

class ProfilePage extends StatefulWidget {
  int selectedindex ;
  ProfilePage({super.key,required this.selectedindex});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Color? mainColor = Colors.yellow[700] ;
  Color? secColor = Colors.black ;
  Color? trdColor = Colors.white ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:60),
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: mainColor,
            //   ),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Icon(Icons.add,size: 40,),
            //       Icon(Icons.menu,size: 40,),
            //     ],
            //   ),
            // ),
            Container(
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: mainColor
              ),
              child:const Text('Ossama Atmani',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            ),
            // const SizedBox(height: 20,),
            Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ mainColor!,secColor!],
                ),
              ),
              height: MediaQuery.of(context).size.height*0.41,
              width: double.infinity,
              child: Center(
                child :Stack(
                  alignment: AlignmentDirectional.center,
                  children:[
                    Container(
                      width:110,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/images/Profiles/profile1.jpg'),)
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left:100,bottom: 80),
                      child: Icon(Icons.edit,size: 30,),
                    ),
                  ]
                )
              ),
            ),
            const SizedBox(height:20,),
            Container(
              width: double.infinity,
              height: 300,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: [
                  Card(

                    elevation: 9,
                    child: ListTile(
                      trailing : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Icon(Icons.navigate_next),
                      ),
                      // style: ListTileStyle.list,
                      title: const Text('Personal Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 10,), 
                  Card(
                    elevation: 9,
                    child: ListTile(
                      trailing : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Icon(Icons.navigate_next),
                      ),
                      // style: ListTileStyle.list,
                      title: const Text('Bank Account Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Card(
                    elevation: 9,
                    child: ListTile(
                      trailing: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Icon(Icons.navigate_next),
                      ),
                      // style: ListTileStyle.list,
                      title: const Text('Change Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                    ),
                  ),
                  const SizedBox(height: 10,),
                  Card(
                    elevation: 9,
                    color: Colors.white,
                    child: ListTile(
                      trailing: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Icon(Icons.navigate_next),
                      ),
                      // style: ListTileStyle.list,
                      title: const Text('Change Email',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )
            )
          ]
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
            if (widget.selectedindex == 1){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=> BasketPage(selectedindex:widget.selectedindex)
              ));
            }else if (widget.selectedindex == 0){
              Navigator.pushReplacement(context , MaterialPageRoute(
                  builder: (context) => Home(selectedindex: widget.selectedindex,)
              ));
            }
          });
        },
      ),
    );
  }
}

import 'package:ecomsws/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();
  static const _goldColor =  Color.fromRGBO(255,215,0,1);
  var active = false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/back2.jpg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            // filterQuality: FilterQuality.medium,
          ),
          Column(
            children: [
              SizedBox(
                height: 500,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index){
                    if (index == 2){
                      setState(() {
                        active = true ;
                      });
                    }else if (index == 1){
                      setState(() {
                        active = false ;
                      });
                    }
                  },
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 70,right: 30,left: 40),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text( 'Shop the latest fashion trends',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 34.0,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 60,right: 30,left: 40),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text( 'Upgrade your wardrobe with our stylish collection',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 34.0,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 60,right: 30,left: 40),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text( 'Find your perfect outfit today',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 34.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const JumpingDotEffect(
                  activeDotColor:Colors.black,
                  dotColor: Colors.transparent,
                  dotHeight: 20,
                  dotWidth: 20,
                  spacing: 16,
                  verticalOffset: 30,
                ),
              ),
              const SizedBox(height: 120,),
              ElevatedButton(
                onPressed: active ? (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Home(selectedindex: 0,)
                    ),
                  );
                }:(){},
                style:  ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.only(left :60,right: 60,top:20,bottom: 20)),
                    backgroundColor: active ? MaterialStatePropertyAll(Colors.black) :MaterialStatePropertyAll(Colors.white10),
                    foregroundColor: MaterialStatePropertyAll(_goldColor),
                ),
                child: const Text('Get Started',style: TextStyle(fontSize: 15),),
              )
            ],
          )
        ],
      ),
    );
  }
}

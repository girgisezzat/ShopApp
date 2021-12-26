import 'package:flutter/material.dart';

class Stack1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
            icon: Icon(
                Icons.menu
            ),
            onPressed: (){

            }
        ),
        title: Text(
            'First Application'
        ),
        actions: [
          IconButton(
            icon:Icon (
                Icons.notification_important
            ),
            onPressed: (){
              print("Notification Clicked");
            },
          ),
          IconButton(
            icon:Icon (
                Icons.search
            ),
            onPressed: (){
              print("search Clicked");
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                  image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__340.jpg',
                  ),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  // fit: BoxFit.fit
                  ),
                  Container(
                    //color: Colors.black,
                    width: 200.0,
                    color: Colors.white.withOpacity(0.7),
                    padding:EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 0.0,
                    ),
                    child: Text(
                      "Flower", // mendatory parameter
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        //color: Colors.white.withOpacity(1)
                        fontSize: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),


    ]
        ),
      )
    );
  }

}
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
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

    );
  }

}
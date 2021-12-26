import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/user/user_model.dart';




class UsersScreen extends StatelessWidget {

  List<UserModel>users=[
    UserModel(id: 1, name: 'Girgis Ezzat', phone: '01205896542'),
    UserModel(id: 2, name: 'Ahmed Mohamed', phone: '01112908820'),
    UserModel(id: 3, name: 'Mena Gamil', phone: '01205555457'),
    UserModel(id: 4, name: 'Abdelrahman reda', phone: '01505555457'),
    UserModel(id: 5, name: 'Girgis Ezzat', phone: '01205896542'),
    UserModel(id: 6, name: 'Ahmed Mohamed', phone: '01112908820'),
    UserModel(id: 7, name: 'Mena Gamil', phone: '01205555457'),
    UserModel(id: 8, name: 'Abdelrahman reda', phone: '01505555457'),
    UserModel(id: 9, name: 'Girgis Ezzat', phone: '01205896542'),
    UserModel(id: 10, name: 'Ahmed Mohamed', phone: '01112908820'),
    UserModel(id: 11, name: 'Mena Gamil', phone: '01205555457'),
    UserModel(id: 12, name: 'Abdelrahman reda', phone: '01505555457'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
            icon: Icon(
                Icons.menu
            ),
            onPressed: (){}
        ),
        title: Text(
            'Users List'
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
      body: ListView.separated(
        itemBuilder: (context,index)  => buildUserItem(users[index]),
        separatorBuilder: (context,index)  =>Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child:
          Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

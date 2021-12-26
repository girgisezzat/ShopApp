//"https://d2me2qg8dfiw8u.cloudfront.net/content/uploads/2019/11/25011814/Davis-Cup-chief-Gerard-Pique.jpg"
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessengerScreenWithoutList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,

        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdnuploads.aa.com.tr/uploads/Contents/2014/01/13/thumbs_b_c_981533a2639d8c4cd6532154ef15c05d.jpg"
              ),
              radius: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Chats",
              style: TextStyle(
                  color: Colors.black87
              ),

            ),
          ],
        ),

        actions: [
          // camera icon button
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 15,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.blue,
                  size: 20,

                ),
              )
          ),
          // edit icon button
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 15,
                child: Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.blue,

                ),
              )
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //start search part
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: Colors.grey,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Search",

                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // scroll the row of circle of avatars
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // the container that has item of row
                    Container(
                      width: 74,
                      child: Column(
                        children: [
                          // the stack is an circle image with online point
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              // start circle image
                              CircleAvatar(
                                backgroundImage:NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/c/c1/Lionel_Messi_20180626.jpg"
                                ),
                                radius: 32,
                              ),
                              // end circle image

                              // start online point
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                    end: 3,
                                    bottom: 3
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              // end online point
                            ],
                          ),
                          SizedBox(
                              height:6
                          ),
                          // start the text under avatar
                          Text(
                            "Loinel Messi",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          // end the the text after avatar
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 10
                    ),
                    // the container the has item of row
                    Container(
                      width: 74,
                      child: Column(

                        children: [
                          // the stack is an circle image with online point
                          Stack(
                            alignment: Alignment.bottomRight,

                            children: [
                              // start circle image
                              CircleAvatar(
                                backgroundImage:NetworkImage(
                                    "https://e0.365dm.com/21/05/1600x900/skysports-jack-grealish-aston-villa_5391170.jpg?20210522183704"
                                ),
                                radius: 32,
                              ),
                              // end circle image

                              // start online point
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                    end: 3,
                                    bottom: 3
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              // end online point

                            ],
                          ),

                          SizedBox(height:6),

                          // start the text under avatar
                          Text(
                            "Jack Grealish",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          // end the the text after avatar
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 10
                    ),
                    // the container the has item of row
                    Container(
                      width: 74,
                      child: Column(

                        children: [
                          // the stack is an circle image with online point
                          Stack(
                            alignment: Alignment.bottomRight,

                            children: [
                              // start circle image
                              CircleAvatar(
                                backgroundImage:NetworkImage(
                                    "https://atalayar.com/sites/default/files/styles/foto_/public/noticias/Atalayar_Mohamed%20Salah%2C%20jugador%20del%20Liverpool%20%284%29.jpg?itok=oOHpI7RT"
                                ),
                                radius: 32,
                              ),
                              // end circle image

                              // start online point
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                    end: 3,
                                    bottom: 3
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              // end online point

                            ],
                          ),

                          SizedBox(
                              height:6
                          ),

                          // start the text under avatar
                          Text(
                            "Ahmed Mohamed Samir",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          // end the the text after avatar
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 10
                    ),
                    // the container the has item of row
                    Container(
                      width: 74,
                      child: Column(

                        children: [
                          // the stack is an circle image with online point
                          Stack(
                            alignment: Alignment.bottomRight,

                            children: [
                              // start circle image
                              CircleAvatar(
                                backgroundImage:NetworkImage(
                                    "https://d2me2qg8dfiw8u.cloudfront.net/content/uploads/2019/11/25011814/Davis-Cup-chief-Gerard-Pique.jpg"
                                ),
                                radius: 32,
                              ),
                              // end circle image

                              // start online point
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                    end: 3,
                                    bottom: 3
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              // end online point

                            ],
                          ),

                          SizedBox(height:6),

                          // start the text under avatar
                          Text(
                            "Gerard Pique",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          // end the the text after avatar
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 10
                    ),
                    // the container the has item of row
                    Container(
                      width: 74,
                      child: Column(

                        children: [
                          // the stack is an circle image with online point
                          Stack(
                            alignment: Alignment.bottomRight,

                            children: [
                              // start circle image
                              CircleAvatar(
                                backgroundImage:NetworkImage(
                                    "https://images.beinsports.com/8tTFLE1aijgDdJqS_umgIHrolFw=/670x424/smart/paulodybala-cropped_17wk09ug6xxiy1hfvzayf9f1ew.jpg"
                                ),
                                radius: 32,
                              ),
                              // end circle image

                              // start online point
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.only(
                                    end: 3,
                                    bottom: 3
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              // end online point

                            ],
                          ),

                          SizedBox(height:6),

                          // start the text under avatar
                          Text(
                            "Paulo Dybala",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          // end the the text after avatar
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 10
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),


              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage("https://upload.wikimedia.org/wikipedia/commons/c/c1/Lionel_Messi_20180626.jpg"),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point
                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Loinel Messi",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,

                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage(
                                  "https://e0.365dm.com/21/05/1600x900/skysports-jack-grealish-aston-villa_5391170.jpg?20210522183704"
                              ),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point

                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jack Grealish",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),


                              SizedBox(height: 8,),

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,

                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage(
                                  "https://atalayar.com/sites/default/files/styles/foto_/public/noticias/Atalayar_Mohamed%20Salah%2C%20jugador%20del%20Liverpool%20%284%29.jpg?itok=oOHpI7RT"
                              ),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point

                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mohamed Salah",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),


                              SizedBox(height: 8,),

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,

                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage(""
                                  "https://d2me2qg8dfiw8u.cloudfront.net/content/uploads/2019/11/25011814/Davis-Cup-chief-Gerard-Pique.jpg"
                              ),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point

                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gerad Pique",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),


                              SizedBox(height: 8,),

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,

                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage(
                                  "https://images.beinsports.com/8tTFLE1aijgDdJqS_umgIHrolFw=/670x424/smart/paulodybala-cropped_17wk09ug6xxiy1hfvzayf9f1ew.jpg"
                              ),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point

                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paulo Dybala",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),


                              SizedBox(height: 8,),

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,

                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage(
                                  "https://resources.premierleague.com/premierleague/photos/players/250x250/p78830.png"
                              ),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point

                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hary Kane",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),


                              SizedBox(height: 8,),

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            // start circle image
                            CircleAvatar(
                              backgroundImage:NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1364719465825325057/YQxSgEiH_400x400.jpg"
                              ),
                              radius: 32,
                            ),
                            // end circle image

                            // start online point
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                  end: 3,
                                  bottom: 3
                              ),
                              child: CircleAvatar(
                                radius: 7.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            // end online point

                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bruno Fernandes",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),

                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "hello from last message my friend ahmed",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(

                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Text(
                                    "1:24 PM",
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

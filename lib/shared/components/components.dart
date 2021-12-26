import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/todo_app/cubit/cubit.dart';
import 'package:shop_app/modules/news_app/webview_screen/WebViewScreen.dart';



Widget defaultButton({
  double btnWidth = double.infinity,
  Color btnColor = Colors.blue,
  double? raduis = 0,
  bool? isUpperCase = true,
  required  Function()? function,
  required String text,

})
{
  return  Container(
    width: btnWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(raduis!),
      color: btnColor,
    ),

    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUpperCase! && isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}


Widget defaultTextFormField(
    {
      required TextEditingController? fieldController,
      required TextInputType? inputType,
      Function(String)? onSubmit,
      Function(String)? onChange,
      Function? onTap,
      required  String? Function(String?)? validator,
      required String? labelText,
      required IconData? prefixIcon,
      IconData? suffixIcon,
      bool obscureText = false,
      Function()? suffixClicked,
      double? raduis = 0,

    }) =>TextFormField(

  controller: fieldController,
  keyboardType: inputType,
  obscureText: obscureText,
  onFieldSubmitted: onSubmit,
  onChanged:onChange,
  validator: validator,
  onTap: (){
    onTap!();
  },
   decoration: InputDecoration(
    //hintText: "Password",
    labelText: labelText,
    prefixIcon: Icon(
        prefixIcon
    ),
    suffixIcon: IconButton(
        onPressed: suffixClicked,
        icon: Icon(suffixIcon)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(raduis!),
    ),
  ),
);


Widget buildTaskItem(Map model,context) =>Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
              '${model['time']}',
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          ),
          onPressed: (){
            AppCubit.get(context).updateDatabase(
                status: 'done',
                id: model['id'],
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.archive,
            color: Colors.grey,
          ),
          onPressed: (){
            AppCubit.get(context).updateDatabase(
              status: 'archive',
              id: model['id'],
            );
          },
        ),
      ],
    ),
  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteDatabase(id: model['id']);
  },
);


Widget taskBuilder({
  required List<Map> tasks,
}) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder:(context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => buildTaskItem(tasks[index],context),
    separatorBuilder: (context,index) =>myDivider(),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet,Please Add Some Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget buildArticleItem(Map article,context) => InkWell(
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0,),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
  
          ),
  
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
  
        ),
        SizedBox(
          width: 15.0,
        ),
      ],
    ),
  ),
  onTap: (){
    navigateTo(context, WebViewScreen(url: article['url']),);
  },
);


Widget articleBuilder({
  required List<dynamic> list ,
}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);

// ignore: non_constant_identifier_names
void navigateTo(context,Widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);

void navigateAndFinish(context,Widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ), (route){
    return false;
    },
);

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget buildListProduct(
    model,
    context,
    {
      bool isOldPrice = true,
    }) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                          ShopCubit.get(context).favorites[model.id]!
                              ? Colors.deepOrange
                              : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
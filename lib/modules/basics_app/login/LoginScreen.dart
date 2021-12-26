import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';



class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword =true;

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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                defaultTextFormField(
                  fieldController:  emailController,
                  labelText:  "Email Address",
                  prefixIcon: Icons.email,
                  inputType:  TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Email Address Can Not Be Empty ';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultTextFormField(
                  fieldController: passwordController,
                  labelText:  'Password',
                  prefixIcon: Icons.lock,
                  obscureText:  isPassword,
                  suffixIcon:  isPassword? Icons.visibility:Icons.visibility_off,
                  suffixClicked:  (){
                    setState(() {
                      isPassword =!isPassword;
                    });
                  },
                  inputType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Password Can Not Be Empty ';
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  function: ()
                  {
                    if(formKey.currentState!.validate()){
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                  text: 'login',
                  raduis: 10.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account',
                    ),
                    TextButton(
                      onPressed: (){
                      },
                      child: Text(
                      'Register Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
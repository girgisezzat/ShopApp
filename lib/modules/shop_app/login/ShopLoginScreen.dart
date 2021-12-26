import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:shop_app/modules/shop_app/login/cubit/states.dart';
import 'package:shop_app/modules/shop_app/register/ShopRegisterScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginState>(
        listener: (context,state)
        {
          if(state is ShopLoginSuccessState)
          {
            if(state.loginModel!.status)
              {
                showToast(
                    text: state.loginModel!.message,
                    state: ToastStates.SUCCESS,
                );

                CacheHelper.saveData(
                    key: 'token',
                    value: state.loginModel!.data.token,
                ).then((value){

                  token = state.loginModel!.data.token;

                  navigateAndFinish(context, ShopLayout(),);
                });
              }
            else
              {
                showToast(
                  text: state.loginModel!.message,
                  state: ToastStates.ERROR,
                );
              }
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              centerTitle: true,
              title: Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            body:Center(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/online-shopping.jpg',
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 250,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  8.0
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'login now to browse our hot offers',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color:Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                    fieldController: emailController,
                                    inputType: TextInputType.emailAddress,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'please enter your email address';
                                      }
                                    },
                                    labelText: 'Email Address',
                                    raduis: 20.0,
                                    prefixIcon: Icons.email_outlined,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormField(
                                    fieldController: passwordController,
                                    inputType: TextInputType.visiblePassword,
                                    obscureText: ShopLoginCubit.get(context).isPassword,
                                    suffixIcon: ShopLoginCubit.get(context).suffix,
                                    suffixClicked: (){
                                      ShopLoginCubit.get(context).changePasswordVisibility();
                                    },
                                    onSubmit: (value){
                                      if (formKey.currentState!.validate()) {
                                        ShopLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'password is too short';
                                      }
                                    },
                                    labelText: 'Password',
                                    raduis: 20.0,
                                    prefixIcon: Icons.lock_outline,
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! ShopLoginLoadingState ,
                                    builder: (context)=>defaultButton(
                                      function: (){
                                        if (formKey.currentState!.validate()) {
                                          ShopLoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                      text: 'login',
                                      raduis: 20.0,
                                      btnColor: Colors.indigo,
                                      isUpperCase: true,
                                    ),
                                    fallback: (context)=>Center(child: CircularProgressIndicator()),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    [
                                      Text(
                                        'Don\'t have an account?',
                                      ),
                                      TextButton(
                                        onPressed: ()
                                        {
                                          navigateTo(context, ShopRegisterScreen(),);
                                        },
                                        child: Text(
                                            'Register'
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

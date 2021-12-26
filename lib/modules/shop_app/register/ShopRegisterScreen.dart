import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopRegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state)
        {
          if (state is ShopRegisterSuccessState)
          {
            if (state.loginModel!.status)
            {
              showToast(
                text: state.loginModel!.message,
                state: ToastStates.SUCCESS,
              );

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel!.data.token,
              ).then((value)
              {
                token = state.loginModel!.data.token;
                navigateAndFinish(context, ShopLayout(),);
              });
            }
            else {
              showToast(
                text: state.loginModel!.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              centerTitle: true,
              title: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            body: Center(
              child: Stack(
                children:
                [
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
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Register now to browse our hot offers',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  defaultTextFormField(
                                    fieldController: nameController,
                                    inputType: TextInputType.name,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'please enter your name';
                                      }
                                    },
                                    labelText: 'User Name',
                                    raduis: 20.0,
                                    prefixIcon: Icons.person,
                                  ),
                                  SizedBox(
                                    height: 15.0,
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
                                    fieldController: phoneController,
                                    inputType: TextInputType.phone,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'please enter your phone number';
                                      }
                                    },
                                    labelText: 'Phone',
                                    raduis: 20.0,
                                    prefixIcon: Icons.phone,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormField(
                                    fieldController: passwordController,
                                    inputType: TextInputType.visiblePassword,
                                    obscureText: ShopRegisterCubit.get(context).isPassword,
                                    suffixIcon: ShopRegisterCubit.get(context).suffix,
                                    suffixClicked: (){
                                      ShopRegisterCubit.get(context).changePasswordVisibility();
                                    },
                                    onSubmit: (value){
                                      if (formKey.currentState!.validate()) {
                                        ShopRegisterCubit.get(context).userRegister(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                        );
                                      }
                                    },
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'please enter your password';
                                      }
                                    },
                                    labelText: 'Password',
                                    raduis: 20.0,
                                    prefixIcon: Icons.lock_outline,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultTextFormField(
                                    fieldController: confirmPasswordController,
                                    inputType: TextInputType.visiblePassword,
                                    obscureText: ShopRegisterCubit.get(context).isPassword,
                                    suffixIcon: ShopRegisterCubit.get(context).suffix,
                                    suffixClicked: (){
                                      ShopRegisterCubit.get(context).changePasswordVisibility();
                                    },
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'please enter your password';
                                      }
                                      else if(value != passwordController.text)
                                        return 'Password Don\'t Match';
                                    },
                                    labelText: 'Confirm Password',
                                    raduis: 20.0,
                                    prefixIcon: Icons.lock_outline,
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! ShopRegisterLoadingState,
                                    builder: (context) => defaultButton(
                                      function: () {
                                        if (formKey.currentState!.validate())
                                        {
                                          ShopRegisterCubit.get(context).userRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                          );
                                        }
                                      },
                                      text: 'Register',
                                      raduis: 20.0,
                                      isUpperCase: true,
                                      btnColor: Colors.indigo,
                                    ),
                                    fallback: (context) =>
                                        Center(child: CircularProgressIndicator()),
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

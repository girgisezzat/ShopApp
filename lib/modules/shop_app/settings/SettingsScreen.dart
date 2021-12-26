import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state) {
        if(state is ShopSuccessUserDataState)
          {
            nameController.text = state.loginModel.data.name;
            emailController.text = state.loginModel.data.email;
            phoneController.text = state.loginModel.data.phone;
          }
      },
      builder: (context,state){

        var model = ShopCubit.get(context).userModel;

        nameController.text  = model!.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;

        return Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: ConditionalBuilder(
                condition: ShopCubit.get(context).userModel != null,
                builder: (context) =>  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:
                    [
                      if(state is ShopLoadingUpdateUserState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        fieldController: nameController,
                        inputType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name Must Not Be Empty ';
                          }
                        },
                        labelText: 'Name',
                        raduis: 20.0,
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        fieldController: emailController,
                        inputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Must Not Be Empty ';
                          }
                        },
                        labelText: 'Email Address',
                        raduis: 20.0,
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        fieldController: phoneController,
                        inputType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Must Not Be Empty ';
                          }
                        },
                        labelText: 'Phone',
                        raduis: 20.0,
                        prefixIcon: Icons.phone,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        function: (){
                          ShopCubit.get(context).updateUserData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                          );
                        },
                        text: 'Update',
                        raduis: 20.0,
                        btnColor: Colors.indigo,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        function: (){
                          signOut(context);
                        },
                        text: 'Logout',
                        raduis: 20.0,
                        btnColor: Colors.indigo,
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }
}

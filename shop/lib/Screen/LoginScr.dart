import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Backend/Bloc/reg_Login_Bloc.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Elements/validate.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'HomeScr.dart';
import 'RegisterScr.dart';
import 'bottomNav.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _loginMethod() async {
      var isvalid = _formKey.currentState!.validate();
      // print('valid $isvalid');
      print("isValid $isvalid");
      print('userName ${userNameController.text}');
      print('password ${passwordController.text}');
      if (!isvalid) {
        return 'Please Enter Valid Data';
      }
      _formKey.currentState!.save();

      if (isvalid == true) {
        // print("condtion is true");
        // navigationPush(
        //     context,
        //     UserNavigationBar(
        //       currentTab: 0,
        //     ));
        // final cubit = BlocProvider.of<RegisterBloc>(context, listen: false);
        // var b = cubit.add(LoginBtnEvent(
        //   password: passwordController.text,
        //   email: userNameController.text,
        // ));

        // print(cubit);

        // BlocProvider.of<RegisterBloc>(context)
        //   ..add(LoginBtnEvent(
        //     password: passwordController.text,
        //     email: userNameController.text,
        //   ));
        // var isris = context.read<RegisterBloc>().add(LoginBtnEvent(
        //       password: passwordController.text,
        //       email: userNameController.text,
        //     ));
        // var isregis = await BlocProvider.of<RegisterBloc>(context)
        //   ..add(LoginBtnEvent(
        //     password: passwordController.text,
        //     email: userNameController.text,
        //   ));
      }
    }

    return Scaffold(
      body:
      //     BlocConsumer<RegisterBloc, RegisterState>(listener: (context, state) {
      //   if (state is SuccessState) {
      //     navigationPush(
      //         context,
      //         UserNavigationBar(
      //           currentTab: 1,
      //         ));
      //   }
      // }, builder: (context, state) {

      //   return 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                EditTextField(
                  textAlign: TextAlign.left,
                  txtColor: txtBlackColor,
                  formBox: true,
                  fillColor: borderColor,
                  headTxt: 'Username',
                  hintText: 'Enter Username',
                  controller: userNameController,
                  vertical: 15,
                  validator: (v) => validateField(v!),
                ),
                heightSizedBox(10.0),
                EditTextField(
                    vertical: 15,
                    textAlign: TextAlign.left,
                    txtColor: txtBlackColor,
                    headTxt: 'Password',
                    fillColor: borderColor,
                    hintText: 'Enter Password',
                    controller: passwordController,
                    // validator: validateField,
                    validator: (v) => validateField(v!),
                    obscureText: true,
                    formBox: true),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Btn(
                    // alignment: Alignment.bottomLeft,
                    height: 45,
                    width: 100,
                    onTap: _loginMethod,
                    btnName: 'Login',
                    txtColor: txtWhiteColor,
                    color: coffeColor,
                    // onTap: () => navigationPush(context, OrderDeatilsScreen()),
                  ),
                )
              ],
            ),
          ),
        ),
      // }),
      bottomNavigationBar:
          // bottomSheet:
          Container(
        height: 85,
        decoration: BoxDecoration(
          color: offWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18.0, left: 25, right: 25, bottom: 5),
          child: Column(
            children: [
              Txt(
                t: 'Don\'t have account ?',
                color: greyColor,
              ),
              heightSizedBox(5.0),
              Btn(
                onTap: () => navigationPush(context, RegisterScreen()),
                height: 40,
                btnName: 'Create an account',
                color: redColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

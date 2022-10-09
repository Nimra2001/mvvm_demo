import 'package:flutter/material.dart';
import 'package:mvvm_demo/resources/components/round_buttons.dart';
import 'package:mvvm_demo/utils/routes/routes_name.dart';
import 'package:mvvm_demo/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier obsecurePassword = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ValueListenableBuilder(
              valueListenable: obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: obsecurePassword.value,
                  obscuringCharacter: "*",
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          obsecurePassword.value = !obsecurePassword.value;
                        },
                        child: obsecurePassword.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility_outlined)),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.1,
            ),
            RoundButton(
              loading: authViewModel.signUploading,
              title: 'SignUp',
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Email can\'t be empty', context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'Password can\'t be empty', context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Password should be 6 digits', context);
                } else {
                  //Compiling data
                  Map data = {
                    "email": emailController.text.toString(),
                    "password": passwordController.text.toString()
                  };
                  //Calling Api
                  authViewModel.registerApi(data, context);
                  print("Api hit");
                }
              },
            ),
            SizedBox(
              height: height * 0.010,
            ),
            InkWell(
                onTap: () => Navigator.pushNamed(context, RoutesName.login),
                child: const Text("Already have a account. LogIn")),
          ],
        ),
      ),
    );
  }
}

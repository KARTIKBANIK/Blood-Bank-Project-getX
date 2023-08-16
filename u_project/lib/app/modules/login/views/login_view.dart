import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:u_project/app/modules/signup/bindings/signup_binding.dart';
import 'package:u_project/app/modules/signup/views/signup_view.dart';
import 'package:u_project/widgets/custom_form_field.dart';
import 'package:u_project/widgets/custom_text.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  child: Lottie.asset("assets/animations/6.json"),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_TExt(
                    txt: "Login",
                    fs: 35,
                    fw: FontWeight.bold,
                    textColor: Colors.black,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          hintText: 'Name',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"),
                            )
                          ],
                          validator: (val) {
                            if (!val!.isValidName) return 'Enter valid name';
                            return null;
                          },
                        ),
                        CustomFormField(
                          hintText: 'Email',
                          validator: (val) {
                            if (!val!.isValidEmail) {
                              return 'Enter valid email';
                            }
                            return null;
                          },
                        ),
                        CustomFormField(
                          hintText: 'Phone',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[0-9]"),
                            )
                          ],
                          validator: (val) {
                            if (!val!.isValidPhone) {
                              return 'Enter valid phone';
                            }
                            return null;
                          },
                        ),
                        CustomFormField(
                          hintText: 'Password',
                          validator: (val) {
                            if (!val!.isValidPassword) {
                              return 'Enter valid password';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignupView(),
                                ),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Dont have any acoount? ',
                        children: <InlineSpan>[
                          TextSpan(
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Get.to(
                                    SignupView(),
                                  ),
                            text: ' Sign Up',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

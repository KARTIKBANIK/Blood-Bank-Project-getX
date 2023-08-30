// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:u_project/app/modules/home/views/home_view.dart';
// import 'package:u_project/app/modules/signup/bindings/signup_binding.dart';
// import 'package:u_project/app/modules/signup/views/signup_view.dart';
// import 'package:u_project/widgets/custom_form_field.dart';
// import 'package:u_project/widgets/custom_text.dart';
// import '../controllers/login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Center(
//                 child: Container(
//                   child: Lottie.asset("assets/animations/6.json"),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: ListView(
//                 children: [
//                   Custom_TExt(
//                     txt: "Login",
//                     fs: 35,
//                     fw: FontWeight.bold,
//                     textColor: Colors.black,
//                   ),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         CustomFormField(
//                           hintText: 'Name',
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(
//                               RegExp(r"[a-zA-Z]+|\s"),
//                             )
//                           ],
//                           validator: (val) {
//                             if (!val!.isValidName) return 'Enter valid name';
//                             return null;
//                           },
//                         ),
//                         CustomFormField(
//                           hintText: 'Email',
//                           validator: (val) {
//                             if (!val!.isValidEmail) {
//                               return 'Enter valid email';
//                             }
//                             return null;
//                           },
//                         ),
//                         CustomFormField(
//                           hintText: 'Phone',
//                           inputFormatters: [
//                             FilteringTextInputFormatter.allow(
//                               RegExp(r"[0-9]"),
//                             )
//                           ],
//                           validator: (val) {
//                             if (!val!.isValidPhone) {
//                               return 'Enter valid phone';
//                             }
//                             return null;
//                           },
//                         ),
//                         CustomFormField(
//                           hintText: 'Password',
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (formKey.currentState!.validate()) {
//                               Get.to(
//                                 HomeView(),
//                               );
//                             }
//                           },
//                           child: const Text('Submit'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Text.rich(
//                       TextSpan(
//                         text: 'Dont have any acoount? ',
//                         children: <InlineSpan>[
//                           TextSpan(
//                             recognizer: new TapGestureRecognizer()
//                               ..onTap = () => Get.to(
//                                     SignupView(),
//                                   ),
//                             text: ' Sign Up',
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:u_project/app/modules/home/views/home_view.dart';
import 'package:u_project/app/modules/login/views/forget_password_screen.dart';
import 'package:u_project/app/modules/login/views/global.dart';
import 'package:u_project/app/modules/login/views/register_screen.dart';
import 'package:u_project/app/modules/service_ui/views/service_ui_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  //declare a global key
  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    //value all the form fields
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      )
          .then(
        (auth) async {
          currentUser = auth.user;

          await Fluttertoast.showToast(msg: "Successfully Logged In");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => HomeView(),
            ),
          );
        },
      ).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "Error Occured \n$errorMessage");
      });
    } else {
      Fluttertoast.showToast(msg: "Not all field are valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Lottie.asset(darkTheme
                      ? 'assets/animations/login.json'
                      : 'assets/animations/login.json'),
                ),
                SizedBox(
                  height: 29,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: darkTheme ? Colors.red.shade400 : Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Email
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: darkTheme
                                      ? Colors.red.shade400
                                      : Colors.grey,
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Email can't be empty.";
                                }

                                if (EmailValidator.validate(text) == true) {
                                  return null;
                                }
                                if (text.length < 2) {
                                  return "Enter a valid Email.";
                                }

                                if (text.length > 99) {
                                  return "Email can't be more than 100.";
                                }
                              },
                              onChanged: (text) => setState(() {
                                emailTextEditingController.text = text;
                              }),
                            ),

                            SizedBox(height: 20.0),

                            //Password
                            TextFormField(
                              obscureText: !_passwordVisible,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                filled: true,
                                fillColor: darkTheme
                                    ? Colors.black45
                                    : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: darkTheme
                                      ? Colors.red.shade400
                                      : Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    //  Update the State (Tap the state of password visible variable)
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: darkTheme
                                        ? Colors.red.shade400
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Password can't be empty.";
                                }

                                if (text.length < 6) {
                                  return "Enter a valid Password.";
                                }

                                if (text.length > 49) {
                                  return "Password can't be more than 50.";
                                }
                                return null;
                              },
                              onChanged: (text) => setState(() {
                                passwordTextEditingController.text = text;
                              }),
                            ),
                            SizedBox(height: 20),

                            //Register Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: darkTheme
                                    ? Colors.red.shade400
                                    : Colors.blue,
                                onPrimary:
                                    darkTheme ? Colors.black : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              onPressed: () {
                                _submit();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            //Forget Password Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forget password",
                                style: TextStyle(
                                  color: darkTheme ? Colors.red : Colors.blue,
                                ),
                              ),
                            ),

                            //Register Section
                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Doesn't have an account?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: darkTheme
                                          ? Colors.red.shade400
                                          : Colors.blue,
                                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

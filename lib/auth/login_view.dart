import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/bottomnav.dart';
// import 'package:loginn/dash_view.dart';
// import 'package:loginn/forgot_pss.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/auth/registerr_view.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/auth/splash_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isObsecure = true.obs;
  Repository repository = Repository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 40.0, top: 90.0),
                    child: (Text(
                      'Welcome Back!',
                      style: GoogleFonts.ubuntu(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(
                      left: 40.0,
                    ),
                    child: (Text(
                      'Sign In to your account',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        color: GlobalColors.textColor,
                      ),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 48, right: 47, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(
                              fontSize: 16, color: GlobalColors.textColor),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.email),
                            labelText: 'Email / No Hp',
                            labelStyle: GoogleFonts.ubuntu(),
                            hintText: 'Masukkan Email / No HP',
                            hintStyle: GoogleFonts.ubuntu(),
                            border: const UnderlineInputBorder(),
                          ),
                        ),
                        Obx(
                          () => TextFormField(
                            controller: passwordController,
                            obscureText: isObsecure.value,
                            style: TextStyle(
                                fontSize: 16, color: GlobalColors.textColor),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                icon: const Icon(Icons.lock),
                                labelText: 'Password',
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Masukkan Password',
                                hintStyle: GoogleFonts.ubuntu(),
                                border: const UnderlineInputBorder(),
                                suffixIcon: Obx(() => GestureDetector(
                                      onTap: () {
                                        isObsecure.value = !isObsecure.value;
                                      },
                                      child: Icon(isObsecure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                        // ),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 const ForgotPasswordView()));
                        //   },
                        //   child: Text(
                        //     "forgot password",
                        //     style: GoogleFonts.ubuntu(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w500,
                        //       color: GlobalColors.mainColor,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 52,
                    margin: const EdgeInsets.only(left: 26, right: 26),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: () async {
                        Map<String, dynamic> response =
                            await repository.postDataLogin(
                                emailController.text, passwordController.text);
                        if (response['status'] == true) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SplashView()),
                            (route) => false,
                          );
                        } else {
                          //alert

                          //snackbar
                          //toast

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Center(
                                    child: Text(
                                      response['msg'],
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: GlobalColors.btnColor,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // const SizedBox(height: 20),
                  // const SizedBox(height: 310),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "I don't have an acccount?",
                  //       style: GoogleFonts.ubuntu(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w500,
                  //         color: GlobalColors.textColor,
                  //       ),
                  //     ),
                  //     TextButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => const RegisterView()));
                  //         },
                  //         child: Text(
                  //           'Sign Up',
                  //           style: GoogleFonts.ubuntu(
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500,
                  //               color: GlobalColors.mainColor),
                  //         ))
                  //   ],
                  // )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I don't have an acccount?",
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: GlobalColors.textColor,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: GlobalColors.mainColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
// import 'package:loginn/kode.dart';
import 'package:loginn/login_view.dart';
import 'package:loginn/repository.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var isObsecure = true.obs;

  Repository repository = Repository();

  final namaController = TextEditingController();
  final hpController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 40.0, top: 30.0),
                    child: (Text(
                      'Sign UP',
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
                      'Create account and enjoy all services',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        color: GlobalColors.textColor,
                      ),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 26, right: 26, top: 50),
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                controller: namaController,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: GlobalColors.textColor),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.person),
                                  labelText: 'Nama Lengkap',
                                  labelStyle: GoogleFonts.ubuntu(),
                                  hintText: 'Masukkan Nama Lengkap',
                                  hintStyle: GoogleFonts.ubuntu(),
                                  border: const UnderlineInputBorder(),
                                ),
                              ),
                              TextFormField(
                                controller: hpController,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: GlobalColors.textColor),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.phone_android),
                                  labelText: 'No HP',
                                  labelStyle: GoogleFonts.ubuntu(),
                                  hintText: 'No HP',
                                  hintStyle: GoogleFonts.ubuntu(),
                                  border: const UnderlineInputBorder(),
                                ),
                              ),
                              TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: GlobalColors.textColor),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.email),
                                  labelText: 'Email',
                                  labelStyle: GoogleFonts.ubuntu(),
                                  hintText: 'Masukkan Email',
                                  hintStyle: GoogleFonts.ubuntu(),
                                  border: const UnderlineInputBorder(),
                                ),
                              ),
                              Obx(
                                () => TextFormField(
                                  controller: passwordController,
                                  obscureText: isObsecure.value,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: GlobalColors.textColor),
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
                                              isObsecure.value =
                                                  !isObsecure.value;
                                            },
                                            child: Icon(isObsecure.value
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ))),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 52,
                                margin: const EdgeInsets.only(top: 30),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: GlobalColors.mainColor,
                                  ),
                                  onPressed: () async {
                                    Map<String, dynamic> response =
                                        await repository.postData(
                                            namaController.text,
                                            hpController.text,
                                            emailController.text,
                                            passwordController.text);

                                    if (response['status'] == true) {
                                      await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            title: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .check_circle_outline_rounded,
                                                      size: 100,
                                                      color: Colors.green,
                                                    ),
                                                    Text(
                                                      response['msg'],
                                                      style: GoogleFonts.ubuntu(
                                                        fontSize: 16,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginView()),
                                        (route) => false,
                                      );
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (_) => const LoginView()));
                                    } else {
                                      //alert

                                      //snackbar
                                      //toast

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                    'Sign Up',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.btnColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(height: 210),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "have an account ?",
                  //       style: GoogleFonts.ubuntu(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w500,
                  //         color: GlobalColors.textColor,
                  //       ),
                  //     ),

                  //     // const SizedBox(height: 248),
                  //     TextButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => const LoginView()));
                  //         },
                  //         child: Text(
                  //           'Sign In',
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
                  "have an account ?",
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: GlobalColors.textColor,
                  ),
                ),

                // const SizedBox(height: 248),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    child: Text(
                      'Sign In',
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

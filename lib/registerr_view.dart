import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/kode.dart';
import 'package:loginn/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SafeArea(
        child: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 40.0, top: 30.0),
            child: (
              Text('Sign UP',
              style: GoogleFonts.ubuntu(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),  
              )
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 40.0,),
            child: (
              Text('Create account and enjoy all services',
              style: GoogleFonts.ubuntu(
              fontSize: 16,
              color: GlobalColors.textColor,
              ),
              )
            ),
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
                        style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          labelText: 'Username',
                          labelStyle: GoogleFonts.ubuntu(
                          ),
                          hintText: 'Masukkan Username',
                          hintStyle: GoogleFonts.ubuntu(),
                          border: const UnderlineInputBorder(),
                          
                        ),
                      ),           
                      TextFormField(
                        style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.email),
                          labelText: 'Email / WhatsApp',
                          labelStyle: GoogleFonts.ubuntu(
                          ),
                          hintText: 'Masukkan Email / WhatsApp',
                          hintStyle: GoogleFonts.ubuntu(),
                          border: const UnderlineInputBorder(),
                          
                        ),
                      ),
                      Obx(() => TextFormField(
                            obscureText: isObsecure.value,
                            style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
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
                                child: Icon(
                                  isObsecure.value ? Icons.visibility_off : Icons.visibility
                                ),
                              ))
                        ),
                      ),),
                      Container(
                      width: double.infinity,
                      height: 52,
                      margin: const EdgeInsets.only( top: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColors.mainColor,
                        ),
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const KodeVieww()));
                        },
                        child: Text('Sign Up',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: GlobalColors.btnColor,
                        ),),
                      ),      
                    ),
                  ],
                ),
                )
              ],
            ),
            
          ),
          // Container(
          //   width: double.infinity,
          //   height: 52,
          //   margin: const EdgeInsets.only(left: 26, right: 26, top: 30),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: GlobalColors.mainColor,
          //     ),
          //     onPressed: () {
          //       Navigator.push(context, 
          //       MaterialPageRoute(builder: (context) => const KodeVieww()));
          //     },
          //     child: Text('Sign Up',
          //     style: GoogleFonts.ubuntu(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w500,
          //       color: GlobalColors.btnColor,
          //     ),),
          //   ),      
          // ),
          
          const SizedBox(height: 83),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("have an account ?",
              style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: GlobalColors.textColor,
                               
              ),
              ),
              
              const SizedBox(height: 330),
              TextButton(onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const LoginView()));
              }, 
              child:  Text('Sign In',
              
              style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: GlobalColors.mainColor
              ),))                       
            ],
          )
        ],
        ),
      ),
    );
  }
}
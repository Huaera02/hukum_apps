import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/bottomnav.dart';
import 'package:loginn/forgot_pss.dart';
// import 'package:loginn/dash_view.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/registerr_view.dart';
// import 'package:loginn/splash_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40.0, top: 90.0),
              child: (
                Text('Welcome Back!',
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
                Text('Sign In to your account',
                style: GoogleFonts.ubuntu(
                fontSize: 16,
                color: GlobalColors.textColor,
                ),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 48, right: 47, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [                
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
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          labelText: 'Password',
                          labelStyle: GoogleFonts.ubuntu(),
                          hintText: 'Masukkan Password',
                          hintStyle: GoogleFonts.ubuntu(),
                          border: const UnderlineInputBorder(),
                          suffix: const Icon(Icons.visibility),
                    ),
                  ),
                  TextButton(onPressed:  () {
                    Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const ForgotPasswordView()));
                  }, 
                  child:    
                  Text("forgot password",
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: GlobalColors.mainColor,
                  ),
                  ),)
              
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
                onPressed: () {
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const BottomNavView()));
                },
                child: Text('Sign In',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.btnColor,
                ),),
              ),      
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              children: [ 
                Expanded(
                  child: Divider(
                    thickness:1.0,
                    color: GlobalColors.textColor, ), 
                    ),
                    Text('Or Sign In With',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.textColor,
        
                    ),),
                    Expanded(child: 
                    Divider(
                      thickness: 1.0,
                      color: GlobalColors.textColor,))
              ],
            ),
            ),
            const SizedBox(height: 20),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/apple.png',
                height: 60,
                width: 60,),
                const SizedBox(width: 50),
                Image.asset('assets/images/Google.png',
                height: 60,
                width: 60,),
                const SizedBox(width: 50),
                Image.asset('assets/images/Facebook.png',
                width: 60,
                height: 60,)
              ],
            ),
            const SizedBox(height: 83),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I don't have an acccount?",
                style: GoogleFonts.ubuntu(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.textColor,
                                 
                ),
                ),
                const SizedBox(height: 154),
                TextButton(onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegisterView()));
                }, 
                child:  Text('Sign Up',
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
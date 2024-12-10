import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/auth/newpass_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 40.0, top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Forgot Password',
                style: GoogleFonts.ubuntu(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),  
                ),
                Text('Select verification method and we will send verification code',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  color: GlobalColors.textColor,
                ),  
                )
              ],
            ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40.0, top: 50.0, right: 40.0, bottom: 360),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    
                    color: Colors.black38,
                    blurRadius: 6,
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: GlobalColors.textColor,),
                  Padding(padding: const EdgeInsets.only(left: 10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(width: 10,),
                      Text('********@mail.com',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        color: GlobalColors.textColor)
                      )
                    ],
                  ),
                  ),
                ],
              ),
            ),

            Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.only(left: 26, right: 26, top: 20),
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.mainColor,),
                  onPressed: (){
                    Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const NewPassView()));
                  }, 
                child: Text('Continue',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.btnColor,))),
                ),
          ],
        )),
    );
  }
}
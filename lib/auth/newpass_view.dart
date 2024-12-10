import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/dash_view.dart';
import 'package:loginn/warna/global_colors.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('New Password',
                style: GoogleFonts.ubuntu(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),  
                ),
                Text('Create a new password that is safe and easy to remember',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  color: GlobalColors.textColor,
                ),  
                )
              ],
            ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 40.0, top: 50.0, right: 40.0, bottom: 285),
              child: Column(
                children: [
                  TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          labelText: 'New Password',
                          labelStyle: GoogleFonts.ubuntu(),
                          hintText: 'New Password',
                          hintStyle: GoogleFonts.ubuntu(),
                          border: const UnderlineInputBorder(),
                          suffix: const Icon(Icons.visibility),
                    ),
                  ),

                  TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          labelText: 'Confirm New password',
                          labelStyle: GoogleFonts.ubuntu(),
                          hintText: 'Confirm New password',
                          hintStyle: GoogleFonts.ubuntu(),
                          border: const UnderlineInputBorder(),
                          suffix: const Icon(Icons.visibility),
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
                //     Navigator.push(context, 
                // MaterialPageRoute(builder: (context) => const BottomNavView()));
                  }, 
                child: Text('Comfirm New Password',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.btnColor,))),
                ),
          ],
        ),),
    );
  }
}
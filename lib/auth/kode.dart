import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/menu/bottomnav.dart';
// import 'package:loginn/dash_view.dart';
import 'package:loginn/warna/global_colors.dart';
// import 'package:flutter/widgets.dart';

class KodeVieww extends StatelessWidget {
  const KodeVieww({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SafeArea(
        child:ListView(
          children: [
               Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 40.0, top: 30.0),
            child: (
              Text('Verify Code',
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
              Text('Please enter the code we just sent to email timsmxxx@email.com',
              style: GoogleFonts.ubuntu(
              fontSize: 16,
              color: GlobalColors.textColor,
              ),
              )
            ),
          ),
          const SizedBox(height: 74),
            Container(
              margin: const EdgeInsets.only(left: 79.0, right: 79.0),
            child: Form( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                ),
              ),
               SizedBox(
                height: 30,
                width: 30,
                child: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                ),
              ),
               SizedBox(
                height: 30,
                width: 30,
                child: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                ),
              ),
               SizedBox(
                height: 30,
                width: 30,
                child: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ],
          ),         
        ),
            ),
            const SizedBox(height: 25),
            Container(
                 alignment: Alignment.topCenter,
            // margin: const EdgeInsets.only(left: 40.0,),
            child: (
              Text('Resend code in 00:48',
              style: GoogleFonts.ubuntu(
              fontSize: 16,
              color: GlobalColors.textColor,
              ),
              )
            ),          
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 52,
            margin: const EdgeInsets.only(left: 26, right: 26, top: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.mainColor,
              ),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const BottomNavView()));
              },
              child: Text('Continue',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: GlobalColors.btnColor,
              ),),
            ),      
          ),
          ],
      ),
      
      ),
    );
  }
}
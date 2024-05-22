import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class WaitingRoomView extends StatelessWidget {
  const WaitingRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/advokat1.png',
            width: 80,
            height: 80,),
            const SizedBox(height: 50,),
            Text('Berikan Waktu untuk Menghubungka dengan',
            style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w100
            ),),
            const SizedBox(height: 10,),
            Text('Nurmiati, S.H',
            style: GoogleFonts.ubuntu(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 30,),
            Text('Halo Zhafira, Kami sudah memberitahu Advokat tentang Permintaan',
            style: GoogleFonts.ubuntu(
                fontSize: 20,
                fontWeight: FontWeight.w100
              ),
              textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              Text('60 Detik',
              style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: GlobalColors.mainColor
              ),)
          ],
        )),
    );
  }
}
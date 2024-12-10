import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';

class NotifikasiView extends StatelessWidget {
  const NotifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text('Notifikasi',
        style: GoogleFonts.ubuntu(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/notifikasi 1.png',
              width: 250,
              height: 200,),
              Text('Belum ada Notifikasi Masuk',
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              Text('Belum ada nofikasi yang masuk mengenai informasi seputar layanan, produk, promo, dan fitur terbaru kami',
              style: GoogleFonts.ubuntu(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: GlobalColors.textColor
              ),
              textAlign: TextAlign.center,)
            ],
          ),
        )
            
          
        ),
    );
  }
}
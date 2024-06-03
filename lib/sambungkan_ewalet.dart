import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/bayar_selesai.dart';
import 'package:loginn/bottomnav.dart';
import 'package:loginn/global_colors.dart';

class SambungEwalatView extends StatelessWidget {
  const SambungEwalatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Sambung ke E-Walet',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              Image.asset('assets/images/va.jpeg'),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,
                  ),
                  onPressed: () {
                    Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const BottomNavView()));
                  },
                  child: Text('Kembali ke Home',
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: GlobalColors.btnColor,
                  ),),
                ),      
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only( top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,
                  ),
                  onPressed: () {
                    Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const PembayaranSelesaiView()));
                  },
                  child: Text('Selanjutnya',
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
      ),
    );
  }
}
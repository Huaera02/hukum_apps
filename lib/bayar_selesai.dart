import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/detail_pesanan.dart';
import 'package:loginn/global_colors.dart';

class PembayaranSelesaiView extends StatelessWidget {
  const PembayaranSelesaiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Image.asset('assets/images/Succes Icon.png',
                  width: 120,
                  height: 120,),
                  Text('Berhasil',
                  style: GoogleFonts.ubuntu(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),),
                  Text('Pembayaran Anda telah Berhasil di Bayar, Silahkan Anda Berkonsultasi',
                  style: GoogleFonts.ubuntu(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                  ),
                  textAlign: TextAlign.center,)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsets.only(left: 26, right: 26, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.btnColor,
                ),
                onPressed: () {
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const DetailPesananView()));
                },
                child: Text('Selesai',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.mainColor,
                ),),
              ),      
            ),
          ],
        ),
      ),
      
    );
  }
}
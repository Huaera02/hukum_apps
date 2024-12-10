import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/detail_pesanan.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/riwayat/riwayat_mitra.dart';

class PembayaranSelesaiView extends StatelessWidget {
  const PembayaranSelesaiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 150),            
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Succes Icon.png',
                    width: 120,
                    height: 120,),
                    // const SizedBox(height: 30,),
                    Text('Berhasil',
                    style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ),),
                    const SizedBox(height: 50),
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
            ),
            const SizedBox(height: 320,),
            Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsets.only(left: 26, right: 26, ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.btnColor,
                ),
                onPressed: () {
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const RiwayatMitraView()));
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
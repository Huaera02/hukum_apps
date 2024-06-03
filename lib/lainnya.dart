import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class LainnyaView extends StatelessWidget {
  const LainnyaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text('Kategori Hukum',
        style: GoogleFonts.ubuntu(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          crossAxisCount: 3,
          children: [
            InkWell(
              onTap: (){
                // Navigator.push(context, 
                //     MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_keluarga.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Keluarga',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                //     MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_pidana.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Pidana',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                //     MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_ti.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Teknologi Informasi',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_an.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Administrasi Negara',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                //     MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_bisnis.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Bisnis dan Perusahann',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_asuransi.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Asuransi',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_haki.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Hak Intelektual',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_pertanahan.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Pertanahan dan\n Properti',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ChtAdvokat1View()));
              },
              splashColor: GlobalColors.btnColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/kategori_hutang.png',
                    height: 65,
                    width: 65,
                    ),
                    Text('Hutang Piutang',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],)),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class BacaArtikelView extends StatelessWidget {
  const BacaArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Baca Artikel',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6,
                      ),
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/GbrArtikel.png',
                      width: 110,
                      height: 110,
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        children: [
                          Text('Advokat Stefanus Roy\nDivonis 4,5 Tahun',
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                          textAlign: TextAlign.center,),
                          const SizedBox(height: 5,),
                          Text('Majelis hakim Pengadilan Tindak\nPidana Korupsi (Tipikor) pada\nPengadilan Negeri (PN)\nJakarta Pusat memvonis...',
                          style: GoogleFonts.ubuntu(
                            fontSize: 10,
                            fontWeight: FontWeight.w300
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
          
              const SizedBox(height: 10,),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6,
                      ),
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/GbrArtikel.png',
                      width: 110,
                      height: 110,
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        children: [
                          Text('Advokat Stefanus Roy\nDivonis 4,5 Tahun',
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                          textAlign: TextAlign.center,),
                          const SizedBox(height: 5,),
                          Text('Majelis hakim Pengadilan Tindak\nPidana Korupsi (Tipikor) pada\nPengadilan Negeri (PN)\nJakarta Pusat memvonis...',
                          style: GoogleFonts.ubuntu(
                            fontSize: 10,
                            fontWeight: FontWeight.w300
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';

class JanjiOfflineView extends StatelessWidget {
  const JanjiOfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Buat Janji Offline',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20,top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.ubuntu(),
                        hintText: 'Cari Firma Hukum',
                        hintStyle: GoogleFonts.ubuntu(),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text('Firma Hukum di Sekitarmu',
                    style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 10,),
                    SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){},
                          splashColor: GlobalColors.btnColor,
                          child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: Colors.grey.shade200)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/firma_hukum1.jpeg',
                                width: 190,
                                height: 100,),
                                const SizedBox(height: 5,),
                                Text('Yusuf Laoh & Partners Pengacara/Kantor Hukum',
                                style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,),
                                const SizedBox(height: 25,),
                                Text('Firma Hukum',
                                style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                                ),),
                                const SizedBox(height: 2,),
                                Text('3 km',
                                style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: GlobalColors.mainColor
                                ),),
                              ],
                            ),
                        ),
                        ),

                        //firma hukum2
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){},
                          splashColor: GlobalColors.btnColor,
                          child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: Colors.grey.shade200)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/firma_hukum2.png',
                                width: 190,
                                height: 100,),
                                const SizedBox(height: 5,),
                                Text('Kantor Hukum Maharadja Law Firm',
                                style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,),
                                const SizedBox(height: 25,),
                                Text('Firma Hukum',
                                style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                                ),),
                                const SizedBox(height: 2,),
                                Text('3 km',
                                style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: GlobalColors.mainColor
                                ),),
                              ],
                            ),
                        ),
                        )
                      ],
                    ),)
                  ],
                )
              ),
            ],
            )
            ),
    );
  }
}
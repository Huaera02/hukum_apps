import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/tambah_layanan.dart';

class LayananChatView extends StatelessWidget {
  const LayananChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Buat Layanan Chat',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Text('layanan Chat perMenit',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black38)
            ),
            child: Row(
              children: [
              Icon(Icons.chat_sharp, 
                color: GlobalColors.mainColor, 
                size: 30,),
              const SizedBox(width: 10,),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chat',
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,)
                        ),
                          Text('Rp.50.000 / 30 Menit',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.mainColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],)
          ),

          Container(
            width: double.infinity,
            height: 52,
            margin: const EdgeInsets.only(left: 26, right: 26, top: 495, bottom: 20),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: GlobalColors.mainColor,),
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const TambahLayanaView()));
            }, 
            child: Text('Buat Layanan',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: GlobalColors.btnColor,))),
          )
         ],
      )),
    );
  }
}
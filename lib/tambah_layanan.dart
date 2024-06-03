import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class TambahLayanaView extends StatelessWidget {
  const TambahLayanaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Harga Layanan perMenit',
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
              child: Text('Harga Layanan Konsultasi 30 Menit',
                style: GoogleFonts.ubuntu(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
            ),
            const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.ubuntu(
                    ),
                    hintText: 'Harga Layanan',
                    hintStyle: GoogleFonts.ubuntu(
                      color: Colors.black
                    ),
                    border: const OutlineInputBorder(), 
                  ),
                ),
              ),


            Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Text('Harga Layanan Konsultasi 60 Menit',
              style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),),
            ),
            const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.ubuntu(
                    ),
                    hintText: 'Harga Layanan',
                    hintStyle: GoogleFonts.ubuntu(
                      color: Colors.black
                    ),
                    border: const OutlineInputBorder(), 
                  ),
                ),
              ),


            Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Text('Harga Layanan Konsultasi 120 Menit',
              style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),),
            ),
            const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.ubuntu(
                    ),
                    hintText: 'Harga Layanan',
                    hintStyle: GoogleFonts.ubuntu(
                      color: Colors.black
                    ),
                    border: const OutlineInputBorder(), 
                  ),
                ),
              ),

 
            Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Text('Harga Layanan Konsultasi 180 Menit',
              style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),),
            ),
            const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.ubuntu(
                    ),
                    hintText: 'Harga Layanan',
                    hintStyle: GoogleFonts.ubuntu(
                      color: Colors.black
                    ),
                    border: const OutlineInputBorder(), 
                  ),
                ),
              ),
          ],
        )),
    );
  }
}
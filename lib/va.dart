import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/menunggu_bayar.dart';

class VirtualAccountView extends StatelessWidget {
  const VirtualAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Virtual Account',
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
              // width: 600,
                alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,                                      
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,                      
                      children: [
                        Text('Total Pembayaran',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,)
                        ),
                        const SizedBox(width: 150,),
                        Text('Rp. 52.000',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.mainColor)
                        ),
                      ],),
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bayar Dalam',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,)
                        ),

                        const SizedBox(width: 185,),
                        Text('Rp. 23:56:10',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.mainColor)
                        ),
                      ],),
                  ],
                  )
              ),    
              const SizedBox(height: 10,),
              Container(           
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,                                      
                  ),
                  child: Column(
                    children: [
                      Text('No. Rek/Virtua Account',
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,                            )
                        ),
                        Text('No. Rek/Virtua Account',
                          style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.mainColor)
                        ),
                        const Divider(
                        thickness: 1.0,
                      ),
                      Text('Proses Verifikasi Kurang dari 10 Menit Setelah Pembayaran Berhasil',
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,                            
                            color: Colors.green)
                        ),
                        Text('Bayar Konsultasi ke Virtual Account diatas ',
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,                            
                            //color: Colors.green
                            )
                        ),
                    ],
                  ),
              ),
              Container(
                    width: double.infinity,
                    height: 52,
                    margin: const EdgeInsets.only(left: 26, right: 26, bottom: 20, top: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: () {
                        Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const MenungguBayarView()));
                      },
                      child: Text('Ok',
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
    );
  }
}
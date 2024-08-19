import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/isi_pesan.dart';

class PesanView extends StatelessWidget {
  const PesanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text('Pesan',
        style: GoogleFonts.ubuntu(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const IsiPesanView()));
                },
                child: ListTile(
                        //user profile picture
                        leading: InkWell(
                          onTap: () {
                            // showDialog(
                                // context: context,
                                // builder: (_) => ProfileDialog(user: widget.user));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset('assets/images/Nur.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,),                              
                          ),
                        ),
        
                        //user name
                        title: const Text('Nurmiati',),
        
                        //last message
                        subtitle: const Text('Hello!',                            
                            maxLines: 1),
                        trailing: const Text('12.00'),
                              // Text('12.00',
                              //       style: const TextStyle(color: Colors.black54),
                              //     ),
                      )
              )
            )
          ]
        )
      )
    );
                      }
           
              // Image.asset('assets/images/Pesan.png',
              // width: 250,
              // height: 200,),
              // Text('Belum ada Pesan Masuk',
              // style: GoogleFonts.ubuntu(
              //   fontSize: 20,
              //   fontWeight: FontWeight.bold
              // ),),
              // Text('Belum ada Pesan yang masuk mengenai Advokat, Notaris dan PPAT',
              // style: GoogleFonts.ubuntu(
              //   fontSize: 14,
              //   fontWeight: FontWeight.w500,
              //   color: GlobalColors.textColor
              // ),

  }

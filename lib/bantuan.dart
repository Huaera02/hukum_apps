import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class BantuanView extends StatelessWidget {
  const BantuanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Bantuan',
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
            width: 500,
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.phone,
                          color: GlobalColors.mainColor,
                          size: 20,
                        ),
                        label: Text('Call Center',
                            style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text('12345',
                          style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              color: Colors.black)),
                    )
                  ],
                ),
                Divider(thickness: 1.0, color: Colors.grey.shade400),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.email,
                          color: GlobalColors.mainColor,
                          size: 20,
                        ),
                        label: Text('Email',
                            style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text('HukumOnline@gmail.com',
                          style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              color: Colors.black)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

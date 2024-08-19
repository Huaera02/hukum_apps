import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/va.dart';
import 'package:loginn/pilih_metode_pembayaran.dart';
// import 'package:loginn/sambungkan_ewalet.dart';

class PembayaranView extends StatefulWidget {
  const PembayaranView({super.key});

  @override
  State<PembayaranView> createState() => _PembayaranViewState();
}

class _PembayaranViewState extends State<PembayaranView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Checkout Pesanan',
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
              // margin: const EdgeInsets.only( top: 10),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 6,
                  ),
                ]
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: GlobalColors.mainColor,),
                    const SizedBox(width: 5,),
                    Text('Informasi User',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Zhafira',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('Zhafira@gmail.com',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('0812 3456 7890',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kasus:',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,)),
                          Row(
                            children: [
                              Text('Pidana ',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100,)),
                              const SizedBox(width: 3,),
                              Text('-',
                                style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,)),
                                const SizedBox(width: 3,),
                              Text('Pembunuhan',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100,)),
                            ],
                          ),      
                      ],
                    )
                  ],
                )              
              ],
              )
          ),    

          Container(
            // width: 600,
            alignment: Alignment.topLeft,
              margin: const EdgeInsets.only( top: 10),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 6,
                  ),
                ]
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.groups_3_rounded, color: GlobalColors.mainColor,),
                    const SizedBox(width: 5,),
                    Text('Informasi Advokat',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Nurmiati, S.H',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('Nurmiati@gmail.com',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('jl. MawarMelati No.6 ',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                // Text('Perceraian',
                // style: GoogleFonts.ubuntu(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w500,))              
              ],
              )
          ), 
          Container(
            alignment: Alignment.topLeft,
              margin: const EdgeInsets.only( top: 10),
              padding: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                color: Colors.white,                
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 6,
                  ),
                ]
              ),
              child: Row(
                children: [
                  Icon(Icons.monetization_on, 
                  color: GlobalColors.mainColor,),
                  const SizedBox(width: 5,),
                  Text('Metode Pembayaran',
                  style: GoogleFonts.ubuntu(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(width: 145,),
                IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MetodePembayaranView()),
                      );
                  }, 
                  icon: const Icon(Icons.arrow_forward_ios_outlined))
                ],
              ),
          ),

          Container(
            alignment: Alignment.topLeft,
              margin: const EdgeInsets.only( top: 10),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,                
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 6,
                  ),
                ]
              ),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.list_alt_sharp, 
                    color: GlobalColors.mainColor,),
                    const SizedBox(width: 5),
                    Text('Rincian Pembayaran',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal untuk Sesi Chat 30 Menit x1',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                    Text('Rp. 50.000',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                  ],
                ),
                // Text('Nurmiati (Advokat)',
                //     style: GoogleFonts.ubuntu(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w300,
                //     ),
                //     ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Diskon',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                    Text('-Rp. 0',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya Admin',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                    Text('Rp. 2.000',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Pembayaran',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    Text('Rp. 52.000',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  ],
                )
              ],
             ),
          ),
          // Container(
          //   alignment: Alignment.topLeft,
          //     margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          //     padding: const EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Colors.black38,
          //           blurRadius: 6,
          //         ),
          //       ]
          //     ),
          //     child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('Detail Pesanan',
          //       style: GoogleFonts.ubuntu(
          //         fontSize: 14,
          //         fontWeight: FontWeight.bold,
          //       ),),
          //       const SizedBox(height: 10,),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text('Biaya Sesi 30 Menit',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //           ),
          //           ),
          //           Text('Rp. 50.000',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //           ),
          //           ),
          //         ],
          //       ),
          //       Text('Nurmiati (Advokat)',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //           ),
          //           ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text('Biaya Admin',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //           ),
          //           ),
          //           Text('Rp. 2.000',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //           ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text('Total',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //           ),
          //           ),
          //           Text('Rp. 52.000',
          //           style: GoogleFonts.ubuntu(
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //           ),
          //           ),
          //         ],
          //       )
          //     ],
          //     )
          // ),
          
          const SizedBox(height: 135),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Rp. 52.000',
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100, 
                  height: 52, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VirtualAccountView()),
                      );
                    },
                    child: Text(
                      'Buat',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.btnColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

                
      ],)),
    );
  }
}
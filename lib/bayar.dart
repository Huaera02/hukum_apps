import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/sambungkan_ewalet.dart';

class PembayaranView extends StatefulWidget {
  const PembayaranView({super.key});

  @override
  State<PembayaranView> createState() => _PembayaranViewState();
}

class _PembayaranViewState extends State<PembayaranView> {
  int _selectedValue = 0;
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
          child: ListView(
          children: [
            // Container(
            //        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //        padding: const EdgeInsets.all(10),
            //        decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10),
            //           boxShadow: const [
            //            BoxShadow(
            //              color: Colors.black38,
            //              blurRadius: 6,
            //            ),
            //           ]
            //        ),
            //        child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Image.asset('assets/images/Nur.png',
            //             width: 50,
            //             height: 50,),

            //             const SizedBox(width: 10,),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('Nurmiati, S.H',
            //                 style: GoogleFonts.ubuntu(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.bold,
            //                 ),),

            //                 const SizedBox(height: 2,),
            //                 Text('Advokat',
            //                 style: GoogleFonts.ubuntu(
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w300,
            //                 ),),
            //               ],
            //             )
                        
            //             ],
            //           ),
            //     ),

                Container(
                  alignment: Alignment.topLeft,
                   margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Detail Pesanan',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Biaya Sesi 30 Menit',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                          Text('Rp. 50.000',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                        ],
                      ),
                      Text('Nurmiati (Advokat)',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Biaya Admin',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                          Text('Rp. 2.000',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text('Rp. 52.000',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ],
                      )
                    ],
                   )
                ),

                Container(
                  alignment: Alignment.topLeft,
                   margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pilih Metode Pembayaran',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),),
                      const SizedBox(height: 5,),
                      RadioListTile(
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as int;
                        });
                      },
                      title: Row(
                        children: [
                          Image.asset('assets/images/gopay.png', width: 30, height: 30), 
                          const SizedBox(width: 2),
                          Text('Gopay',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ), 
                          )
                        ],
                      ),
                      subtitle: Text('sambungkan dengan gopay',
                      style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                      ),
                    ),
                      ),

                      RadioListTile(
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as int;
                        });
                      },
                      title: Row(
                        children: [
                          Image.asset('assets/images/ovo.png', width: 30, height: 30), 
                          const SizedBox(width: 2),
                          Text('Ovo',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ), 
                          )
                        ],
                      ),
                      subtitle: Text('sambungkan dengan Ovo',
                      style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                      ),
                    ),
                      ),

                      RadioListTile(
                      value: 3,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as int;
                        });
                      },
                      title: Row(
                        children: [
                          Image.asset('assets/images/LinkAja.png', width: 30, height: 30), 
                          const SizedBox(width: 2),
                          Text('LinkAja',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ), 
                          )
                        ],
                      ),
                      subtitle: Text('sambungkan dengan LinkAja',
                      style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                      ),
                    ),
                      ),
                    ],
                   ),
                ),

                const SizedBox(height: 211,),
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
                              MaterialPageRoute(builder: (context) => const SambungEwalatView()),
                            );
                          },
                          child: Text(
                            'Bayar',
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
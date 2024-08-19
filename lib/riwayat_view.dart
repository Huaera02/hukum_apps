import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/bayar.dart';
import 'package:loginn/detail_pesanan.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/va.dart';


class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Index Konsultasi',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.black,
              indicatorColor: GlobalColors.mainColor,
              labelColor: GlobalColors.mainColor, 
              tabs: [
                Tab(
                  child: Text(
                    'Sedang Berlangsung',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Riwayat Konsultasi',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for the first tab
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20 ),
                   child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const DetailPesananView()));
                        },
                        splashColor: GlobalColors.btnColor,
                        child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Chat 30 Menit', 
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                  ),),
                                  Text('Lunas', 
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  const Icon(Icons.watch_later_outlined, size: 15,),
                                  const SizedBox(width: 10,),
                                  Text('Rabu, 20 Juni 2024', 
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14
                                  ),),
                                  const SizedBox(width: 10,),
                                  Text('8:00 - 8:30 AM', 
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14
                                  ),),
                                ],
                              ),
                              Divider(
                              thickness:1.0,
                              color: Colors.grey.shade400 ), 
                              Row(
                                children: [
                                  Image.asset('assets/images/Nur.png',
                                    width: 50,
                                    height: 70,),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Nurmiati, S.H',
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),),
                                      Text('Advokat',
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14,
                                      ),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text('Pidana',
                                          style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),),
                                          const SizedBox(width: 3,),
                                          Text('-',
                                            style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,)),
                                            const SizedBox(width: 3,),
                                          Text('Pembunuhan',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const DetailPesananView()));
                        },
                        splashColor: GlobalColors.btnColor,
                        child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Chat 30 Menit', 
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                  ),),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const VirtualAccountView()));
                                    }, 
                                    child: Text('Belum Lunas', 
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold
                                  ),),)
                                  // Text('Lunas', 
                                  // style: GoogleFonts.ubuntu(
                                  //   fontSize: 14,
                                  //   color: Colors.green,
                                  //   fontWeight: FontWeight.bold
                                  // ),),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  const Icon(Icons.watch_later_outlined, size: 15,),
                                  const SizedBox(width: 10,),
                                  Text('Rabu, 20 Juni 2024', 
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14
                                  ),),
                                  const SizedBox(width: 10,),
                                  Text('8:00 - 8:30 AM', 
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14
                                  ),),
                                ],
                              ),
                              Divider(
                              thickness:1.0,
                              color: Colors.grey.shade400 ), 
                              Row(
                                children: [
                                  Image.asset('assets/images/Nur.png',
                                    width: 50,
                                    height: 70,),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Nurmiati, S.H',
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),),
                                      Text('Advokat',
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14,
                                      ),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text('Pidana',
                                          style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),),
                                          const SizedBox(width: 3,),
                                          Text('-',
                                            style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,)),
                                            const SizedBox(width: 3,),
                                          Text('Pembunuhan',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                   )
                  ),
                  // Content for the second tab
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20 ),
                   child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, 
                          // MaterialPageRoute(builder: (context) => const DetailPesananView()));
                        },
                        splashColor: GlobalColors.btnColor,
                        child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chat 30 Menit', 
                              style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.w300
                              ),),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  const Icon(Icons.watch_later_outlined, size: 15,),
                                  const SizedBox(width: 10,),
                                  Text('Rabu, 20 Juni 2024', 
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14
                                  ),),
                                  const SizedBox(width: 10,),
                                  Text('8:00 - 8:30 AM', 
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14
                                  ),),
                                ],
                              ),
                              Divider(
                              thickness:1.0,
                              color: Colors.grey.shade400 ), 
                              Row(
                                children: [
                                  Image.asset('assets/images/Nur.png',
                                    width: 50,
                                    height: 70,),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Nurmiati, S.H',
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),),
                                      Text('Advokat',
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14,
                                      ),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text('Pidana',
                                          style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),),
                                          const SizedBox(width: 3,),
                                          Text('-',
                                            style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,)),
                                            const SizedBox(width: 3,),
                                          Text('Pembunuhan',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                      // InkWell(
                      //   onTap: (){
                      //     // Navigator.push(context, 
                      //     // MaterialPageRoute(builder: (context) => const DetailPesananView()));
                      //   },
                      //   splashColor: GlobalColors.btnColor,
                      //   child: Container(
                      //   padding: const EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10),
                      //       boxShadow: const [
                      //         BoxShadow(
                      //           color: Colors.black38,
                      //           blurRadius: 6,
                      //         )
                      //       ]
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text('Appoitmen Date', 
                      //         style: GoogleFonts.ubuntu(
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w300
                      //         ),),                              
                      //         const SizedBox(height: 5,),
                      //         Row(
                      //           children: [
                      //             const Icon(Icons.watch_later_outlined, size: 15,),
                      //             const SizedBox(width: 10,),
                      //             Text('Rabu, 20 Juni 2024', 
                      //             style: GoogleFonts.ubuntu(
                      //               fontWeight: FontWeight.normal,
                      //               fontSize: 14
                      //             ),),
                      //             const SizedBox(width: 10,),
                      //             Text('8:00 - 8:30 AM', 
                      //             style: GoogleFonts.ubuntu(
                      //               fontWeight: FontWeight.normal,
                      //               fontSize: 14
                      //             ),),
                      //           ],
                      //         ),
                      //         Divider(
                      //         thickness:1.0,
                      //         color: Colors.grey.shade400 ), 
                      //         Row(
                      //           children: [
                      //             Image.asset('assets/images/Nur.png',
                      //               width: 50,
                      //               height: 70,),
                      //             const SizedBox(width: 10,),
                      //             Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text('Nurmiati, S.H',
                      //                 style: GoogleFonts.ubuntu(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 16,
                      //                 ),),
                      //                 Text('Advokat',
                      //                 style: GoogleFonts.ubuntu(
                      //                   fontWeight: FontWeight.w100,
                      //                   fontSize: 14,
                      //                 ),),
                      //                 const SizedBox(height: 10,),
                      //                 Text('52.000',
                      //                 style: GoogleFonts.ubuntu(
                      //                   fontWeight: FontWeight.w500,
                      //                   fontSize: 16,
                      //                 ),),
                      //               ],
                      //             ),
                      //           ],
                      //         )
                      //       ],
                      //     )
                      //   ),
                      // ),
                    ],
                   )
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 20, top: 20, right: 20 ),
                  //  child: Column(
                  //   children: [
                  //     InkWell(
                  //       onTap: (){
                  //         // Navigator.push(context, 
                  //         // MaterialPageRoute(builder: (context) => const ProfileAdvokat1View()));
                  //       },
                  //       splashColor: GlobalColors.btnColor,
                  //       child: Container(
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(10),
                  //           boxShadow: const [
                  //             BoxShadow(
                  //               color: Colors.black38,
                  //               blurRadius: 6,
                  //             )
                  //           ]
                  //         ),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text('Appoitmen Date', 
                  //             style: GoogleFonts.ubuntu(
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w300
                  //             ),),
                  //             const SizedBox(height: 5,),
                  //             Row(
                  //               children: [
                  //                 const Icon(Icons.watch_later_outlined, size: 15,),
                  //                 const SizedBox(width: 10,),
                  //                 Text('Wed Jun 20', 
                  //                 style: GoogleFonts.ubuntu(
                  //                   fontWeight: FontWeight.normal,
                  //                   fontSize: 14
                  //                 ),),
                  //                 const SizedBox(width: 10,),
                  //                 Text('8:00 - 8:30 AM', 
                  //                 style: GoogleFonts.ubuntu(
                  //                   fontWeight: FontWeight.normal,
                  //                   fontSize: 14
                  //                 ),),
                  //               ],
                  //             ),
                  //             Divider(
                  //             thickness:1.0,
                  //             color: Colors.grey.shade400 ), 
                  //             Image.asset('assets/images/Nur.png',
                  //               width: 50,
                  //               height: 70,),
                  //             const SizedBox(width: 10,),
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text('Nurmiati, S.H',
                  //                 style: GoogleFonts.ubuntu(
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 16,
                  //                 ),),
                  //                 Text('Advokat',
                  //                 style: GoogleFonts.ubuntu(
                  //                   fontWeight: FontWeight.w100,
                  //                   fontSize: 14,
                  //                 ),),
                  //                 const SizedBox(height: 10,),
                  //                 Text('50.000',
                  //                 style: GoogleFonts.ubuntu(
                  //                   fontWeight: FontWeight.w500,
                  //                   fontSize: 16,
                  //                 ),),
                  //               ],
                  //             ),
                  //             // const SizedBox(width: 66,),
                  //             // ElevatedButton(
                  //             //   onPressed: () {},
                  //             //     style: ElevatedButton.styleFrom(
                  //             //       backgroundColor: GlobalColors.mainColor,
                  //             //       fixedSize: const Size(94, 20), 
                  //             //       shape: const RoundedRectangleBorder(
                  //             //         borderRadius: BorderRadius.all(Radius.circular(5)), 
                  //             //       ),
                  //             //     ),
                  //             //     child: Text('Selesai',
                  //             //     style: GoogleFonts.ubuntu(
                  //             //       fontSize: 14,
                  //             //       fontWeight: FontWeight.w300,
                  //             //       color: Colors.white
                  //             //     ),),
                  //             //   )
                  //           ],
                  //         )
                  //       ),
                  //     ),
                  //   ],
                  //  )
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
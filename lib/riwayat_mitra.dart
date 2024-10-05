import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/bottomnav.dart';
import 'package:loginn/detail_pesananuser.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';

class RiwayatMitraView extends StatefulWidget {
  const RiwayatMitraView({super.key});

  @override
  State<RiwayatMitraView> createState() => _RiwayatMitraViewState();
}

class _RiwayatMitraViewState extends State<RiwayatMitraView> {
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> indexKonsultasi = [];
  List<Map<String, dynamic>> listRiwayat = [];

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.riwayatTransaksiMitra();
    // getRiwayatTransaksiMitra();

    isLoading = false;

    if (response['status'] == true) {  
      indexKonsultasi = List<Map<String, dynamic>>.from(response['riwayat'])
          .where((element) => element['status'] == '0')
          .toList();
      listRiwayat = List<Map<String, dynamic>>.from(response['riwayat'])
          .where((element) => element['status'] == '1')
          .toList();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  response['msg'],
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Daftar Transaksi',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const BottomNavView(                         
          //                 )));
          //   },
          // ),
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
                    'Riwayat Transaksi',
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
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: indexKonsultasi.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPesananUserView(
                                                      idPenjualan:
                                                          indexKonsultasi[index]
                                                              ['id'],
                                                    )));
                                      },
                                      splashColor: GlobalColors.btnColor,
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black38,
                                                  blurRadius: 6,
                                                )
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        indexKonsultasi[index]
                                                            ['produk_nama']??'',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                      ),
                                                      // const SizedBox(width: 3,),
                                                      // Text(
                                                      //   '${indexKonsultasi[index]['durasi']} Menit',
                                                      //   style: GoogleFonts.ubuntu(
                                                      //       fontSize: 14,
                                                      //       fontWeight:
                                                      //           FontWeight.w300),
                                                      // ),
                                                    ],
                                                  ),
                                                  Text(
                                                    indexKonsultasi[index][
                                                                'status_bayar'] ==
                                                            '1'
                                                        ? 'Lunas'
                                                        : 'Belum Lunas',
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      color: indexKonsultasi[
                                                                      index][
                                                                  'status_bayar'] ==
                                                              '1'
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.watch_later_outlined,
                                                    size: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    indexKonsultasi[index]
                                                        ['tanggal']??'',
                                                    // 'Rabu, 20 Juni 2024',
                                                    style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  // Text(
                                                  //   '8:00 - 8:30 AM',
                                                  //   style: GoogleFonts.ubuntu(
                                                  //       fontWeight: FontWeight.normal,
                                                  //       fontSize: 14),
                                                  // ),
                                                ],
                                              ),
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors.grey.shade400),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/profile 1.png',
                                                    width: 50,
                                                    height: 70,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          indexKonsultasi[index]
                                                              [
                                                              'master_kontak_nama']?? '',
                                                          // 'Nurmiati, S.H',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          indexKonsultasi[index]
                                                              [
                                                              'master_kontak_tipe_kontak_nama']??'',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                  '${indexKonsultasi[index]['ref_klasifikasi_pidana_nama'] ?? ''}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .ubuntu(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                            // const SizedBox(
                                                            //   width: 3,
                                                            // ),
                                                            // Text(
                                                            //   '-',
                                                            //     style:
                                                            //         GoogleFonts
                                                            //             .ubuntu(
                                                            //       fontSize:
                                                            //           14,
                                                            //       fontWeight:
                                                            //           FontWeight
                                                            //               .w500,
                                                            //     )),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                                indexKonsultasi[
                                                                            index]
                                                                        [
                                                                        'judul'] ??
                                                                    '',
                                                                // indexKonsultasi[
                                                                //         index]
                                                                //     [
                                                                //     'produk_nama'],
                                                                style:
                                                                    GoogleFonts
                                                                        .ubuntu(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                      Visibility(
                        visible: isLoading,
                        child: const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Content for the second tab

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listRiwayat.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(
                                left: 20, top: 10, right: 20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DetailPesananUserView(
                                    //               idPenjualan:
                                    //                   listRiwayat[index]
                                    //                       ['id'],
                                    //             )));
                                  },
                                  splashColor: GlobalColors.btnColor,
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 6,
                                            )
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    listRiwayat[index]
                                                        ['produk_nama'] ?? '',
                                                    style: GoogleFonts.ubuntu(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),                                              
                                                ],
                                              ),                                            
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.watch_later_outlined,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                listRiwayat[index]
                                                    ['tanggal']??'',
                                                // 'Rabu, 20 Juni 2024',
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),                
                                            ],
                                          ),
                                          Divider(
                                              thickness: 1.0,
                                              color: Colors.grey.shade400),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/profile 1.png',
                                                width: 50,
                                                height: 70,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listRiwayat[index][
                                                          'master_kontak_nama']??'',
                                                      // 'Nurmiati, S.H',
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      listRiwayat[index][
                                                          'master_kontak_tipe_kontak_nama']??'',
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              '${listRiwayat[index]['ref_klasifikasi_pidana_nama'] ?? ''}',
                                                              style: GoogleFonts
                                                                  .ubuntu(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                        // const SizedBox(
                                                        //   width: 3,
                                                        // ),
                                                        // Text(
                                                        //   '-',
                                                        //     style:
                                                        //         GoogleFonts
                                                        //             .ubuntu(
                                                        //       fontSize:
                                                        //           14,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .w500,
                                                        //     )),
                                                        const SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                            listRiwayat[
                                                                        index]
                                                                    ['judul'] ??
                                                                '',
                                                            // listRiwayat[
                                                            //         index]
                                                            //     [
                                                            //     'produk_nama'],
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 10),
                  //   child: ListView.builder(
                  //       itemCount: indexKonsultasi.length,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //             margin: const EdgeInsets.only(
                  //                 left: 20, top: 10, right: 20),
                  //             child: Column(
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () {
                  //                     // Navigator.push(context,
                  //                     // MaterialPageRoute(builder: (context) => const DetailPesananView()));
                  //                   },
                  //                   splashColor: GlobalColors.btnColor,
                  //                   child: Container(
                  //                       padding: const EdgeInsets.all(10),
                  //                       decoration: BoxDecoration(
                  //                           color: Colors.white,
                  //                           borderRadius:
                  //                               BorderRadius.circular(10),
                  //                           boxShadow: const [
                  //                             BoxShadow(
                  //                               color: Colors.black38,
                  //                               blurRadius: 6,
                  //                             )
                  //                           ]),
                  //                       child: Column(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Row(
                  //                             children: [
                  //                               Text(
                  //                                 indexKonsultasi[index]
                  //                                     ['produk_nama'],
                  //                                 // 'Chat 30 Menit',
                  //                                 style: GoogleFonts.ubuntu(
                  //                                     fontSize: 14,
                  //                                     fontWeight:
                  //                                         FontWeight.w300),
                  //                               ),
                  //                               // const SizedBox(width: 3,),
                  //                               // Text(
                  //                               //   '${indexKonsultasi[index]['durasi']} Menit',
                  //                               //   style: GoogleFonts.ubuntu(
                  //                               //       fontSize: 14,
                  //                               //       fontWeight:
                  //                               //           FontWeight.w300),
                  //                               // ),
                  //                             ],
                  //                           ),
                  //                           const SizedBox(
                  //                             height: 5,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               const Icon(
                  //                                 Icons.watch_later_outlined,
                  //                                 size: 15,
                  //                               ),
                  //                               const SizedBox(
                  //                                 width: 10,
                  //                               ),
                  //                               Text(
                  //                                 indexKonsultasi[index]
                  //                                     ['tanggal'],
                  //                                 // 'Rabu, 20 Juni 2024',
                  //                                 style: GoogleFonts.ubuntu(
                  //                                     fontWeight:
                  //                                         FontWeight.normal,
                  //                                     fontSize: 14),
                  //                               ),
                  //                               const SizedBox(
                  //                                 width: 10,
                  //                               ),
                  //                               // Text(
                  //                               //   '8:00 - 8:30 AM',
                  //                               //   style: GoogleFonts.ubuntu(
                  //                               //       fontWeight: FontWeight.normal,
                  //                               //       fontSize: 14),
                  //                               // ),
                  //                             ],
                  //                           ),
                  //                           Divider(
                  //                               thickness: 1.0,
                  //                               color: Colors.grey.shade400),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 'assets/images/profile 1.png',
                  //                                 width: 50,
                  //                                 height: 70,
                  //                               ),
                  //                               const SizedBox(
                  //                                 width: 10,
                  //                               ),
                  //                               Column(
                  //                                 mainAxisAlignment:
                  //                                     MainAxisAlignment.start,
                  //                                 crossAxisAlignment:
                  //                                     CrossAxisAlignment.start,
                  //                                 children: [
                  //                                   Text(
                  //                                     indexKonsultasi[index]
                  //                                         ['master_kontak_nama'],
                  //                                     // 'Nurmiati, S.H',
                  //                                     style: GoogleFonts.ubuntu(
                  //                                       fontWeight:
                  //                                           FontWeight.bold,
                  //                                       fontSize: 16,
                  //                                     ),
                  //                                   ),
                  //                                   Text(
                  //                                     indexKonsultasi[index][
                  //                                         'master_kontak_tipe_kontak_nama'],
                  //                                     // 'Advokat',
                  //                                     style: GoogleFonts.ubuntu(
                  //                                       fontWeight:
                  //                                           FontWeight.w100,
                  //                                       fontSize: 14,
                  //                                     ),
                  //                                   ),
                  //                                   const SizedBox(
                  //                                     height: 10,
                  //                                   ),
                  //                                   Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     children: [
                  //                                       Text(
                  //                                           '${indexKonsultasi[index]['ref_klasifikasi_pidana_nama'] ?? ''} - ',
                  //                                           // 'Pidana',
                  //                                           style: GoogleFonts
                  //                                               .ubuntu(
                  //                                             fontWeight:
                  //                                                 FontWeight.w500,
                  //                                             fontSize: 12,
                  //                                           ),
                  //                                           maxLines: 2,
                  //                                           overflow: TextOverflow
                  //                                               .ellipsis),
                  //                                       // const SizedBox(
                  //                                       //   width: 3,
                  //                                       // ),
                  //                                       // Text('-',
                  //                                       //     style: GoogleFonts
                  //                                       //         .ubuntu(
                  //                                       //       fontSize: 14,
                  //                                       //       fontWeight:
                  //                                       //           FontWeight.w500,
                  //                                       //     )),
                  //                                       // const SizedBox(
                  //                                       //   width: 3,
                  //                                       // ),
                  //                                       Text(
                  //                                           indexKonsultasi[index]
                  //                                                   ['judul'] ??
                  //                                               '',
                  //                                           // indexKonsultasi[index]['produk_nama'],
                  //                                           // 'Pembunuhan',
                  //                                           style: GoogleFonts
                  //                                               .ubuntu(
                  //                                             fontSize: 12,
                  //                                             fontWeight:
                  //                                                 FontWeight.w500,
                  //                                           ),
                  //                                           maxLines: 2,
                  //                                           overflow: TextOverflow
                  //                                               .ellipsis),
                  //                                     ],
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ],
                  //                           )
                  //                         ],
                  //                       )),
                  //                 ),
                  //               ],
                  //             ));
                  //       }),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

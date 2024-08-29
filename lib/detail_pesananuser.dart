import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';

class DetailPesananUserView extends StatefulWidget {
  final String idPenjualan;
  const DetailPesananUserView({super.key, required this.idPenjualan});

  @override
  State<DetailPesananUserView> createState() => _DetailPesananUserViewState();
}

class _DetailPesananUserViewState extends State<DetailPesananUserView> {
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listRincian = [];
  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.getRincianMitra(idPenjualan: widget.idPenjualan);

    isLoading = false;

    if (response['status'] == true) {
      listRincian = List<Map<String, dynamic>>.from(response['rincian']);
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
              'Detail Konsultasi',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(children: [
              TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: GlobalColors.mainColor,
                labelColor: GlobalColors.mainColor,
                tabs: [
                  Tab(
                    child: Text(
                      'Rincian Konsultasi',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        // color: Colors.white
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Chat',
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
                      Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: listRincian.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, top: 10, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: 500,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Detail Konsultasi',
                                                style: GoogleFonts.ubuntu(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/profile 1.png',
                                                  width: 50,
                                                  height: 70,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        listRincian.first[
                                                            'master_kontak_nama'],
                                                        // listRincian.first[''] 'Nurmiati, S.H',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        )),
                                                    Text(
                                                        listRincian.first[
                                                            'master_kontak_tipe_kontak_nama'],
                                                        // 'Advokat',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 14,
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Divider(
                                                thickness: 1.0,
                                                color: Colors.grey.shade400),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.date_range_outlined,
                                                  color: GlobalColors.mainColor,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Tanggal',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        )),
                                                    Text(
                                                        listRincian
                                                            .first['tanggal'],
                                                        // 'Senin, 20 Jun 2022',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 14,
                                                        )),
                                                    // Text('08:00 AM',
                                                    // style: GoogleFonts.ubuntu(
                                                    //   fontWeight: FontWeight.w100,
                                                    //   fontSize: 14,)
                                                    // )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Divider(
                                                thickness: 1.0,
                                                color: Colors.grey.shade400),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.chat_outlined,
                                                  color: GlobalColors.mainColor,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Tipe Layanan',
                                                    style: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    )),
                                                // Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.start,
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                // children: [
                                                //   Text('Tipe Layanan',
                                                //       style:
                                                //           GoogleFonts.ubuntu(
                                                //         fontWeight:
                                                //             FontWeight.bold,
                                                //         fontSize: 14,
                                                //       )),
                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //   // crossAxisAlignment: CrossAxisAlignment.start,
                                                //   children: [
                                                //     Text(
                                                //         listRincian.first[
                                                //             'produk_nama'],
                                                //         // 'Chat / 30 Menit x1',
                                                //         style: GoogleFonts.ubuntu(
                                                //           fontWeight: FontWeight.w100,
                                                //           fontSize: 14,
                                                //         )),
                                                //     // const SizedBox(
                                                //     //   width: 130,
                                                //     // ),
                                                //     Text(
                                                //         'Rp. ${listRincian.first['produk_harga_jual']}',
                                                //         // 'Rp.52.000',
                                                //         style: GoogleFonts.ubuntu(
                                                //           fontWeight: FontWeight.w500,
                                                //           fontSize: 14,
                                                //         )),
                                                //   ],
                                                // ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      listRincian
                                                          .first['produk_nama'],
                                                      // 'Chat / 30 Menit x1',
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 14,
                                                      )),
                                                  // const SizedBox(
                                                  //   width: 130,
                                                  // ),
                                                  Text(
                                                      'Rp. ${listRincian.first['produk_harga_jual']}',
                                                      // 'Rp.52.000',
                                                      style: GoogleFonts.ubuntu(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            if (listRincian.first[
                                                    'ref_klasifikasi_pidana_nama'] !=
                                                null)
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors.grey.shade400),
                                            if (listRincian.first[
                                                    'ref_klasifikasi_pidana_nama'] !=
                                                null)
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            if (listRincian.first[
                                                    'ref_klasifikasi_pidana_nama'] !=
                                                null)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.category_outlined,
                                                    color:
                                                        GlobalColors.mainColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Klasifikasi Kasus',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          )),
                                                      Text(
                                                          listRincian.first[
                                                                  'ref_klasifikasi_pidana_nama'] ??
                                                              '',
                                                          // 'Pidana',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontSize: 14,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            if (listRincian.first['judul'] !=
                                                null)
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors.grey.shade400),
                                            if (listRincian.first['judul'] !=
                                                null)
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            if (listRincian.first['judul'] !=
                                                null)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.title,
                                                    color:
                                                        GlobalColors.mainColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Topik/Judul Masalah',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          )),
                                                      Text(
                                                          listRincian.first[
                                                                  'judul'] ??
                                                              '',
                                                          // 'Pembunuhan',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontSize: 14,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            Divider(
                                                thickness: 1.0,
                                                color: Colors.grey.shade400),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.description_outlined,
                                                  color: GlobalColors.mainColor,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Deskripsi Masalah',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          )),
                                                      Text(
                                                        listRincian
                                                            .first['deskripsi'],
                                                        // 'Selamat pagi, Pak/Bu Advokat. Saya sangat\nmembutuhkan bantuan Anda karena saya\nsedang mengalami masalah rumah tangga yang\ncukup rumit. Saya sudah menikah dengan suami\nsaya selama 10 tahun, dan selama lima tahun\nterakhir, pernikahan kami rasanya semakin\nmemburuk. Awalnya, kami selalu bisa\nberkomunikasi dengan baik, tapi sekarang kami\nhampir tidak pernah berbicara tanpa bertengkar.',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontSize: 12.5,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ],
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
                  //     Container(
                  //   margin: const EdgeInsets.only(left: 20, top: 10, right: 20 ),
                  //   child: ListView(
                  //     children: [
                  //     Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         // Row(
                  //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //   children: [
                  //         //     Text('Info Transaksi',
                  //         //     style: GoogleFonts.ubuntu(
                  //         //       fontWeight: FontWeight.bold,
                  //         //       fontSize: 16,
                  //         //     ),),
                  //         //     Text('Berhasil',
                  //         //     style: GoogleFonts.ubuntu(
                  //         //       fontWeight: FontWeight.bold,
                  //         //       fontSize: 16,
                  //         //       color: Colors.green.shade400
                  //         //     ),),
                  //         //   ],
                  //         // ),
                  //         // const SizedBox(height: 10,),
                  //         Container(
                  //           padding: const EdgeInsets.all(10),
                  //           width: 500,
                  //           decoration: BoxDecoration(
                  //             color: Colors.grey.shade100,
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text('Detail Konsultasi',
                  //               style: GoogleFonts.ubuntu(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 16,)
                  //               ),
                  //               const SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   Image.asset('assets/images/profile 1.png',
                  //                     width: 50,
                  //                     height: 70,),
                  //                   const SizedBox(width: 10,),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text('Zhafira',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Text('Klien',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.w100,
                  //                         fontSize: 14,)
                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),

                  //               Divider(
                  //                 thickness:1.0,
                  //                 color: Colors.grey.shade400 ),
                  //               const SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Icon(Icons.date_range_outlined, color: GlobalColors.mainColor,),
                  //                   const SizedBox(width: 10,),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text('Tanggal dan Waktu',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Text('Senin, 20 Jun 2022',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.w100,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Text('08:00 AM',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.w100,
                  //                         fontSize: 14,)
                  //                       )
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),

                  //               Divider(
                  //                 thickness:1.0,
                  //                 color: Colors.grey.shade400 ),
                  //               const SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Icon(Icons.chat_outlined, color: GlobalColors.mainColor,),
                  //                   const SizedBox(width: 10,),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text('Tipe Layanan',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Text('Chat / 30 Menit x1',
                  //                           style: GoogleFonts.ubuntu(
                  //                             fontWeight: FontWeight.w100,
                  //                             fontSize: 14,)
                  //                           ),
                  //                           const SizedBox(width: 104,),
                  //                           Text('Rp.52.000',
                  //                               style: GoogleFonts.ubuntu(
                  //                                 fontWeight: FontWeight.w500,
                  //                                 fontSize: 14,)
                  //                               ),
                  //                         ],
                  //                       ),

                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //               Divider(
                  //                 thickness:1.0,
                  //                 color: Colors.grey.shade400 ),
                  //               const SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Icon(Icons.category_outlined, color: GlobalColors.mainColor,),
                  //                   const SizedBox(width: 10,),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text('Kategori Hukum',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Text('Pidana',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.w100,
                  //                         fontSize: 14,)
                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),

                  //               Divider(
                  //                 thickness:1.0,
                  //                 color: Colors.grey.shade400 ),
                  //               const SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Icon(Icons.title, color: GlobalColors.mainColor,),
                  //                   const SizedBox(width: 10,),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text('Topik/Judul Masalah',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Text('Pembunuhan',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.w100,
                  //                         fontSize: 14,)
                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),

                  //               Divider(
                  //                 thickness:1.0,
                  //                 color: Colors.grey.shade400 ),
                  //               const SizedBox(height: 10,),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Icon(Icons.description_outlined, color: GlobalColors.mainColor,),
                  //                   const SizedBox(width: 10,),
                  //                   Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text('Deskripsi Masalah',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 14,)
                  //                       ),
                  //                       Text('Selamat pagi, Pak/Bu Advokat. Saya sangat\nmembutuhkan bantuan Anda karena saya\nsedang mengalami masalah rumah tangga yang\ncukup rumit. Saya sudah menikah dengan suami\nsaya selama 10 tahun, dan selama lima tahun\nterakhir, pernikahan kami rasanya semakin\nmemburuk. Awalnya, kami selalu bisa\nberkomunikasi dengan baik, tapi sekarang kami\nhampir tidak pernah berbicara tanpa bertengkar.',
                  //                       style: GoogleFonts.ubuntu(
                  //                         fontWeight: FontWeight.w100,
                  //                         fontSize: 12.5,),

                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),

                  //         // Padding(
                  //         //   padding: const EdgeInsets.only(top: 20, bottom: 20),
                  //         //   child: Row(
                  //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //     children: [
                  //         //       Text('Total',
                  //         //       style: GoogleFonts.ubuntu(
                  //         //         fontWeight: FontWeight.bold,
                  //         //         fontSize: 16,)
                  //         //       ),
                  //         //       Text('52.000',
                  //         //       style: GoogleFonts.ubuntu(
                  //         //         fontWeight: FontWeight.bold,
                  //         //         fontSize: 16,)
                  //         //       )
                  //         //     ],
                  //         //   ),
                  //         // ),
                  //       ],
                  //     ),
                  //     ]
                  //   ),
                  // ),

                  // Tab Halaman kedua
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/profile 1.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        Text(
                          'Berikan Waktu untuk Menghubungkan dengan',
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Zhafira',
                          style: GoogleFonts.ubuntu(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          'Halo para Advokat, Kami ingin memberitahu bahwa Anda memiliki Permintaan Konsultasi',
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, fontWeight: FontWeight.w100),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text('60 Detik',
                        // style: GoogleFonts.ubuntu(
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.bold,
                        //     color: GlobalColors.mainColor
                        // ),)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalColors.mainColor,
                            fixedSize: const Size(100, 20),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          child: Text(
                            'Terima',
                            style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ]),
          )),
    );
  }
}

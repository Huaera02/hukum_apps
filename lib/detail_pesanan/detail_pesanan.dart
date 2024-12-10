import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginn/chats/api/apis.dart';
import 'package:loginn/menu/bottomnav.dart';
// import 'package:loginn/detail_pesananuser.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/chats/models/message.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/chats/widgets/message_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPesananView extends StatefulWidget {
  final String idPenjualan;
  const DetailPesananView({super.key, required this.idPenjualan});

  @override
  State<DetailPesananView> createState() => _DetailPesananViewState();
}

class _DetailPesananViewState extends State<DetailPesananView> {
  bool isLoading = false;
  Repository repository = Repository();
  final mulaiLayananController = TextEditingController();
  final selesaiLayananController = TextEditingController();
  List<Map<String, dynamic>> listRincian = [];

  bool _isUploading = false;
  final _textController = TextEditingController();

  bool _withChat = true;

  DateTime? _jamSelesai;

  var kontakId;

  //if (_jamSelesai != null && _jamSelesai!.isBefore(DateTime.now())) //if setelah habis waktu selesai
  //if(listRincian.first['mulai_layanan']!=null && DateTime.parse(listRincian.first['mulai_layanan']).isAfter(DateTime.now())) //if sebelum waktu dimulai

  /*
urutan if
  - if klo dia belum ada jam mulainya (utk halaman set waktu mulai)
  - if apakah dia sdh masuk waktu mulai atau belum
  - if klo dia belum ada jam selesainya (utk halaman mulai konsultasi)
  - if waktu sdh habis
   */

  bool lanjut = false;

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      kontakId = pref.getString("id_kontak");
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.getRincianKlien(idPenjualan: widget.idPenjualan);

    isLoading = false;

    if (response['status'] == true) {
      listRincian = List<Map<String, dynamic>>.from(response['rincian']);
      _withChat =
          (listRincian.first['produk_kategori_alias'] ?? '') != 'lainnya';
      if (listRincian.first['selesai_layanan'] != null) {
        _jamSelesai = DateTime.parse(listRincian.first['selesai_layanan']);
        try {
          if (_jamSelesai!.isAfter(DateTime.now())) {
            Future.delayed(
                _jamSelesai!.difference(DateTime.now()), () async {});
          }
        } catch (e) {
          log(e.toString());
        }
      }
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
    final mq = MediaQuery.of(context).size;
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: false,
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
                      if (_withChat)
                        if (listRincian.isNotEmpty &&
                            (listRincian.first['produk_id_kategori'] ?? '') !=
                                '6')
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
                      child: isLoading
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            )
                          : TabBarView(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: listRincian.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                          left: 20, top: 10, right: 20,
                                        ),
                                        child: Container(
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
                                                    fontSize: 16,)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.start,
                                                crossAxisAlignment:CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/Nur.png',
                                                    width: 50, height: 70,
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          listRincian.first['mitra']['nama'],
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            fontWeight:FontWeight.bold,
                                                            fontSize:14,
                                                          )),
                                                      Text(
                                                          listRincian.first['mitra']['tipe_kontak_nama'],                                                          
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            fontWeight:FontWeight.w100,
                                                            fontSize: 14)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors.grey.shade400),
                                              const SizedBox(height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.email,
                                                    color: GlobalColors.mainColor,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Email',
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          )),
                                                      Text(
                                                          listRincian.first['mitra']['email'],                                                                 
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.w100,
                                                            fontSize:14,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors
                                                      .grey.shade400),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Icon(
                                                    Icons.phone_android,
                                                    color: GlobalColors
                                                        .mainColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('No HP',
                                                          style:
                                                              GoogleFonts
                                                                  .ubuntu(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            fontSize:
                                                                14,
                                                          )),
                                                      Text(
                                                          listRincian.first[
                                                                  'mitra']
                                                              ['hp'],
                                                          style:
                                                              GoogleFonts
                                                                  .ubuntu(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100,
                                                            fontSize:
                                                                14,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors
                                                      .grey.shade400),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: GlobalColors
                                                        .mainColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Alamat',
                                                          style:
                                                              GoogleFonts
                                                                  .ubuntu(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            fontSize:
                                                                14,
                                                          )),
                                                      Text(
                                                          listRincian.first[
                                                                  'mitra']
                                                              [
                                                              'alamat'],
                                                          // 'Senin, 20 Jun 2022',
                                                          style:
                                                              GoogleFonts
                                                                  .ubuntu(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100,
                                                            fontSize:
                                                                14,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors
                                                      .grey.shade400),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .date_range_outlined,
                                                    color: GlobalColors
                                                        .mainColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Tanggal',
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          )),
                                                      Text(
                                                          listRincian.first['tanggal'],                                                                
                                                          style:
                                                            GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.w100,
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
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.gavel_rounded,
                                                        color: GlobalColors.mainColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                          'Nama Layanan',
                                                          style:
                                                            GoogleFonts.ubuntu(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(left: 35),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,                                                
                                                      children: [
                                                        Text(
                                                            listRincian.first['produk_nama'],                                                                    
                                                            style: GoogleFonts.ubuntu(
                                                              fontWeight: FontWeight.w100,
                                                              fontSize: 14,
                                                            )),
                                                        Text(
                                                            'Rp. ${listRincian.first['produk_harga_jual']}',                                                                   
                                                            style: GoogleFonts.ubuntu(
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 14,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),                                                  
                                              if (listRincian.first['ref_klasifikasi_pidana_nama'] !=null)
                                                Divider(
                                                    thickness: 1.0,
                                                    color: Colors
                                                        .grey.shade400),
                                              if (listRincian.first['ref_klasifikasi_pidana_nama'] !=null)
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              if (listRincian.first['ref_klasifikasi_pidana_nama'] != null)
                                                Row(
                                                  mainAxisAlignment:MainAxisAlignment.start,
                                                  crossAxisAlignment:CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.category_outlined,
                                                      color: GlobalColors.mainColor,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                            'Klasifikasi Kasus',
                                                            style: GoogleFonts.ubuntu(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14)),
                                                        Text(
                                                            listRincian.first[
                                                                    'ref_klasifikasi_pidana_nama'] ??
                                                                '',
                                                            // 'Pidana',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
                                                              fontSize:
                                                                  14,
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              // if (listRincian
                                              //         .first['judul'] !=
                                              //     null)
                                              //   Divider(
                                              //       thickness: 1.0,
                                              //       color: Colors
                                              //           .grey.shade400),
                                              // if (listRincian
                                              //         .first['judul'] !=
                                              //     null)
                                              //   const SizedBox(
                                              //     height: 10,
                                              //   ),
                                              // if (listRincian
                                              //         .first['judul'] !=
                                              //     null)
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment
                                                //           .start,
                                                //   crossAxisAlignment:
                                                //       CrossAxisAlignment
                                                //           .start,
                                                //   children: [
                                                //     Icon(
                                                //       Icons.title,
                                                //       color: GlobalColors
                                                //           .mainColor,
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 10,
                                                //     ),
                                                //     Expanded(
                                                //       child: Column(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .start,
                                                //         crossAxisAlignment:
                                                //             CrossAxisAlignment
                                                //                 .start,
                                                //         children: [
                                                //           Text(
                                                //               'Topik/Judul Masalah',
                                                //               style: GoogleFonts
                                                //                   .ubuntu(
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold,
                                                //                 fontSize:
                                                //                     14,
                                                //               )),
                                                //           Text(
                                                //               listRincian.first[
                                                //                       'judul'] ??
                                                //                   '',
                                                //               // 'Pembunuhan',
                                                //               style: GoogleFonts
                                                //                   .ubuntu(
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .w100,
                                                //                 fontSize:
                                                //                     14,
                                                //               ),
                                                //               textAlign: TextAlign.left,),
                                                //         ],
                                                //       ),
                                                //     )
                                                //   ],
                                                // ),
                                              Divider(
                                                  thickness: 1.0,
                                                  color: Colors
                                                      .grey.shade400),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .description_outlined,
                                                    color: GlobalColors
                                                        .mainColor,
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
                                                            'Deskripsi Masalah',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  14,
                                                            )),
                                                        Text(
                                                          listRincian
                                                                  .first[
                                                              'deskripsi'],
                                                          // 'Selamat pagi, Pak/Bu Advokat. Saya sangat\nmembutuhkan bantuan Anda karena saya\nsedang mengalami masalah rumah tangga yang\ncukup rumit. Saya sudah menikah dengan suami\nsaya selama 10 tahun, dan selama lima tahun\nterakhir, pernikahan kami rasanya semakin\nmemburuk. Awalnya, kami selalu bisa\nberkomunikasi dengan baik, tapi sekarang kami\nhampir tidak pernah berbicara tanpa bertengkar.',
                                                          style:
                                                              GoogleFonts
                                                                  .ubuntu(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100,
                                                            fontSize:
                                                                12.5,
                                                          ),
                                                          textAlign:
                                                              TextAlign
                                                                  .left,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),

                                // Tab Halaman kedua
                                // if (listRincian.first['judul'] != null)
                                if ((listRincian.first['produk_id_kategori'] ??
                                        '') !=
                                    '6')
                                  RefreshIndicator(
                                      child: (_jamSelesai != null &&
                                              (_jamSelesai!.isBefore(
                                                      DateTime.now()) &&
                                                  !lanjut))
                                          ? Column(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 120),
                                                    child: ListView(
                                                      // crossAxisAlignment:
                                                      // CrossAxisAlignment.center,
                                                      children: [
                                                        Center(
                                                          child: Icon(
                                                            Icons.check_circle,
                                                            size: 160,
                                                            color: GlobalColors
                                                                .mainColor,
                                                          ),
                                                        ),
                                                        // const SizedBox(
                                                        //   height: 50,
                                                        // ),
                                                        Center(
                                                          child: Text('Selesai',
                                                              style: GoogleFonts.ubuntu(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: GlobalColors
                                                                      .mainColor)),
                                                        ),
                                                        const SizedBox(
                                                          height: 50,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            'Konsultasi anda telah berakhir, Silahkan kembali ke Beranda',
                                                            style: GoogleFonts.ubuntu(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: GlobalColors
                                                                    .mainColor),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 52,
                                                  margin: const EdgeInsets.only(
                                                      left: 26,
                                                      right: 26,
                                                      top: 10,
                                                      bottom: 20),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          GlobalColors
                                                              .mainColor,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const BottomNavView()));
                                                    },
                                                    child: Text(
                                                      'Kembali ke Beranda',
                                                      style: GoogleFonts.ubuntu(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: GlobalColors
                                                            .btnColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : (listRincian.first[
                                                      'selesai_layanan'] ==
                                                  null)
                                              ? Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      top: 70),
                                                  child: ListView(
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment
                                                    //         .center,
                                                    children: [
                                                      Center(
                                                        child: Image.asset(
                                                          'assets/images/advokat1.png',
                                                          width: 200,
                                                          height: 200,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          listRincian.first[
                                                              'mitra']['nama'],
                                                          // 'Nurmiati, S.H',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          listRincian.first[
                                                              'produk_nama'],
                                                          // 'Nurmiati, S.H',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 200,
                                                      ),
                                                      (listRincian.first[
                                                                  'mulai_layanan'] !=
                                                              null)
                                                          ? Center(
                                                              child: Text(
                                                                'Konsultasi Layanan akan dimulai \n ${listRincian.first['mulai_layanan']}',
                                                                // 'Konsultasi belum dimulai, Waktu mulai belum ditetapkan ',
                                                                style: GoogleFonts.ubuntu(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            )
                                                          : Center(
                                                              child: Text(
                                                                'Konsultasi belum dimulai, Waktu mulai belum ditetapkan ',
                                                                style: GoogleFonts.ubuntu(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                      // :
                                                      // Text(
                                                      //   'Konsultasi Layanan akan dimulai \n ${listRincian.first['mulai_layanan']}',
                                                      //   // 'Konsultasi belum dimulai, Waktu mulai belum ditetapkan ',
                                                      //   style: GoogleFonts.ubuntu(
                                                      //       fontSize: 14, fontWeight: FontWeight.w100),
                                                      //   textAlign: TextAlign.center,
                                                      // ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Center(
                                                        child: ElevatedButton(
                                                          onPressed: getData,
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                GlobalColors
                                                                    .mainColor,
                                                            fixedSize:
                                                                const Size(
                                                                    180, 30),
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Refresh',
                                                              style: GoogleFonts.ubuntu(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              :

                                              //Halaman Chat
                                              //halaman chat
                                              Column(
                                                  children: [
                                                    Time(
                                                        jamSelesai:
                                                            _jamSelesai),
                                                    Expanded(
                                                      child: Chats(
                                                          kontakId:
                                                              listRincian.first[
                                                                  'id_mitra'],
                                                          mq: mq),
                                                    ),

                                                    //progress indicator for showing uploading
                                                    if (_isUploading)
                                                      const Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          20),
                                                              child:
                                                                  CircularProgressIndicator(
                                                                      strokeWidth:
                                                                          2))),

                                                    //chat input filed
                                                    _chatInput(),
                                                  ],
                                                ),
                                      onRefresh: () => getData())
                              ],
                            ))
                ]),
          )),
    );
  }

  Widget _chatInput() {
    final mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: mq.height * .01, horizontal: mq.width * .025),
      child: Row(
        children: [
          //input field & buttons
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: 'Type Something...',
                        hintStyle: TextStyle(color: GlobalColors.mainColor),
                        border: InputBorder.none),
                  )),

                  //pick image from gallery button
                  IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Picking multiple images
                        final List<XFile> images =
                            await picker.pickMultiImage(imageQuality: 70);

                        // uploading & sending image one by one
                        for (var i in images) {
                          log('Image Path: ${i.path}');
                          setState(() => _isUploading = true);
                          await APIs.sendChatImage(
                              listRincian.first['id_mitra'], File(i.path));
                          setState(() => _isUploading = false);
                        }
                      },
                      icon: Icon(Icons.image,
                          color: GlobalColors.mainColor, size: 26)),

                  //take image from camera button
                  IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 70);
                        if (image != null) {
                          log('Image Path: ${image.path}');
                          setState(() => _isUploading = true);

                          await APIs.sendChatImage(
                              listRincian.first['id_mitra'], File(image.path));
                          setState(() => _isUploading = false);
                        }
                      },
                      icon: Icon(Icons.camera_alt_rounded,
                          color: GlobalColors.mainColor, size: 26)),

                  //adding some space
                  SizedBox(width: mq.width * .02),
                ],
              ),
            ),
          ),

          //send message button
          MaterialButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                if (_list.isEmpty) {
                  //on first message (add user to my_user collection of chat user)
                  APIs.sendMessage(listRincian.first['id_mitra'],
                      _textController.text, Type.text);
                } else {
                  //simply send message
                  APIs.sendMessage(listRincian.first['id_mitra'],
                      _textController.text, Type.text);
                }
                _textController.text = '';
              }
            },
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            color: GlobalColors.mainColor,
            child: const Icon(Icons.send, color: Colors.white, size: 28),
          )
        ],
      ),
    );
  }
}

List<Message> _list = [];

class Chats extends StatelessWidget {
  const Chats({
    super.key,
    required this.kontakId,
    required this.mq,
  });

  final String kontakId;
  final Size mq;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: APIs.getAllMessagesFromId(kontakId),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          //if data is loading
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const SizedBox();
          //  return const Center(
          //   child: CircularProgressIndicator(),
          //  );

          //if some or all data is loaded then show it
          case ConnectionState.active:
          case ConnectionState.done:
            final data = snapshot.data?.docs;
            // log('Data: ${data![0].data()}')
            _list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];

            if (_list.isNotEmpty) {
              return ListView.builder(
                  reverse: true,
                  itemCount: _list.length,
                  padding: EdgeInsets.only(top: mq.height * .01),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    // return Text('Message: ${_list[index]}');
                    return MessageCard(
                        idKontak: APIs.me.id, message: _list[index]);
                  });
            } else {
              return const Center(
                child: Text('Say Hii! 👋', style: TextStyle(fontSize: 20)),
              );
            }
        }
      },
    );
  }
}

class Time extends StatefulWidget {
  final DateTime? jamSelesai;
  const Time({
    super.key,
    required this.jamSelesai,
  });

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Duration? _timeRemaining;
  Timer? timer;

  reduceTime() {
    int reduction = 1;
    final int seconds = _timeRemaining!.inSeconds - reduction;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      _timeRemaining = Duration(seconds: seconds);
    }
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    _timeRemaining = widget.jamSelesai!.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => reduceTime());
  }

  buildTime() {
    try {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final String hours = twoDigits(_timeRemaining!.inHours);
      final String minutes = twoDigits(_timeRemaining!.inMinutes.remainder(60));
      final String seconds = twoDigits(_timeRemaining!.inSeconds.remainder(60));

      return '$hours:$minutes:$seconds';
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.jamSelesai == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Text(
              buildTime(),
              style: GoogleFonts.ubuntu(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}

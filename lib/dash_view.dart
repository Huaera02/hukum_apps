// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/baca_artikel.dart';
// import 'package:loginn/buat_janji_offline.dart';
// import 'package:loginn/chatnotaris.dart';
import 'package:loginn/form_mitra.dart';
import 'package:loginn/global_colors.dart';
// import 'package:loginn/lainnya.dart';
// import 'package:loginn/layanan_notaris.dart';
// import 'package:loginn/meet_advokat.dart';
import 'package:loginn/notif_view.dart';
import 'package:loginn/pilih_advokat.dart';
// import 'package:loginn/pilih_layanan.dart';
// import 'package:loginn/pilih_layanan2.dart';
// import 'package:loginn/profile_advokat1.dart';
// import 'package:loginn/profile_advokat2.dart';
import 'package:loginn/cari_advokat.dart';
import 'package:loginn/ppat.dart';
import 'package:loginn/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool isLoading = false;
  Repository repository = Repository();
  Map<String, dynamic> listData = {};

  getData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();

    var kontakId = pref.getString("id_kontak");
    Map<String, dynamic> response =
        await repository.getProfileAdvokat(idAdvokat: kontakId ?? '');


    isLoading = false;

    if (response['status'] == true) {
      listData = response['dataPribadi'];
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
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      appBar: AppBar(
        backgroundColor: GlobalColors.mainColor,
        foregroundColor: Colors.white,
        leading: Image.asset(
          'assets/images/logo2.png',
          width: 15,
          height: 15,
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.notifications, color: Colors.white, size: 35),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotifikasiView()));
            },
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        color: GlobalColors.btnColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      listData['nama'] ?? '',
                      style: TextStyle(
                        color: GlobalColors.btnColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/Ilustrasi Hukum.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          //Bagian Menu
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                //Layanan kami
                Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    alignment: Alignment.topLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Layanan Kami',
                              style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          GridView.count(
                            shrinkWrap: true,
                            // crossAxisSpacing: 3,
                            mainAxisSpacing: 20,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            crossAxisCount: 4,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PilihAdvokatView()));
                                },
                                splashColor: GlobalColors.btnColor,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/chat dengan advokat.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      Text(
                                        'Chat dengan \nAdvokat',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PilihNotarisView()));
                                },
                                splashColor: GlobalColors.btnColor,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/chat dengan notaris.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      Text(
                                        'Layanan \nNotaris/PPAT',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // InkWell(
                              //   onTap: (){
                              //     Navigator.push(context,
                              //        MaterialPageRoute(builder: (context) => const JanjiOfflineView()));
                              //   },
                              //   splashColor: GlobalColors.btnColor,
                              //   child: Center(
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('assets/images/buat janji offline.png',
                              //         height: 50,
                              //         width: 50,
                              //         ),
                              //         Text('Coming Soon',
                              //         style: GoogleFonts.ubuntu(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w500),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // InkWell(
                              //   onTap: (){
                              //     Navigator.push(context,
                              //        MaterialPageRoute(builder: (context) => const MeetingAdvokatView()));
                              //   },
                              //   splashColor: GlobalColors.btnColor,
                              //   child: Center(
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('assets/images/Meeting Online.png',
                              //         height: 50,
                              //         width: 50,
                              //         ),
                              //         Text('Coming Soon',
                              //         style: GoogleFonts.ubuntu(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w500),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // InkWell(
                              //   onTap: (){},
                              //   splashColor: GlobalColors.btnColor,
                              //   child: Center(
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('assets/images/kategori_keluarga.png',
                              //         height: 50,
                              //         width: 50,
                              //         ),
                              //         Text('Coming Soon',
                              //         style: GoogleFonts.ubuntu(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w500),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // InkWell(
                              //   onTap: (){},
                              //   splashColor: GlobalColors.btnColor,
                              //   child: Center(
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('assets/images/kategori_pidana.png',
                              //         height: 50,
                              //         width: 50,
                              //         ),
                              //         Text('Coming Soon',
                              //         style: GoogleFonts.ubuntu(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w500),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // InkWell(
                              //   onTap: (){},
                              //   splashColor: GlobalColors.btnColor,
                              //   child: Center(
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('assets/images/kategori_ti.png',
                              //         height: 50,
                              //         width: 50,
                              //         ),
                              //         Text('Coming Soon',
                              //         style: GoogleFonts.ubuntu(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w500),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // InkWell(
                              //   onTap: (){
                              //    Navigator.push(context,
                              //    MaterialPageRoute(builder: (context) => const LainnyaView()));
                              //   },
                              //   splashColor: GlobalColors.btnColor,
                              //   child: Center(
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('assets/images/Lainnya.png',
                              //         height: 50,
                              //         width: 50,
                              //         ),
                              //         Text('Coming Soon',
                              //         style: GoogleFonts.ubuntu(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w500),
                              //           textAlign: TextAlign.center,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          )
                        ])),

                //Promosi
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormMitraView()));
                    },
                    child: Image.asset('assets/images/promosi.png'),
                  ),
                ),

                //Advokat Populer
                Container(
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    alignment: Alignment.topLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Advokat Populer',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CariAdvokatView()));
                                  },
                                  child: Text('Lihat Semua',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: GlobalColors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      )))
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              child: Row(
                                children: [
                                  //Advokat 1
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const ProfileAdvokat1View()));
                                    },
                                    splashColor: GlobalColors.btnColor,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 20),
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
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            width: 90,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  5), // Menyelaraskan border radius gambar dengan container
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/Nur.png',
                                                    width:
                                                        90, // Sesuaikan lebar sesuai dengan lebar container
                                                    height:
                                                        120, // Sesuaikan tinggi sesuai dengan tinggi container
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: Image.asset(
                                                      'assets/images/Online.png', // Ganti dengan URL gambar online Anda
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Nurmiati, S.H',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/icon_pengalaman.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 10),
                                                  Text('5 Tahun',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  const SizedBox(width: 20),
                                                  Image.asset(
                                                      'assets/images/location.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 6),
                                                  Text('Makassar',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                              const SizedBox(height: 45),
                                              Text(
                                                'Free',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //Advokat 2
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const ProfileAdvokat2View()));
                                    },
                                    splashColor: GlobalColors.btnColor,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 20),
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
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            width: 90,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  5), // Menyelaraskan border radius gambar dengan container
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/gbr_advokat2.png',
                                                    width:
                                                        90, // Sesuaikan lebar sesuai dengan lebar container
                                                    height:
                                                        120, // Sesuaikan tinggi sesuai dengan tinggi container
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: Image.asset(
                                                      'assets/images/Online.png',
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Muh.Rizaldi, S.H., M.H',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/icon_pengalaman.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 10),
                                                  Text('10 Tahun',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  const SizedBox(width: 20),
                                                  Image.asset(
                                                      'assets/images/location.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 6),
                                                  Text('Makassar',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                              const SizedBox(height: 45),
                                              Text(
                                                'Free',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])),

                //Notaris dan PPAT Populer
                Container(
                    margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                    alignment: Alignment.topLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Notaris dan PPAT Populer',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CariAdvokatView()));
                                  },
                                  child: Text('Lihat Semua',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: GlobalColors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      )))
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              child: Row(
                                children: [
                                  //Notaris dan PPAT Populer 1
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const ProfileAdvokat1View()));
                                    },
                                    splashColor: GlobalColors.btnColor,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 20),
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
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            width: 90,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  5), // Menyelaraskan border radius gambar dengan container
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/Nur.png',
                                                    width:
                                                        90, // Sesuaikan lebar sesuai dengan lebar container
                                                    height:
                                                        120, // Sesuaikan tinggi sesuai dengan tinggi container
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: Image.asset(
                                                      'assets/images/Online.png', // Ganti dengan URL gambar online Anda
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Nurmiati, S.H',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/icon_pengalaman.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 10),
                                                  Text('5 Tahun',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  const SizedBox(width: 20),
                                                  Image.asset(
                                                      'assets/images/location.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 6),
                                                  Text('Makassar',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                              const SizedBox(height: 45),
                                              Text(
                                                'Free',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  //Notaris 2
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const ProfileAdvokat2View()));
                                    },
                                    splashColor: GlobalColors.btnColor,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 20),
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
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            width: 90,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  5), // Menyelaraskan border radius gambar dengan container
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/gbr_advokat2.png',
                                                    width:
                                                        90, // Sesuaikan lebar sesuai dengan lebar container
                                                    height:
                                                        120, // Sesuaikan tinggi sesuai dengan tinggi container
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: Image.asset(
                                                      'assets/images/Online.png',
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Muh.Rizaldi, S.H., M.H',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/icon_pengalaman.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 10),
                                                  Text('10 Tahun',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  const SizedBox(width: 20),
                                                  Image.asset(
                                                      'assets/images/location.png',
                                                      height: 15,
                                                      width: 15),
                                                  const SizedBox(width: 6),
                                                  Text('Makassar',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                              const SizedBox(height: 45),
                                              Text(
                                                'Free',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])),

                //Aetikel
                Container(
                    margin: const EdgeInsets.only(
                        left: 20, top: 10, right: 20, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Baca Artikel',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BacaArtikelView()));
                                  },
                                  child: Text('Lihat Semua',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: GlobalColors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      )))
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 6,
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/GbrArtikel.png',
                                            width: 110,
                                            height: 110,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Advokat Stefanus Roy\nDivonis 4,5 Tahun',
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Majelis hakim Pengadilan Tindak\nPidana Korupsi (Tipikor) pada\nPengadilan Negeri (PN)\nJakarta Pusat memvonis...',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 6,
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/GbrArtikel.png',
                                            width: 110,
                                            height: 110,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Advokat Stefanus Roy\nDivonis 4,5 Tahun',
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Majelis hakim Pengadilan Tindak\nPidana Korupsi (Tipikor) pada\nPengadilan Negeri (PN)\nJakarta Pusat memvonis...',
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])),
              ],
            ),
          )
        ],
      )),
    );
  }
}

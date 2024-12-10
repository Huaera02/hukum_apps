import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/auth/login_view.dart';
import 'package:loginn/chats/api/apis.dart';
// import 'package:loginn/ubah_data_mitra.dart';
import 'package:loginn/edit_profile/ubah_data_mitra_notaris.dart';
import 'package:loginn/layanan_mitra/layanan_chat.dart';
import 'package:loginn/metode_bayar/bank_mitra.dart';
// import 'package:loginn/newpass_view.dart';
import 'package:loginn/repository/repository.dart';
// import 'package:loginn/riwayat_mitra.dart';
import 'package:loginn/riwayat/riwayat_view.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMitraNotarisView extends StatefulWidget {
  const ProfileMitraNotarisView({super.key});

  @override
  State<ProfileMitraNotarisView> createState() => _ProfileMitraNotarisViewState();
}

class _ProfileMitraNotarisViewState extends State<ProfileMitraNotarisView> {
  bool isLoading = false;
  Repository repository = Repository();
  Map<String, dynamic> listData = {};
  String? sysBranchesId;

  getData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();

    var kontakId = pref.getString("id_kontak");
    sysBranchesId = pref.getString("sys_branches_id");
    Map<String, dynamic> response = await repository.getProfileAdvokat(idAdvokat: kontakId ?? '');

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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Profile',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/profile 1.png',
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  listData['nama'] ?? '',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (listData['no_notaris'] != null)
                                  Text(
                                    listData['no_notaris'] ?? '',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                if (listData['no_ppat'] != null)
                                  Text(
                                    listData['no_ppat'],
                                    // listData['no_ppat'] ?? '',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                Text(
                                  listData['hp'] ?? '',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 75,
                          ),
                          IconButton.filledTonal(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const UbahDataMitraNotarisView()));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: GlobalColors.mainColor,
                              ))
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 320,
                    //   margin: const EdgeInsets.only(top: 15),
                    //   padding: const EdgeInsets.all(20),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Container(
                    //             width: 160,
                    //             height: 80,
                    //             padding: const EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: Border.all(
                    //                 color: Colors.grey.shade400,
                    //               ),
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 const Icon(
                    //                   Icons.person_3_outlined,
                    //                   color: Colors.black,
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       '0',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 5),
                    //                     Text(
                    //                       'Total Klien',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w300,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             width: 160,
                    //             height: 80,
                    //             padding: const EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: Border.all(
                    //                 color: Colors.grey.shade400,
                    //               ),
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 const Icon(
                    //                   Icons.edit_document,
                    //                   color: Colors.black,
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       '0',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 5),
                    //                     Text(
                    //                       'Total Kasus',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w300,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Container(
                    //             width: 160,
                    //             height: 80,
                    //             margin: const EdgeInsets.only(top: 15),
                    //             padding: const EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: Border.all(
                    //                 color: Colors.grey.shade400,
                    //               ),
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 const Icon(
                    //                   Icons.work_history_outlined,
                    //                   color: Colors.black,
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       '0',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 5),
                    //                     Text(
                    //                       'Total Jam Kerja',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w300,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             width: 160,
                    //             height: 80,
                    //             margin: const EdgeInsets.only(top: 15),
                    //             padding: const EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: Border.all(
                    //                 color: Colors.grey.shade400,
                    //               ),
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 const Icon(
                    //                   Icons.wallet_rounded,
                    //                   color: Colors.black,
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       '0',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 5),
                    //                     Text(
                    //                       'Total Transaksi',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w300,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Container(
                    //             width: 160,
                    //             height: 80,
                    //             margin: const EdgeInsets.only(top: 15),
                    //             padding: const EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(10),
                    //               border: Border.all(
                    //                 color: Colors.grey.shade400,
                    //               ),
                    //             ),
                    //             child: Row(
                    //               children: [
                    //                 const Icon(
                    //                   Icons.star_border_outlined,
                    //                   color: Colors.black,
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       '0.0',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.w500,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 5),
                    //                     Text(
                    //                       'Rating',
                    //                       style: GoogleFonts.ubuntu(
                    //                         fontSize: 12,
                    //                         fontWeight: FontWeight.w300,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      width: 500,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Layanan Notaris/PPAT',
                            style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LayananChatView()),
                              );
                            },
                            icon: Icon(
                              Icons.add_box_rounded,
                              color: GlobalColors.mainColor,
                              size: 20,
                            ),
                            label: Text(
                              'Layanan Notaris/PPAT',
                              style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Colors.grey.shade400,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              if (sysBranchesId != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RekeningView(
                                              branchId: sysBranchesId!,
                                            ))
                                    // const RiwayatMitraView()),
                                    );
                              }
                            },
                            icon: Icon(
                              Icons.card_membership,
                              color: GlobalColors.mainColor,
                              size: 20,
                            ),
                            label: Text(
                              'Rekening Saya',
                              style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: Colors.grey.shade400,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryView())
                                  // const RiwayatMitraView()),
                                  );
                            },
                            icon: Icon(
                              Icons.history_edu_outlined,
                              color: GlobalColors.mainColor,
                              size: 20,
                            ),
                            label: Text(
                              'Konsultasi Saya',
                              style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 15),
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       TextButton.icon(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           Icons.verified_user_rounded,
                    //           color: GlobalColors.mainColor,
                    //           size: 20,
                    //         ),
                    //         label: Text(
                    //           'Verifikasi Email',
                    //           style: GoogleFonts.ubuntu(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //       ),
                    //       Divider(
                    //         thickness: 1.0,
                    //         color: Colors.grey.shade400,
                    //       ),
                    //       TextButton.icon(
                    //         onPressed: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => const NewPassView(),
                    //             ),
                    //           );
                    //         },
                    //         icon: Icon(
                    //           Icons.key,
                    //           color: GlobalColors.mainColor,
                    //           size: 20,
                    //         ),
                    //         label: Text(
                    //           'Ubah Kata Sandi',
                    //           style: GoogleFonts.ubuntu(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //       ),
                    //       Divider(
                    //         thickness: 1.0,
                    //         color: Colors.grey.shade400,
                    //       ),
                    //       TextButton.icon(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           Icons.delete,
                    //           color: GlobalColors.mainColor,
                    //           size: 20,
                    //         ),
                    //         label: Text(
                    //           'Hapus Akun',
                    //           style: GoogleFonts.ubuntu(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    TextButton(
                      onPressed: () {
                        APIs.updateActiveStatus(false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginView()),
                        );
                      },
                      child: Text(
                        'Keluar Akun',
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: GlobalColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,MaterialPageRoute(builder: (context) => const RiwayatMitraView()),
      //     );
      //   },
      //   backgroundColor: GlobalColors.mainColor,
      //   child: const Icon(Icons.contact_mail_rounded, color: Colors.white),
      // ),
    );
  }
}

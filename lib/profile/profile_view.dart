import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/profile/bantuan.dart';
import 'package:loginn/edit_profile/edit_profile_view.dart';
// import 'package:loginn/form_mitra.dart';
import 'package:loginn/warna/global_colors.dart';
// import 'package:loginn/login_view.dart';
// import 'package:loginn/newpass_view.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/auth/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chats/api/apis.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Profile',
          style: GoogleFonts.ubuntu(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    // Container(
                    //   width: 500,
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     color: Colors.yellow.shade400,
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       'Sedang menunggu verifikasi',
                    //       style: GoogleFonts.ubuntu(
                    //           fontSize: 12, fontWeight: FontWeight.normal),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  listData['email'] ?? '',
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
                          // const SizedBox(
                          //   width: 75,
                          // ),
                          // IconButton.filledTonal(
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) =>
                          //                   const EditProfileView()));
                          //     },
                          //     icon: Icon(
                          //       Icons.edit,
                          //       color: GlobalColors.mainColor,
                          //     ))
                        ],
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   width: 500,
                    //   margin: const EdgeInsets.only(top: 15),
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //   ),
                    //   child: TextButton.icon(
                    //       onPressed: () {
                    //         showDialog(
                    //           context: context,
                    //           builder: (context) {
                    //             return AlertDialog(
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(5),
                    //               ),
                    //               title: Padding(
                    //                 padding: const EdgeInsets.all(3),
                    //                 child: Center(
                    //                   child: Text(
                    //                     'Fitur sedang dalam mode pengembangan',
                    //                     style: GoogleFonts.ubuntu(
                    //                       fontSize: 16,
                    //                     ),
                    //                     textAlign: TextAlign.center,
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         );
                    //         // Navigator.push(
                    //         //     context,
                    //         //     MaterialPageRoute(
                    //         //         builder: (context) =>
                    //         //             const FormMitraView()));
                    //       },
                    //       icon: Icon(
                    //         Icons.group_add,
                    //         color: GlobalColors.mainColor,
                    //         size: 20,
                    //       ),
                    //       label: Text('Daftar Sebagai Mitra',
                    //           style: GoogleFonts.ubuntu(
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w500,
                    //               color: Colors.black))),
                    // ),

                    Container(
                      alignment: Alignment.centerLeft,
                      width: 500,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileView()));
                          },
                          icon: Icon(
                            Icons.person,
                            color: GlobalColors.mainColor,
                            size: 20,
                          ),
                          label: Text('Profile Saya',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                              onPressed: () {
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
                                            'Fitur sedang dalam mode pengembangan',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.verified_user_rounded,
                                color: GlobalColors.mainColor,
                                size: 20,
                              ),
                              label: Text('Verifikasi Email',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                          Divider(thickness: 1.0, color: Colors.grey.shade400),
                          TextButton.icon(
                              onPressed: () {
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
                                            'Fitur sedang dalam mode pengembangan',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const NewPassView()));
                              },
                              icon: Icon(
                                Icons.key,
                                color: GlobalColors.mainColor,
                                size: 20,
                              ),
                              label: Text('Ubah Kata Sandi',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                          Divider(thickness: 1.0, color: Colors.grey.shade400),
                          TextButton.icon(
                              onPressed: () {                                
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BantuanView()));
                              },
                              icon: Icon(
                                Icons.phone,
                                color: GlobalColors.mainColor,
                                size: 20,
                              ),
                              label: Text('Bantuan',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                          Divider(thickness: 1.0, color: Colors.grey.shade400),
                          TextButton.icon(
                              onPressed: () {
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
                                            'Fitur sedang dalam mode pengembangan',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );                                                            
                              },
                              icon: Icon(
                                Icons.delete,
                                color: GlobalColors.mainColor,
                                size: 20,
                              ),
                              label: Text('Hapus Akun',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                        ],
                      ),
                    ),

                    const SizedBox(height: 150),
                    TextButton(
                        onPressed: () async {
                          //sebelum ke splash hapus sessionya supaya dibaca tidak login
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          await pref.clear(); //utk hapus session
                          APIs.updateActiveStatus(false);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SplashView()),
                            (route) => false,
                          );
                        },
                        child: Text('Keluar Akun',
                            style: GoogleFonts.ubuntu(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: GlobalColors.mainColor)))
                  ],
                )
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
    );
  }
}

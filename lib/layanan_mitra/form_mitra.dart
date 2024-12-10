import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/edit_datamitra.dart';
import 'package:loginn/warna/global_colors.dart';
// import 'package:loginn/profile_mitra.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/edit_profile/ubah_data_mitra.dart';
import 'package:loginn/edit_profile/ubah_data_mitraNotaris.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormMitraView extends StatefulWidget {
  const FormMitraView({super.key});

  @override
  State<FormMitraView> createState() => _FormMitraViewState();
}

class _FormMitraViewState extends State<FormMitraView> {
  String role = '';
  SharedPreferences? pref;

  int _value = 1;
  bool? isCheck = false;

  Repository repository = Repository();
  final namaController = TextEditingController();
  final companyController = TextEditingController();

  String? nama = '';
  String? email = '';
  String? noHp = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      nama = pref.getString('nama');
      email = pref.getString('email');
      noHp = pref.getString('noHp');
      role = pref.getString('tipeKontakAlias') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Pendaftaran Mitra',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: 500,
            decoration: BoxDecoration(
              color: GlobalColors.mainColor.withOpacity(0.5),
            ),
            child: Text('     Informasi Pribadi',
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white)),
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as int;
                        });
                      }),
                  Text('Advokat',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Row(
                children: [
                  Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as int;
                        });
                      }),
                  Text('Notaris/PPAT',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nama Lengkap',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 10),
                            Text('Email',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 10),
                            Text('No Hp',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(': ${nama ?? ''}',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 10),
                            Text(': ${email ?? ''}',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                )),
                            const SizedBox(height: 10),
                            Text(': ${noHp ?? ''}',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                      value: isCheck,
                      activeColor: GlobalColors.mainColor,
                      onChanged: (newBool) {
                        setState(() {
                          isCheck = newBool;
                        });
                      }),
                  Text(
                    'Apakah Benar Anda Seorang Advokat atau Notaris/PPAT ',
                    style: GoogleFonts.ubuntu(fontSize: 12),
                  )
                ],
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 52,
            margin:
                const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.mainColor,
              ),
              onPressed: () async {
                Map<String, dynamic> response = await repository.postDataMitra(
                    '${namaController.text} ${companyController.text}',
                    _value == 1 ? 'advokat' : 'notaris');
                if (response['status'] == true) {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Center(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_rounded,
                                  size: 100,
                                  color: Colors.green,
                                ),
                                Text(
                                  '${response['msg']}, Harap Melengkapi Data Diri pada Profile',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  _value == 1
                      ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const UbahDataMitraView(),
                        ))
                      : Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              const UbahDataMitraNotarisView(),
                        ));
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
              },
              child: Text(
                'Daftar',
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
    );
  }
}












// import 'package:flutter/material.dart';
// // import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/global_colors.dart';
// import 'package:loginn/profile_mitra.dart';
// import 'package:loginn/repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:loginn/repository.dart';

// class FormMitraView extends StatefulWidget {
//   const FormMitraView({super.key});

//   @override
//   State<FormMitraView> createState() => _FormMitraViewState();
// }

// class _FormMitraViewState extends State<FormMitraView> {
//   int _value = 1;

//   Repository repository = Repository();
//   final namaController = TextEditingController();
//   final hpController = TextEditingController();
//   final emailController = TextEditingController();
//   final companyController = TextEditingController();

//   // final _formState = GlobalKey<FormState>();

//   String? nama = '';
//   String? email = '';
//   String? noHp = '';

//   init() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     nama = pref.getString('nama');
//     email= pref.getString('email');
//     noHp = pref.getString('noHp');
//   }

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: GlobalColors.mainColor,
//         title: Text(
//           'Pendaftaran Mitra',
//           style: GoogleFonts.ubuntu(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             width: 500,
//             decoration: BoxDecoration(
//               color: GlobalColors.mainColor.withOpacity(0.5),
//             ),
//             child: Text('     Informasi Pribadi',
//                 style: GoogleFonts.ubuntu(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.white)),
//           ),
//           Row(
//             children: [
//               Row(
//                 children: [
//                   Radio(
//                       value: 1,
//                       groupValue: _value,
//                       onChanged: (value) {
//                         setState(() {
//                           _value = value as int;
//                         });
//                       }),
//                   Text('Advokat',
//                       style: GoogleFonts.ubuntu(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       )),
//                 ],
//               ),
//               const SizedBox(
//                 width: 50,
//               ),
//               Row(
//                 children: [
//                   Radio(
//                       value: 2,
//                       groupValue: _value,
//                       onChanged: (value) {
//                         setState(() {
//                           _value = value as int;
//                         });
//                       }),
//                   Text('Notaris/PPAT',
//                       style: GoogleFonts.ubuntu(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       )),
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             margin: const EdgeInsets.only(
//               left: 20,
//               right: 20,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Nama Lengkap :',
//                     style: GoogleFonts.ubuntu(
//                       fontSize: 14
//                     ),),
//                     Text(nama ?? '',
//                     style: GoogleFonts.ubuntu(
//                       fontSize: 14
//                     ),)
//                   ],
//                 )
                
//               ],
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: 52,
//             margin:
//                 const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 20),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: GlobalColors.mainColor,
//               ),
//               onPressed: () async {                
//                 Map<String, dynamic> response = await repository.postDataMitra(
//                     '${namaController.text} ${companyController.text}');
//                 if (response['status'] == true) {
//                   await showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         title: Padding(
//                           padding: const EdgeInsets.all(3),
//                           child: Center(
//                             child: Column(
//                               children: [
//                                 const Icon(
//                                   Icons.check_circle_outline_rounded,
//                                   size: 100,
//                                   color: Colors.green,
//                                 ),
//                                 Text(
//                                   response['msg'],
//                                   style: GoogleFonts.ubuntu(
//                                     fontSize: 16,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (context) => const ProfileMitraView(),
//                   ));                              
//                 } else {

//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         title: Padding(
//                           padding: const EdgeInsets.all(3),
//                           child: Center(
//                             child: Text(
//                               response['msg'],
//                               style: GoogleFonts.ubuntu(
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },              
//               child: Text(
//                 'Daftar',
//                 style: GoogleFonts.ubuntu(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: GlobalColors.btnColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

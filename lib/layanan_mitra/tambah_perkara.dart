// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/warna/global_colors.dart';
// import 'package:loginn/repository/repository.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// class TambahPerkaraView extends StatefulWidget {
//   final String branchId;
//   const TambahPerkaraView({super.key});

//   @override
//   State<TambahPerkaraView> createState() => _TambahPerkaraViewState();
// }

// class _TambahPerkaraViewState extends State<TambahPerkaraView> {
//   bool isLoading = false;
//   Repository repository = Repository();
//   final hargaController = TextEditingController();

//   Map<String, dynamic>? valuePilih1;
//   List<Map<String, dynamic>> perkara = [];

//   postProdukLayanan() async {
//     setState(() {
//       isLoading = true;
//     });
//     Map<String, dynamic> response = await repository.postPerqara(
//         perkara: valuePilih1?['id'],
//         harga: hargaController.text,
//         idProduk: 
//         );
        
//     isLoading = false;
//     if (response['status'] == true) {
//       Navigator.of(context).pop(true);
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5),
//             ),
//             title: Padding(
//               padding: const EdgeInsets.all(3),
//               child: Center(
//                 child: Text(
//                   response['msg'],
//                   style: GoogleFonts.ubuntu(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     }
//     setState(() {});
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: GlobalColors.mainColor,
//         title: Text(
//           'Tambah Layanan',
//           style: GoogleFonts.ubuntu(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SafeArea(
//           child: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 52,
//                 margin: const EdgeInsets.only(
//                     left: 26, right: 26, top: 10, bottom: 20),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: GlobalColors.mainColor,
//                     ),
//                     onPressed: postProdukLayanan,               
//                     child: Text('Simpan',
//                         style: GoogleFonts.ubuntu(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: GlobalColors.btnColor,
//                         ))),
//               )
//             ],
//           ),
//           Visibility(
//             visible: isLoading,
//             child: const Positioned.fill(
//               child: Align(
//                 alignment: Alignment.center,
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

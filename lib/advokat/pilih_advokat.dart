import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';
// import 'package:loginn/masukkan_masalah.dart';
import 'package:loginn/pilih_layanan/pilih_layanan.dart';
import 'package:loginn/repository/repository.dart';

class PilihAdvokatView extends StatefulWidget {
  // final Map<String,dynamic> produk;
  const PilihAdvokatView({super.key});

  @override
  State<PilihAdvokatView> createState() => _PilihAdvokatViewState();
}

class _PilihAdvokatViewState extends State<PilihAdvokatView> {
  // List<String> bidangKeahlian = ['Perceraian', 'Sengketa', 'Gono Gini', 'Warisan'];
  // List<String> pengalaman = ['<5 tahun', '5 tahun', '> 5 tahun'];
  // List<String> kabupatenKota = ['Makassar', 'Maros', 'Bone', 'Sidrap', 'Soppeng'];

  // List<String> selectedBidangKeahlian = [];
  // List<String> selectedPengalaman = [];
  // List<String> selectedKabupatenKota = [];

  // List<String> tags = [];
  String? tagKabkota;
  List<String> kabupatenKota = [
    'Bantaeng',
    'Barru',
    'Bone',
    'Bulukumba',
    'Enrekang',
    'Gowa',
    'Jeneponto',
    'Selayar',
    'Luwu',
    'Luwu Timur',
    'Luwu Utara',
    'Maros',
    'Pangkep',
    'Pinrang',
    'Sidrap',
    'Sinjai',
    'Soppeng',
    'Takalar',
    'Toraja',
    'Wajo',
    'Makassar',
    'Pare-Pare',
    'Palopo',

    // 'Makassar',
    // 'Maros',
    // 'Pangkep',
    // 'Bone',
    // 'Sidrap',
    // 'Soppeng',
    // 'Bantaeng',
    // 'Gowa',
    // 'Takalar',
    // 'Jeneponto',
    // 'Bulukumba',
    // 'Barru',
    // 'Enrekang'
  ];

  int _value = 1;

  bool isLoading = false;
  Repository repository = Repository();
  //utk menampilkan data
  List<Map<String, dynamic>> listData = [];
  //utk mencari mitra pada kolom
  final cariMitraController = TextEditingController();

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.cariNotaris(
      nama: cariMitraController.text,
      kabKota: tagKabkota,
      // tipe: 'advokat',
    );

    isLoading = false;

    if (response['status'] == true) {
      listData = List<Map<String, dynamic>>.from(response['data'] ?? []);
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), // Tinggi AppBar
          child: AppBar(
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 70,
                    right: 10), // Padding atas untuk status bar
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200, // Atur lebar sesuai kebutuhan Anda
                        height: 40, // Atur tinggi sesuai kebutuhan Anda
                        child: TextFormField(
                          controller: cariMitraController,
                          textInputAction: TextInputAction.search,
                          onFieldSubmitted: (val) {
                            getData();
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari...',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: GlobalColors.mainColor,
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    10.0), // Sesuaikan padding vertikal agar teks berada di tengah
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 10.0),
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  // color: Colors.grey[300],
                                  height: 600,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Text('Pilih Mitra',
                                                  //     style: GoogleFonts.ubuntu(
                                                  //         fontSize: 14,
                                                  //         fontWeight:
                                                  //             FontWeight.bold)),
                                                  // Column(
                                                  //   children: [
                                                  //     ChipsChoice.single(
                                                  //       value: tag,
                                                  //       onChanged: (val) =>
                                                  //           setState(() =>
                                                  //               tag = val),
                                                  //       choiceItems:
                                                  //           C2Choice.listFrom(
                                                  //         source: mitra,
                                                  //         value: (i, v) => i,
                                                  //         label: (i, v) => v,
                                                  //       ),
                                                  //       choiceActiveStyle: C2ChoiceStyle(
                                                  //           color: GlobalColors
                                                  //               .mainColor,
                                                  //           borderColor:
                                                  //               GlobalColors
                                                  //                   .mainColor,
                                                  //           borderRadius:
                                                  //               const BorderRadius
                                                  //                   .all(Radius
                                                  //                       .circular(
                                                  //                           5))),
                                                  //       choiceStyle: const C2ChoiceStyle(
                                                  //           color: Colors.black,
                                                  //           borderColor:
                                                  //               Colors.black38,
                                                  //           borderRadius:
                                                  //               BorderRadius
                                                  //                   .all(Radius
                                                  //                       .circular(
                                                  //                           5))),
                                                  //       // wrapped: true,
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // const SizedBox(height: 20),
                                                  Text('Kabupaten/Kota',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  ChipsChoice<String>.single(
                                                    value: tagKabkota ?? '',
                                                    onChanged: (val) {
                                                      if (val == tagKabkota) {
                                                        setState(() =>
                                                            tagKabkota = null);
                                                      } else {
                                                        setState(() =>
                                                            tagKabkota = val);
                                                      }
                                                    },
                                                    choiceItems:
                                                        C2Choice.listFrom(
                                                      source: kabupatenKota,
                                                      value: (i, v) => v,
                                                      label: (i, v) => v,
                                                    ),
                                                    choiceActiveStyle: C2ChoiceStyle(
                                                        color: GlobalColors
                                                            .mainColor,
                                                        borderColor:
                                                            GlobalColors
                                                                .mainColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    5))),
                                                    choiceStyle:
                                                        const C2ChoiceStyle(
                                                            color: Colors.black,
                                                            borderColor:
                                                                Colors.black38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                    wrapped: true,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                  ),

                                                  // ChipsChoice<String>.multiple(
                                                  //   value: tags,
                                                  //   onChanged: (val) =>
                                                  //       setState(
                                                  //           () => tags = val),
                                                  //   choiceItems:
                                                  //       C2Choice.listFrom(
                                                  //     source: kabupatenKota,
                                                  //     value: (i, v) => v,
                                                  //     label: (i, v) => v,
                                                  //   ),
                                                  //   choiceActiveStyle: C2ChoiceStyle(
                                                  //       color: GlobalColors
                                                  //           .mainColor,
                                                  //       borderColor:
                                                  //           GlobalColors
                                                  //               .mainColor,
                                                  //       borderRadius:
                                                  //           const BorderRadius
                                                  //               .all(
                                                  //               Radius.circular(
                                                  //                   5))),
                                                  //   choiceStyle:
                                                  //       const C2ChoiceStyle(
                                                  //           color: Colors.black,
                                                  //           borderColor:
                                                  //               Colors.black38,
                                                  //           borderRadius:
                                                  //               BorderRadius
                                                  //                   .all(Radius
                                                  //                       .circular(
                                                  //                           5))),
                                                  //   wrapped: true,
                                                  //   textDirection:
                                                  //       TextDirection.ltr,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 52,
                                        margin: const EdgeInsets.only(
                                            left: 26,
                                            right: 26,
                                            top: 10,
                                            bottom: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                GlobalColors.mainColor,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            getData();
                                          },
                                          child: Text(
                                            'Terapkan',
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
                              });
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right:
                                20), // Menambahkan padding di sekitar TextFormField
                        child: Column(
                          children: [
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
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 6,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 90,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
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
                                              'assets/images/anwar.png',
                                              width:
                                                  90, // Sesuaikan lebar sesuai dengan lebar container
                                              height:
                                                  100, // Sesuaikan tinggi sesuai dengan tinggi container
                                              fit: BoxFit.cover,
                                            ),
                                            // Positioned(
                                            //   top: 5,
                                            //   right: 5,
                                            //   child: Image.asset(
                                            //     'assets/images/Online.png', // Ganti dengan URL gambar online Anda
                                            //     width: 15,
                                            //     height: 15,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            listData[index]['nama'] ?? '',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            // mainAxisAlignment:
                                            // MainAxisAlignment.spaceAround,
                                            children: [
                                              // Image.asset('assets/images/icon_pengalaman.png',
                                              //     height: 15, width: 15),
                                              // const SizedBox(width: 10),
                                              // Text('5 Tahun',
                                              //     style: GoogleFonts.ubuntu(
                                              //         fontSize: 10,
                                              //         fontWeight: FontWeight.w500)),
                                              // const SizedBox(width: 20),
                                              Image.asset(
                                                  'assets/images/location.png',
                                                  height: 15,
                                                  width: 15),
                                              const SizedBox(width: 6),
                                              Text(
                                                  listData[index]['kabkota'] ??
                                                      '',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            listData[index]['profil'] ?? '',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Radio(
                                        value: index + 1,
                                        groupValue: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value as int;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: listData.length,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.only(
                      left: 26, right: 26, top: 10, bottom: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PilihLayananView(
                                    mitra: listData[_value - 1])));
                        // MasukkanMasalahmuView(produk: widget.produk, mitra: listData[_value-1],)));
                      },
                      child: Text('Selanjutnya',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.btnColor,
                          ))),
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
        )

        // body: ListView(
        //   children: [
        //     Container(
        //       padding: const EdgeInsets.all(
        //           20), // Menambahkan padding di sekitar TextFormField
        //       child: Column(
        //         children: [
        //           InkWell(
        //             onTap: () {
        //               // Navigator.push(context,
        //               // MaterialPageRoute(builder: (context) => const ProfileAdvokat1View()));
        //             },
        //             splashColor: GlobalColors.btnColor,
        //             child: Container(
        //               padding:
        //                   const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(10),
        //                   boxShadow: const [
        //                     BoxShadow(
        //                       color: Colors.black38,
        //                       blurRadius: 6,
        //                     )
        //                   ]),
        //               child: Row(
        //                 children: [
        //                   Container(
        //                     margin: const EdgeInsets.only(right: 10),
        //                     width: 90,
        //                     height: 120,
        //                     decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.circular(5),
        //                       border: Border.all(
        //                         color: Colors.grey.shade200,
        //                       ),
        //                     ),
        //                     child: ClipRRect(
        //                       borderRadius: BorderRadius.circular(
        //                           5), // Menyelaraskan border radius gambar dengan container
        //                       child: Stack(
        //                         children: [
        //                           Image.asset(
        //                             'assets/images/Nur.png',
        //                             width:
        //                                 90, // Sesuaikan lebar sesuai dengan lebar container
        //                             height:
        //                                 120, // Sesuaikan tinggi sesuai dengan tinggi container
        //                             fit: BoxFit.cover,
        //                           ),
        //                           Positioned(
        //                             top: 5,
        //                             right: 5,
        //                             child: Image.asset(
        //                               'assets/images/Online.png', // Ganti dengan URL gambar online Anda
        //                               width: 15,
        //                               height: 15,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         'Nurmiati, S.H',
        //                         style: GoogleFonts.ubuntu(
        //                             fontSize: 14, fontWeight: FontWeight.bold),
        //                       ),
        //                       const SizedBox(height: 10),
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                         children: [
        //                           Image.asset('assets/images/icon_pengalaman.png',
        //                               height: 15, width: 15),
        //                           const SizedBox(width: 10),
        //                           Text('5 Tahun',
        //                               style: GoogleFonts.ubuntu(
        //                                   fontSize: 10,
        //                                   fontWeight: FontWeight.w500)),
        //                           const SizedBox(width: 20),
        //                           Image.asset('assets/images/location.png',
        //                               height: 15, width: 15),
        //                           const SizedBox(width: 6),
        //                           Text('Makassar',
        //                               style: GoogleFonts.ubuntu(
        //                                   fontSize: 10,
        //                                   fontWeight: FontWeight.w500)),
        //                         ],
        //                       ),
        //                       const SizedBox(height: 45),
        //                       Text(
        //                         'Free',
        //                         style: GoogleFonts.ubuntu(
        //                             fontSize: 14, fontWeight: FontWeight.w500),
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     width: 35,
        //                   ),
        //                   Radio(
        //                       value: 1,
        //                       groupValue: _value,
        //                       onChanged: (value) {
        //                         setState(() {
        //                           _value = value as int;
        //                         });
        //                       })
        //                 ],
        //               ),
        //             ),
        //           ),

        //           //Advokat 2
        //           const SizedBox(
        //             height: 10,
        //           ),
        //           InkWell(
        //             onTap: () {
        //               // Navigator.push(context,
        //               // MaterialPageRoute(builder: (context) => const ProfileAdvokat1View()));
        //             },
        //             splashColor: GlobalColors.btnColor,
        //             child: Container(
        //               padding:
        //                   const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(10),
        //                   boxShadow: const [
        //                     BoxShadow(
        //                       color: Colors.black38,
        //                       blurRadius: 6,
        //                     )
        //                   ]),
        //               child: Row(
        //                 children: [
        //                   Container(
        //                     margin: const EdgeInsets.only(right: 10),
        //                     width: 90,
        //                     height: 120,
        //                     decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.circular(5),
        //                       border: Border.all(
        //                         color: Colors.grey.shade200,
        //                       ),
        //                     ),
        //                     child: ClipRRect(
        //                       borderRadius: BorderRadius.circular(
        //                           5), // Menyelaraskan border radius gambar dengan container
        //                       child: Stack(
        //                         children: [
        //                           Image.asset(
        //                             'assets/images/gbr_advokat2.png',
        //                             width:
        //                                 90, // Sesuaikan lebar sesuai dengan lebar container
        //                             height:
        //                                 120, // Sesuaikan tinggi sesuai dengan tinggi container
        //                             fit: BoxFit.cover,
        //                           ),
        //                           Positioned(
        //                             top: 5,
        //                             right: 5,
        //                             child: Image.asset(
        //                               'assets/images/Online.png', // Ganti dengan URL gambar online Anda
        //                               width: 15,
        //                               height: 15,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         'Muh.Rizaldi, S.H., M.H',
        //                         style: GoogleFonts.ubuntu(
        //                             fontSize: 14, fontWeight: FontWeight.bold),
        //                       ),
        //                       const SizedBox(height: 10),
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                         children: [
        //                           Image.asset('assets/images/icon_pengalaman.png',
        //                               height: 15, width: 15),
        //                           const SizedBox(width: 10),
        //                           Text('10 Tahun',
        //                               style: GoogleFonts.ubuntu(
        //                                   fontSize: 10,
        //                                   fontWeight: FontWeight.w500)),
        //                           const SizedBox(width: 20),
        //                           Image.asset('assets/images/location.png',
        //                               height: 15, width: 15),
        //                           const SizedBox(width: 6),
        //                           Text('Makassar',
        //                               style: GoogleFonts.ubuntu(
        //                                   fontSize: 10,
        //                                   fontWeight: FontWeight.w500)),
        //                         ],
        //                       ),
        //                       const SizedBox(height: 45),
        //                       Text(
        //                         'Free',
        //                         style: GoogleFonts.ubuntu(
        //                             fontSize: 14, fontWeight: FontWeight.w500),
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     width: 30,
        //                   ),
        //                   Radio(
        //                       value: 2,
        //                       groupValue: _value,
        //                       onChanged: (value) {
        //                         setState(() {
        //                           _value = value as int;
        //                         });
        //                       })
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       width: double.infinity,
        //       height: 52,
        //       margin: const EdgeInsets.only(
        //           left: 26, right: 26, top: 334, bottom: 20),
        //       child: ElevatedButton(
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: GlobalColors.mainColor,
        //           ),
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const MasukkanMasalahmuView()));
        //           },
        //           child: Text('Selanjutnya',
        //               style: GoogleFonts.ubuntu(
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w500,
        //                 color: GlobalColors.btnColor,
        //               ))),
        //     )
        //   ],
        // ),
        );
  }
}

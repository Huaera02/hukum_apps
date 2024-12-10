// import 'dart:developer';

import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/profile_advokat1.dart';
// import 'package:loginn/profile_advokat2.dart';
import 'package:loginn/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CariAdvokatView extends StatefulWidget {
  const CariAdvokatView({super.key});

  @override
  State<CariAdvokatView> createState() => _CariAdvokatViewState();
}

class _CariAdvokatViewState extends State<CariAdvokatView> {
  // List<String> bidangKeahlian = [
  //   'Perceraian',
  //   'Sengketa',
  //   'Gono Gini',
  //   'Warisan'
  // ];
  // List<String> pengalaman = ['<5 tahun', '5 tahun', '> 5 tahun'];
  int tag = 0;
  // List<String> tagKabkota = [];
  List<String> mitra = [
    'Advokat',
    'Notaris/PPAT',
  ];
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

  // List<String> selectedBidangKeahlian = [];
  // List<String> selectedPengalaman = [];
  // List<String> selectedmitra = [];
  List<String> selectedKabupatenKota = [];
  int selectedmitra = 0;

  bool isLoading = false;
  Repository repository = Repository();
  //utk menampilkan data
  List<Map<String, dynamic>> listData = [];
  //utk mencari mitra pada kolom
  final cariMitraController = TextEditingController();

  String? tagKabkota;

  getData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> response = await repository.cariNotaris(
      nama: cariMitraController.text,
      tipe: tag == 0 ? 'advokat' : 'notaris',
      kabKota: tagKabkota,
    );

    isLoading = false;

    if (response['status'] == true) {
      listData = List<Map<String, dynamic>>.from(response['data']?? []);
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

  init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var tipeKontak = pref.getString('tipeKontakAlias');

    if (tipeKontak == 'notaris') {
      tag = 1;
    } else {
      tag = 0;
    }
    setState(() {});
    getData();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), // Tinggi AppBar
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 10,
                    right: 10), // Padding atas untuk status bar
                child: Row(
                  children: [
                    // IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_rounded)),
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
                                                  // Text('Bidang Keahlian',
                                                  //     style: GoogleFonts.ubuntu(
                                                  //         fontSize: 14,
                                                  //         fontWeight: FontWeight.bold)),
                                                  // Wrap(
                                                  //   spacing: 8.0,
                                                  //   children:
                                                  //       bidangKeahlian.map((keahlian) {
                                                  //     return FilterChip(
                                                  //       label: Text(keahlian),
                                                  //       selected: selectedBidangKeahlian
                                                  //           .contains(keahlian),
                                                  //       selectedColor:
                                                  //           GlobalColors.mainColor,
                                                  //       onSelected: (isSelected) {
                                                  //         setState(() {
                                                  //           isSelected
                                                  //               ? selectedBidangKeahlian
                                                  //                   .add(keahlian)
                                                  //               : selectedBidangKeahlian
                                                  //                   .remove(keahlian);
                                                  //         });
                                                  //       },
                                                  //     );
                                                  //   }).toList(),
                                                  // ),
                                                  // const SizedBox(height: 20),
                                                  // Text('Pengalaman',
                                                  //     style: GoogleFonts.ubuntu(
                                                  //         fontSize: 14,
                                                  //         fontWeight: FontWeight.bold)),
                                                  // Wrap(
                                                  //   spacing: 8.0,
                                                  //   children:
                                                  //       pengalaman.map((pengalaman) {
                                                  //     return FilterChip(
                                                  //       label: Text(pengalaman),
                                                  //       selected: selectedPengalaman
                                                  //           .contains(pengalaman),
                                                  //       selectedColor:
                                                  //           GlobalColors.mainColor,
                                                  //       onSelected: (isSelected) {
                                                  //         setState(() {
                                                  //           isSelected
                                                  //               ? selectedPengalaman
                                                  //                   .add(pengalaman)
                                                  //               : selectedPengalaman
                                                  //                   .remove(pengalaman);
                                                  //         });
                                                  //       },
                                                  //     );
                                                  //   }).toList(),
                                                  // ),
                                                  Text('Pilih Mitra',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Column(
                                                    children: [
                                                      ChipsChoice.single(
                                                        value: tag,
                                                        onChanged: (val) =>
                                                            setState(() =>
                                                                tag = val),
                                                        choiceItems:
                                                            C2Choice.listFrom(
                                                          source: mitra,
                                                          value: (i, v) => i,
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
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        choiceStyle: const C2ChoiceStyle(
                                                            color: Colors.black,
                                                            borderColor:
                                                                Colors.black38,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        // wrapped: true,
                                                      ),
                                                    ],
                                                  ),

                                                  // Column(
                                                  //   children: mitra
                                                  //       .asMap()
                                                  //       .entries
                                                  //       .map((entry) {
                                                  //     int idx = entry.key;
                                                  //     String mitraName = entry.value;
                                                  //     return RadioListTile(
                                                  //       title: Text(mitraName),
                                                  //       value: idx,
                                                  //       groupValue: selectedmitra,
                                                  //       onChanged: (int? value) {
                                                  //         setState(() {
                                                  //           selectedmitra = value!;
                                                  //         });
                                                  //       },
                                                  //     );
                                                  //   }).toList(),
                                                  // ),
                                                  // Wrap(
                                                  //   spacing: 8.0,
                                                  //   children: mitra
                                                  //       .map((mitra) {
                                                  //     return FilterChip(
                                                  //       label: Text(mitra),
                                                  //       selected:
                                                  //           selectedmitra
                                                  //               .contains(mitra),
                                                  //       selectedColor:
                                                  //           GlobalColors.mainColor,
                                                  //       onSelected: (isSelected) {
                                                  //         setState(() {
                                                  //           isSelected
                                                  //               ? selectedmitra
                                                  //                   .add(mitra)
                                                  //               : selectedmitra
                                                  //                   .remove(
                                                  //                       mitra);
                                                  //         });
                                                  //       },
                                                  //     );
                                                  //   }).toList(),
                                                  // ),
                                                  const SizedBox(height: 20),
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
                                                  // Wrap(
                                                  //   spacing: 8.0,
                                                  //   children: kabupatenKota
                                                  //       .map((kabupaten) {
                                                  //     return FilterChip(
                                                  //       label: Text(kabupaten),
                                                  //       selected:
                                                  //           selectedKabupatenKota
                                                  //               .contains(kabupaten),
                                                  //       selectedColor:
                                                  //           GlobalColors.mainColor,
                                                  //       onSelected: (isSelected) {
                                                  //         setState(() {
                                                  //           isSelected
                                                  //               ? selectedKabupatenKota
                                                  //                   .add(kabupaten)
                                                  //               : selectedKabupatenKota
                                                  //                   .remove(
                                                  //                       kabupaten);
                                                  //         });
                                                  //       },
                                                  //     );
                                                  //   }).toList(),
                                                  // ),

                                                  // Container(
                                                  //   width: double.infinity,
                                                  //   height: 52,
                                                  //   margin: const EdgeInsets.only(
                                                  //       top: 20,
                                                  //       // bottom: 20
                                                  //       ),
                                                  //   child: ElevatedButton(
                                                  //     style: ElevatedButton.styleFrom(
                                                  //       backgroundColor:
                                                  //           GlobalColors.mainColor,
                                                  //     ),
                                                  //     onPressed: () {
                                                  //       Navigator.of(context)
                                                  //           .pushReplacement(
                                                  //               MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             const CariAdvokatView(),
                                                  //       ));
                                                  //       //   Navigator.push(context,
                                                  //       // MaterialPageRoute(builder: (context) => const CariAdvokatView()));
                                                  //     },
                                                  //     child: Text(
                                                  //       'Terapkan',
                                                  //       style: GoogleFonts.ubuntu(
                                                  //         fontSize: 16,
                                                  //         fontWeight: FontWeight.w500,
                                                  //         color:
                                                  //             GlobalColors.btnColor,
                                                  //       ),
                                                  //     ),
                                                  //   ),
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
                                            //   Navigator.push(context,
                                            // MaterialPageRoute(builder: (context) => const PembayaranView()));
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
            ListView.builder(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileAdvokat1View(
                                        idMitra: listData[index]['id'],
                                      )));
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      listData[index]['nama'] ?? '',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 16,
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
                                        Text(listData[index]['kabkota'] ?? '',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      listData[index]['profil'] ?? '',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.left,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
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
        ));
  }
}

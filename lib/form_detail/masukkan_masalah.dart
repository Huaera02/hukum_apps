// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/checkout/bayar.dart';
import 'package:loginn/checkout/checkout.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/warna/global_colors.dart';

class MasukkanMasalahmuView extends StatefulWidget {
  final Map<String, dynamic> mitra;
  final Map<String, dynamic> produk;
  final String type;
  const MasukkanMasalahmuView({
    super.key,
    required this.mitra,
    required this.produk,
    this.type = '0',
  });

  @override
  State<MasukkanMasalahmuView> createState() => _MasukkanMasalahmuViewState();
}

class _MasukkanMasalahmuViewState extends State<MasukkanMasalahmuView> {
  final _formState = GlobalKey<FormState>();
  bool isLoading = false;
  Repository repository = Repository();
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  List<Map<String, dynamic>> perkara = [];
  int _value = 1;

  Map<String, dynamic>? valuePilih;
  List<Map<String, dynamic>> dataKlasifikasi = [];

  postDataMasalah({bool skip = false}) async {
    if (skip) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => CheckView(
          mitra: widget.mitra,
          produk: widget.produk,
          klasifikasi: valuePilih ?? {'id': ''},
          judul: judulController.text,
          deskripsi: deskripsiController.text,
          // perkara: perkara[_value - 1],
        ),
      ));
      return;
    }
    if (widget.produk['is_jenis_perkara']=='1') {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PembayaranView(
        mitra: widget.mitra,
        produk: widget.produk,
        klasifikasi: valuePilih ?? {'id': ''},
        judul: judulController.text,
        deskripsi: deskripsiController.text,
        jenisPerkara: perkara[_value - 1],)));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CheckView(
        mitra: widget.mitra,
        produk: widget.produk,
        klasifikasi: valuePilih ?? {'id': ''},
        judul: judulController.text,
        deskripsi: deskripsiController.text,      
      ),
    ));
    }
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getPengalamanMitra();

    isLoading = false;

    if (response['status'] == true) {
      dataKlasifikasi =
          List<Map<String, dynamic>>.from(response['klasifikasi']);
      // valuePilih = dataKlasifikasi.first;
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

  getData1() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getPerkara();

    isLoading = false;

    if (response['status'] == true) {
      perkara = List<Map<String, dynamic>>.from(response['perkara']);
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

  getData2() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.getPerkara1(idProduk: widget.produk['id']);

    isLoading = false;

    if (response['status'] == true) {
      perkara = List<Map<String, dynamic>>.from(response['perkara']);
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
    if (widget.produk['is_form'] == '0') {
      Future.delayed(
        const Duration(milliseconds: 100),
        () => postDataMasalah(skip: true),
      );
    } else {
      getData();
    }
    // getData1();
    getData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Detail Masalah',
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
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        if (widget.type == '1')
                          SizedBox(                          
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: perkara.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 20, right: 20),
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      width: 500,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black38)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [                                     
                                          Expanded(
                                            child: Row(
                                              children: [
                                                // Teks pertama dengan Expanded agar fleksibel
                                                Expanded(
                                                  child: Text(
                                                    perkara[index][
                                                            'ref_jenis_perkara_nama'] ??
                                                        '',
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis, // Menambahkan ellipsis jika teks terlalu panjang
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        16), // Spasi kecil antar teks
                                                // Teks kedua dengan Expanded agar fleksibel
                                                Expanded(
                                                  child: Text(
                                                    perkara[index]
                                                            ['harga_jual'] ??
                                                        '',
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis, // Menambahkan ellipsis jika teks terlalu panjang
                                                    textAlign: TextAlign
                                                        .right, // Teks rata kanan
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Radio button
                                          Radio(
                                            value: index + 1,
                                            groupValue: _value,
                                            onChanged: (value) {
                                              setState(() {
                                                _value = value as int;
                                              });
                                            },
                                          ),
                                        ],
                                      ));
                                  // child: Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Row(
                                  //       mainAxisAlignment: MainAxisAlignment.start,
                                  //       children: [
                                  //         Text(
                                  //           perkara[index][
                                  //                   'ref_jenis_perkara_nama'] ??
                                  //               '',
                                  //           style: GoogleFonts.ubuntu(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.w500,
                                  //           ),
                                  //         ),
                                  //         const SizedBox(width: 180,),
                                  //         Text(
                                  //           perkara[index]['harga_jual'] ??
                                  //               '',
                                  //           style: GoogleFonts.ubuntu(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.w500,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     Radio(
                                  //         value: index + 1,
                                  //         groupValue: _value,
                                  //         onChanged: (value) {
                                  //           setState(() {
                                  //             _value = value as int;
                                  //           });
                                  //         })
                                  //   ],
                                  // ));
                                }),
                          ),
                        // Container(
                        //   margin: const EdgeInsets.only(
                        //       top: 20, right: 20, left: 20),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [

                        //     ],
                        //   ),
                        // ),
                        if (widget.type == '0')
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // if (widget.produk['is_judulkasus'] == '1')
                                Text(
                                  'Pilih Klasifikasi Kasus',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // if (widget.produk['is_judulkasus'] == '1')
                                Container(
                                  height: 60,
                                  padding: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.grey.shade700,
                                      )),
                                  alignment: Alignment.center,
                                  child: DropdownButton<Map<String, dynamic>>(
                                    value: valuePilih,
                                    hint: Text(
                                      'Bidang Keahlian',
                                      style: GoogleFonts.ubuntu(
                                          // color: Colors.black
                                          ),
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 36,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                    onChanged: (newValue1) {
                                      setState(() {
                                        valuePilih = newValue1;
                                      });
                                    },
                                    items: dataKlasifikasi.map((valueItem1) {
                                      return DropdownMenuItem(
                                        value: valueItem1,
                                        child: Text(
                                          valueItem1['nama'],
                                          style:
                                              GoogleFonts.ubuntu(fontSize: 14),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // if (widget.produk['is_judulkasus'] == '1')
                                // Text(
                                //   'Masukkan Topik Masalah',
                                //   style: GoogleFonts.ubuntu(
                                //     fontSize: 12,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // if (widget.produk['is_judulkasus'] == '1')
                                // Form(
                                //   key: _formState,
                                //   child: TextFormField(
                                //     validator: (value) {
                                //       if (value == '') {
                                //         return "Kolom topik masalah tidak boleh kosong";
                                //       }
                                //     },
                                //     controller: judulController,
                                //     style: const TextStyle(
                                //         fontSize: 14, color: Colors.black),
                                //     keyboardType: TextInputType.text,
                                //     decoration: InputDecoration(
                                //       labelStyle: GoogleFonts.ubuntu(),
                                //       hintText: 'Masukkan Topik Masalah',
                                //       hintStyle:
                                //           GoogleFonts.ubuntu(color: Colors.black),
                                //       border: const OutlineInputBorder(),
                                //     ),
                                //   ),
                                // ),
                                // const SizedBox(height: 20),
                                //  if (widget.produk['is_judulkasus'] == '1')
                                Text(
                                  'Masukkan Deskripsi Masalah',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // if (widget.produk['is_judulkasus'] == '1')
                                SizedBox(
                                  height: 200,
                                  child: Form(
                                    key: _formState,
                                    child: TextFormField(
                                      // validator: (value) {
                                      //   if (value == '') {
                                      //     return "Kolom deskripsi masalah tidak boleh kosong";
                                      //   }
                                      //   return null;
                                      // },
                                      controller: deskripsiController,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      keyboardType: TextInputType.text,
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                        labelStyle: GoogleFonts.ubuntu(),
                                        hintText: 'Ceritakan Masalahmu..',
                                        hintStyle: GoogleFonts.ubuntu(
                                            color: Colors.black),
                                        border: const OutlineInputBorder(),
                                      ),
                                      maxLines: null,
                                      expands: true,
                                    ),
                                  ),
                                )
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
                        left: 26, right: 26, top: 10, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: () {
                        // if (_formState.currentState!.validate()) {
                        //   log('validasi sukses');
                        postDataMasalah();
                        // } else {
                        //   log('validasi gagal');
                        // }
                      },
                      child: Text(
                        'Selanjutnya',
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
        ));
  }
}

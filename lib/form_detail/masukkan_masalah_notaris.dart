import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/checkout/bayar_surat.dart';
import 'package:loginn/repository/repository.dart';
// import 'package:loginn/bayar.dart';
import 'package:loginn/warna/global_colors.dart';

class MasukkanMasalahNotarisView extends StatefulWidget {
  final Map<String, dynamic> mitra;
  final Map<String, dynamic> produk;
  const MasukkanMasalahNotarisView({
    super.key,
    required this.mitra,
    required this.produk,
  });

  @override
  State<MasukkanMasalahNotarisView> createState() =>
      _MasukkanMasalahNotarisViewState();
}

class _MasukkanMasalahNotarisViewState
    extends State<MasukkanMasalahNotarisView> {
  final _formState = GlobalKey<FormState>();
  bool isLoading = false;
  Repository repository = Repository();
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();

  Map<String, dynamic>? valuePilih;
  List<Map<String, dynamic>> dataKlasifikasi = [];

  postDataMasalah() async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PembayaranNotarisView(
        mitra: widget.mitra,
        produk: widget.produk,
        desc: deskripsiController.text,
      ),
    ));
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
      valuePilih = dataKlasifikasi.first;
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
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Catatan Notaris/PPAT',
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
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      children: [
                        Text(
                          'Ceritakan Masalah/Permintaanmu',
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 200,
                          child: Form(
                            key: _formState,
                            child: TextFormField(
                              validator: (value) {
                              if (value == '') {
                                return "Kolom deskripsi masalah tidak boleh kosong";
                              }
                              return null;
                            },
                              controller: deskripsiController,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              keyboardType: TextInputType.text,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Ceritakan Masalah/Permintaanmu...',
                                hintStyle:
                                    GoogleFonts.ubuntu(color: Colors.black),
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
                  Container(
                    width: double.infinity,
                    height: 52,
                    margin: const EdgeInsets.only(
                        left: 26, right: 26, top: 10, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: 
                      () {
                        if (_formState.currentState!.validate()) {
                          log('validasi sukses');
                          postDataMasalah();
                        } else {
                          log('validasi gagal');
                        }
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

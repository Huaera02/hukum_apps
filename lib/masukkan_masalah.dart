import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/bayar.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';

class MasukkanMasalahmuView extends StatefulWidget {
  final Map<String, dynamic> mitra;
  final Map<String, dynamic> produk;
  const MasukkanMasalahmuView({
    super.key,
    required this.mitra,
    required this.produk,
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

  Map<String, dynamic>? valuePilih;
  List<Map<String, dynamic>> dataKlasifikasi = [];

  postDataMasalah() async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PembayaranView(
        mitra: widget.mitra,
        produk: widget.produk,
        klasifikasi: valuePilih ?? {},
        judul: judulController.text,
        deskripsi: deskripsiController.text,
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
                                        style: GoogleFonts.ubuntu(fontSize: 14),
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
                              if (widget.produk['is_judulkasus'] == '1')
                              SizedBox(
                                height: 200,
                                child: Form(
                                  key: _formState,
                                  child: TextFormField(
                                    validator: (value) {
                                    if (value == '') {
                                      return "Kolom deskripsi masalah tidak boleh kosong";
                                    }
                                  },
                                    controller: deskripsiController,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    textAlignVertical: TextAlignVertical.top,
                                    decoration: InputDecoration(
                                      labelStyle: GoogleFonts.ubuntu(),
                                      hintText: 'Ceritakan Masalahmu..',
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
                        if (_formState.currentState!.validate()) {
                          print('validasi sukses');
                          postDataMasalah();
                        } else {
                          print('validasi gagal');
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

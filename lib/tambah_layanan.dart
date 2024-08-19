import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/layanan_chat.dart';
// import 'package:loginn/layanan_chat.dart';
import 'package:loginn/repository.dart';

class TambahLayanaView extends StatefulWidget {
  const TambahLayanaView({super.key});

  @override
  State<TambahLayanaView> createState() => _TambahLayanaViewState();
}

class _TambahLayanaViewState extends State<TambahLayanaView> {
  bool isLoading = false;
  Repository repository = Repository();
  final namaController = TextEditingController();
  final durasiController = TextEditingController();
  final hargaController = TextEditingController();

  Map<String, dynamic>? valuePilih1;
  List<Map<String, dynamic>> kategori = [];

  postProdukLayanan() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.postLayananMitra(
        kategori: valuePilih1?['id'],
        nama: namaController.text,
        durasi: durasiController.text,
        hargaJual: hargaController.text);
    isLoading = false;
    if (response['status'] == true) {
      // Navigator.of(context).pop(true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LayananChatView(),
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
    setState(() {});
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getKategoriProduk();

    isLoading = false;

    if (response['status'] == true) {
      kategori = List<Map<String, dynamic>>.from(response['kategori']);
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
          'Tambah Layanan',
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
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pilih Layanan',
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
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
                              value: valuePilih1,
                              hint: Text(
                                'Pilih Jenis Layanan Konsultasi',
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
                                  valuePilih1 = newValue1;
                                });
                              },
                              items: kategori.map((valueItem1) {
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
                            height: 15,
                          ),
                          Text(
                            'Jenis Konsultasi',
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: namaController,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.ubuntu(),
                              hintText: 'Contoh: Chat 30 Menit',
                              hintStyle:
                                  GoogleFonts.ubuntu(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Durasi Konsultasi',
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: durasiController,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.ubuntu(),
                              hintText: 'Contoh: 30 Menit',
                              hintStyle:
                                  GoogleFonts.ubuntu(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Harga Layanan Konsultasi',
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: hargaController,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: GoogleFonts.ubuntu(),
                              hintText: 'Contoh: 15000',
                              hintStyle:
                                  GoogleFonts.ubuntu(color: Colors.black),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                    ),
                    onPressed: postProdukLayanan,
                    // () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const LayananChatView()));
                    // },
                    child: Text('Simpan',
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
      )),
    );
  }
}

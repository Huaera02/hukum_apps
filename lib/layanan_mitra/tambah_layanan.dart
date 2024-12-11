import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/layanan_mitra/tambah_perkara.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/repository/repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class TambahLayanaView extends StatefulWidget {
  const TambahLayanaView({super.key});

  @override
  State<TambahLayanaView> createState() => _TambahLayanaViewState();
}

class _TambahLayanaViewState extends State<TambahLayanaView> {
  bool? isCheck = false;
  bool? isCheck1 = false;
  bool isLoading = false;
  Repository repository = Repository();
  final namaController = TextEditingController();
  final durasiController = TextEditingController();
  final hargaController = TextEditingController();
  final deskripsiController = TextEditingController();

  Map<String, dynamic>? valuePilih1;
  List<Map<String, dynamic>> kategori = [];
  List<Map<String, dynamic>> listData = [];

  postProdukLayanan() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.postLayananMitra(
        kategori: valuePilih1?['id'],
        nama: namaController.text,
        durasi: durasiController.text,
        hargaJual: hargaController.text,
        deskripsi: deskripsiController.text,
        isForm: isCheck == false ? '0' : '1',
        isJenisPerkara: isCheck1 == false ? '0' : '1');

    isLoading = false;
    if (response['status'] == true) {
      Navigator.of(context).pop(true);
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
      valuePilih1 = kategori.first;
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
    Map<String, dynamic> response = await repository.getProdukPerkara();

    isLoading = false;

    if (response['status'] == true) {
      listData = List<Map<String, dynamic>>.from(response['produkPerkara']);
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

  //Menghapus index produk perkara
  deleteJenisPerkara(int index) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.deleteProdukPerkara(id: listData[index]['id']);
    isLoading = false;
    if (response['status'] == true) {
      getData();
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
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: GlobalColors.mainColor,
            title: Text(
              'Tambah Dokumen Surat',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: GlobalColors.mainColor,
                labelColor: GlobalColors.mainColor,
                tabs: [
                  Tab(
                    child: Text(
                      'Buat Layanan',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        // color: Colors.white
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Daftar Dokumen Surat',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        // color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  // konten pertama
                  Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.grey.shade700,
                                            )),
                                        alignment: Alignment.center,
                                        child: DropdownButton<
                                            Map<String, dynamic>>(
                                          value: valuePilih1,
                                          hint: Text(
                                            'Pilih Layanan',
                                            style: GoogleFonts.ubuntu(
                                                // color: Colors.black
                                                ),
                                          ),
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
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
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 14),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Nama Layanan',
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
                                          hintStyle: GoogleFonts.ubuntu(
                                              color: Colors.black),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Harga Layanan',
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
                                          hintStyle: GoogleFonts.ubuntu(
                                              color: Colors.black),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Durasi Layanan (Menit)',
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
                                            hintText: 'Contoh: 30',
                                            hintStyle: GoogleFonts.ubuntu(
                                                color: Colors.black),
                                            border: const OutlineInputBorder(),
                                            suffixText: 'Menit'),
                                      ),
                                      Text(
                                        'Isilah kolom durasi jika layanan yang disediakan memiliki batas waktu, Kosongkan jika tidak ada durasi',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Deskripsi Layanan',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: deskripsiController,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelStyle: GoogleFonts.ubuntu(),
                                          hintText:
                                              'Masukkan Deskripsi Layanan',
                                          hintStyle: GoogleFonts.ubuntu(
                                              color: Colors.black),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: isCheck1,
                                          activeColor: GlobalColors.mainColor,
                                          onChanged: (isForm) {
                                            setState(() {
                                              isCheck1 = isForm;
                                            });
                                          }),
                                      Expanded(
                                        child: Text(
                                          'Centang jika Membutuhkan Form Informasi dari Klien',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: isCheck,
                                          activeColor: GlobalColors.mainColor,
                                          onChanged: (isJenisPerkara) {
                                            setState(() {
                                              isCheck = isJenisPerkara;
                                            });
                                          }),
                                      Expanded(
                                        child: Text(
                                          'Centang untuk Menambahkan Jenis Perkara Surat',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
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
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TambahPerkaraView(
                                                idProduk: valuePilih1?['id'],
                                              )));
                                },
                                child: Text('Tambah Surat',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.btnColor,
                                    ))),
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
                                onPressed: postProdukLayanan,
                                child: Text('Simpan',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.btnColor,
                                    ))),
                          )
                        ],
                      ),
                    ],
                  ),

                  // konten kedua
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: listData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, bottom: 10),
                                    alignment: Alignment.centerLeft,
                                    width: 500,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black38)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.description_outlined,
                                          color: GlobalColors.mainColor,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [                                        
                                              Text(listData[index]['ref_jenis_perkara_nama'],                                       
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  )),                                            
                                                Text(
                                                  listData[index]
                                                      ['harga_jual'],
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    // color: GlobalColors.mainColor,
                                                  ),
                                                ),                                             
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        IconButton(
                                            onPressed: () async {
                                              if (index != null &&
                                                  index >= 0 &&
                                                  index < listData.length) {
                                                await deleteJenisPerkara(index);
                                              }
                                            },
                                            // onPressed: () {},
                                            icon: const Icon(Icons.delete))
                                      ],
                                    ));
                              },
                            ),
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   height: 52,
                          //   margin: const EdgeInsets.only(
                          //       left: 26, right: 26, top: 10, bottom: 20),
                          //   child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //         backgroundColor: GlobalColors.mainColor,
                          //       ),
                          //       onPressed: () async {
                          //         var result = await Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) =>
                          //                     const TambahLayanaView()));
                          //         if (result != null) getData();
                          //       },
                          //       child: Text('Buat Layanan',
                          //           style: GoogleFonts.ubuntu(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w500,
                          //             color: GlobalColors.btnColor,
                          //           ))),
                          // )
                        ],
                      ),
                      // Visibility(
                      //   visible: isLoading,
                      //   child: const Positioned.fill(
                      //     child: Align(
                      //       alignment: Alignment.center,
                      //       child: CircularProgressIndicator(),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

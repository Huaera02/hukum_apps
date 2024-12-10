import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/repository/repository.dart';
// import 'package:loginn/ubah_data_mitra.dart';

class AddRekening extends StatefulWidget {
  const AddRekening({super.key});

  @override
  State<AddRekening> createState() => _AddRekeningState();
}

class _AddRekeningState extends State<AddRekening> {
  bool isLoading = false;
  Repository repository = Repository();
  final noRekController = TextEditingController();
  final atasNamaController = TextEditingController();

  Map<String, dynamic>? valuePilih;
  Map<String, dynamic>? valuePilihMetode;
  List<Map<String, dynamic>> dataBank = [];
  List<Map<String, dynamic>> dataMetode = [];

  postDataRekening() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.postRekeningMitra(
      idBank: valuePilih?['id'],
      noRek: noRekController.text,
      atasNama: atasNamaController.text,
    );
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

  getDataMetode() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getPembayaranMitra();

    isLoading = false;

    if (response['status'] == true) {
      dataMetode = List<Map<String, dynamic>>.from(response['pembayaran']);
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
    Map<String, dynamic> response = await repository.getBankMitra();

    isLoading = false;

    if (response['status'] == true) {
      dataBank = List<Map<String, dynamic>>.from(response['bank']);
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
    getDataMetode();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Tambah Rekening',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
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
                        margin:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih Metode Pembayaran',
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
                                value: valuePilihMetode,
                                hint: Text(
                                  'Pilih Metode pembayaran',
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
                                onChanged: (newValue2) {
                                  setState(() {
                                    valuePilihMetode = newValue2;
                                  });
                                },
                                items: dataMetode.map((valueItem2) {
                                  return DropdownMenuItem(
                                    value: valueItem2,
                                    child: Text(
                                      valueItem2['nama'],
                                      style: GoogleFonts.ubuntu(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Pilih Transfer Bank',
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
                                value: valuePilih,
                                hint: Text(
                                  'Nama Bank',
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
                                items: dataBank.map((valueItem1) {
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

                            const SizedBox(height: 20),
                            Text(
                              'Masukkan No Rekening',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: noRekController,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: 73098765455689',
                                hintStyle: GoogleFonts.ubuntu(
                                    // color: Colors.black
                                    ),
                                border: const OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Nama Pemilik Rekening',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: atasNamaController,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: Huaera',
                                hintStyle: GoogleFonts.ubuntu(
                                    // color: Colors.black
                                    ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   height: 52,
                      //   margin: const EdgeInsets.only(
                      //       left: 26, right: 26, top: 125, bottom: 20),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: GlobalColors.mainColor,
                      //     ),
                      //     onPressed: postDataRekening,
                      //     // () {
                      //     //   Navigator.push(context,
                      //     // MaterialPageRoute(builder: (context) => const UbahDataMitraView()));
                      //     // },
                      //     child: Text(
                      //       'Simpan',
                      //       style: GoogleFonts.ubuntu(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w500,
                      //         color: GlobalColors.btnColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                    onPressed: postDataRekening,
                    // () {
                    //   Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const UbahDataMitraView()));
                    // },
                    child: Text(
                      'Simpan',
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
      ),
    );
  }
}

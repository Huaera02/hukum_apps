import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';
// import 'package:loginn/ubah_data_mitra.dart';

class AddKeahlian extends StatefulWidget {
  const AddKeahlian({super.key});

  @override
  State<AddKeahlian> createState() => _AddKeahlianState();
}

class _AddKeahlianState extends State<AddKeahlian> {
  bool isLoading = false;
  Repository repository = Repository();
  final noKasusController = TextEditingController();
  final pengadilanController = TextEditingController();
  final tahunController = TextEditingController();
  final catatanController = TextEditingController();

  Map<String, dynamic>? valuePilih;
  List<Map<String, dynamic>> dataKlasifikasi = [];

  postDataPengalaman() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.postPengalamanMitra(
      klasifikasi: valuePilih?['id'],
      noKasus: noKasusController.text,
      pengadilan: pengadilanController.text,
      tahun: tahunController.text,
      catatan: catatanController.text,
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

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getPengalamanMitra();

    isLoading = false;

    if (response['status'] == true) {
      dataKlasifikasi =
          List<Map<String, dynamic>>.from(response['klasifikasi']);
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
          'Tambah Pengalaman',
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
                            // const SizedBox(height: 20),
                            Text(
                              'Pilih Bidang Keahlian',
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

                            const SizedBox(height: 20),
                            Text(
                              'Masukkan catatan Permasalahan yang berkaitan dengan Bidang Keahlian',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: catatanController,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: Pembunuhan Berencana',
                                hintStyle: GoogleFonts.ubuntu(
                                    // color: Colors.black
                                    ),
                                border: const OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 20),
                            Text(
                              'Masukkan No Kasus',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: noKasusController,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText:
                                    'Contoh: Nomor: 89/Pid.Sus-FPK/2018/PN.Mks',
                                hintStyle: GoogleFonts.ubuntu(
                                    // color: Colors.black
                                    ),
                                border: const OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Nama Pengadilan yang Menangani Kasus',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: pengadilanController,
                              style: const TextStyle(
                                fontSize: 14,
                                // color: Colors.black
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: Pengadilan Negeri Makassar',
                                hintStyle: GoogleFonts.ubuntu(
                                    // color: Colors.black
                                    ),
                                border: const OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Tahun Kasus',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: tahunController,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: 2020',
                                hintStyle: GoogleFonts.ubuntu(
                                    //   color: Colors.black
                                    ),
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
                  margin: const EdgeInsets.only(
                      left: 26, right: 26, top: 10, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                    ),
                    onPressed: postDataPengalaman,
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/repository/repository.dart';


class AddPendidikan extends StatefulWidget {
  const AddPendidikan({super.key});

  @override
  State<AddPendidikan> createState() => _AddPendidikanState();
}

class _AddPendidikanState extends State<AddPendidikan> {
  bool isLoading = false;
  Repository repository = Repository();
  final jenjangController = TextEditingController();
  final prodiController = TextEditingController();
  final jurusanController = TextEditingController();
  final asalPtController = TextEditingController();
  final thnLulusController = TextEditingController();

  postDataPendidikan() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.postPendidikanMitra(
        jenjang: jenjangController.text,
        prodi: prodiController.text,
        jurusan: jurusanController.text,
        perguruanTinggi: asalPtController.text,
        thnLulus: thnLulusController.text);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Tambah Pendidikan',
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Masukkan Jenjang Pendidikan',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: jenjangController,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                // labelText: 'Jenjang Pendidikan',
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: S1',
                                hintStyle: GoogleFonts.ubuntu(),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Prodi',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: prodiController,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                // labelText: 'Tahun Lulus',
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: Hukum Pidana',
                                hintStyle: GoogleFonts.ubuntu(),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Jurusan',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: jurusanController,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                // labelText: 'Tahun Lulus',
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: Hukum',
                                hintStyle: GoogleFonts.ubuntu(),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Asal Perguruan Tinggi',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: asalPtController,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                // labelText: 'Perguruan Tinggi',
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: Universitas Hasanuddin',
                                hintStyle: GoogleFonts.ubuntu(),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Masukkan Tahun Lulus',
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: thnLulusController,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // labelText: 'Tahun Lulus',
                                labelStyle: GoogleFonts.ubuntu(),
                                hintText: 'Contoh: 2020',
                                hintStyle: GoogleFonts.ubuntu(),
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
                    onPressed: postDataPendidikan,
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

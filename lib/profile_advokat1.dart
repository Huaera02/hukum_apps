import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/pilih_layanan1.dart';
import 'package:loginn/repository.dart';

class ProfileAdvokat1View extends StatefulWidget {
  final String idMitra;
  const ProfileAdvokat1View({super.key, required this.idMitra});

  @override
  State<ProfileAdvokat1View> createState() => _ProfileAdvokat1ViewState();
}

class _ProfileAdvokat1ViewState extends State<ProfileAdvokat1View> {
  bool isLoading = false;
  Repository repository = Repository();
  Map<String, dynamic> listData = {};

  // Map<String, dynamic> listDataPendidikan = {};

  List<Map<String, dynamic>> listDataPendidikan = [];

  List<Map<String, dynamic>> dataPengalaman = [];

  List<Map<String, dynamic>> dataKeahlian = [];

  // Map<String, dynamic> dataPengalaman = {};

  // Map<String, dynamic> dataKeahlian = {};

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.getProfileAdvokat(idAdvokat: widget.idMitra);

    isLoading = false;

    if (response['status'] == true) {
      listData = response['dataPribadi'];
      // listDataPendidikan = response['pendidikan'];
      listDataPendidikan =
          List<Map<String, dynamic>>.from(response['pendidikan']);
      dataKeahlian = List<Map<String, dynamic>>.from(response['keahlian']);
      dataPengalaman = List<Map<String, dynamic>>.from(response['pengalaman']);
      // dataPengalaman = response['pengalaman'];
      // dataKlasifikasi = List<Map<String, dynamic>>.from(response['refklasifikasi']);
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Profile Advokat',
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 50.0, bottom: 10),
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Nur.png',
                                width: 150,
                                height: 150,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                listData['nama'] ?? '',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.group,
                                    size: 20,
                                    color: GlobalColors.mainColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    listData['tipe_kontak_nama'] ?? '',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: GlobalColors.mainColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    listData['kabkota'] ?? '',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 25,
                                  color: GlobalColors.mainColor,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  'Profile',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              listData['profil'] ?? '',
                              style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),

                      //Bidang Keahlian
                      Container(                        
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_library_rounded,
                                    size: 25,
                                    color: GlobalColors.mainColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Bidang Keahlian',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '~ ${dataKeahlian[index]['nama_keahlian'] ?? ''}',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: dataKeahlian.length,
                            ),
                          ],
                        ),
                      ),

                      // Bagian Pengalaman
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.work_history,
                                    size: 25,
                                    color: GlobalColors.mainColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Pengalaman',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              dataPengalaman[index]
                                                  ['nama_klasifikasi'],
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text('-',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(dataPengalaman[index]['catatan'],
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                      Text(dataPengalaman[index]['nokasus'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text(dataPengalaman[index]['pengadilan'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text(dataPengalaman[index]['tahun'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: dataPengalaman.length,
                            ),
                          ],
                        ),
                      ),

                      // Bagian Pendidikan
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.school,
                                    size: 25,
                                    color: GlobalColors.mainColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Pendidikan',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              listDataPendidikan[index]
                                                  ['jenjang'],
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(listDataPendidikan[index]['prodi'],
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                      Text(listDataPendidikan[index]['pt'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          )),
                                      Text(
                                          listDataPendidikan[index]
                                              ['tahun_selesai'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w100,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: listDataPendidikan.length,
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
                      left: 26, right: 26, top: 10, bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PilihLayanan1View(
                                    mitra: listData,
                                  )));
                    },
                    child: Text(
                      'Konsultasi Sekarang',
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

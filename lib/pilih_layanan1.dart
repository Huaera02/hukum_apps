import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/masukkan_masalah.dart';
import 'package:loginn/masukkan_masalahNotaris.dart';
import 'package:loginn/repository.dart';

class PilihLayanan1View extends StatefulWidget {
  final  Map<String,dynamic> mitra;
  const PilihLayanan1View({super.key, required this.mitra});

  @override
  State<PilihLayanan1View> createState() => _PilihLayanan1ViewState();
}

class _PilihLayanan1ViewState extends State<PilihLayanan1View> {
  int _value = 1;

  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listLayanan = [];

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getLayananMitra(
      idKontak: widget.mitra['id']
    );

    isLoading = false;

    if (response['status'] == true) {
      listLayanan = List<Map<String, dynamic>>.from(response['kategori']);
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
            'Pilih Layanan',
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
                  child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: listLayanan.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 20, top: 20),
                                      alignment: Alignment.centerLeft,
                                      width: 500,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black38)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.gavel_rounded,
                                            color: GlobalColors.mainColor,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(listLayanan[index]['nama'],
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Text(
                                                  '${listLayanan[index]['durasi']} Menit',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        GlobalColors.mainColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Rp.${listLayanan[index]['harga_jual']}',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: GlobalColors.mainColor,
                                            ),
                                          ),
                                          // const SizedBox(width: 1,),
                                          Radio(
                                              value: index + 1,
                                              groupValue: _value,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = value as int;
                                                });
                                              })
                                        ],
                                      ));
                                })
                          ],
                        )),
                  ]),
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
                        (widget.mitra['tipe_kontak_nama'] != 'Notaris')
                        ?Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                 MasukkanMasalahmuView(
                                      mitra: widget.mitra,
                                      produk: listLayanan[_value - 1],
                                    )))
                                    :Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                 MasukkanMasalahNotarisView(
                                      mitra: widget.mitra,
                                      produk: listLayanan[_value - 1],
                                    )));
                      },
                      child: Text('Selanjutnya',
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
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/form_detail/form.dart';
import 'package:loginn/form_detail/masukkan_masalah.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/warna/global_colors.dart';

class PilihLayananView extends StatefulWidget {
  final Map<String, dynamic> mitra;

  const PilihLayananView({super.key, required this.mitra});

  @override
  State<PilihLayananView> createState() => _PilihLayananViewState();
}

class _PilihLayananViewState extends State<PilihLayananView> {
  int _value = 1;
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listLayanan = [];
  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.getLayananMitra(idKontak: widget.mitra['id']);

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
                  child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: listLayanan.length,
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
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black38)),
                            child: Row(
                              children: [
                                ((listLayanan[index]['id_kategori'] ?? '') !=
                                        '11')
                                    ? Icon(
                                        Icons.chat_outlined,
                                        color: GlobalColors.mainColor,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.description_outlined,
                                        color: GlobalColors.mainColor,
                                        size: 30,
                                      ),
                                // Icon(
                                //   Icons.gavel_rounded,
                                //   color: GlobalColors.mainColor,
                                //   size: 30,
                                // ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(listLayanan[index]['nama'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      if ((listLayanan[index]['durasi'] ??
                                              '') !=
                                          '0')
                                        Text(
                                          '${listLayanan[index]['durasi']} Menit',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: GlobalColors.mainColor,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                if ((listLayanan[index]['harga_jual'] ?? '') !=
                                    '0')
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
                      }),
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MasukkanMasalahmuView(
                        //               mitra: widget.mitra,
                        //               produk: listLayanan[_value - 1],
                        //               type: listLayanan[_value - 1]
                        //                       ['is_jenis_perkara']??'',
                        //             )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MasukkanMasalahmuView(
                                      mitra: widget.mitra,
                                      produk: listLayanan[_value - 1],
                                      type:listLayanan[_value-1]['is_jenis_perkara'],                                      
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

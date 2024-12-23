import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/warna/global_colors.dart';

class PilihPerkaraView extends StatefulWidget {
  final Map<String, dynamic> mitra;

  const PilihPerkaraView({super.key, required this.mitra});

  @override
  State<PilihPerkaraView> createState() => _PilihPerkaraViewState();
}

class _PilihPerkaraViewState extends State<PilihPerkaraView> {
  int _value = 1;
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> perkara = [];

getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getPerkara();

    isLoading = false;

    if (response['status'] == true) {
      perkara = List<Map<String, dynamic>>.from(response['perkara']);     
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
            'Pilih Jenis Perkara',
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
                      shrinkWrap: true,
                      itemCount: perkara.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                            padding: const EdgeInsets.only(left: 20,),
                            alignment: Alignment.centerLeft,
                            width: 500,
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black38)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [                                                               
                                  Text(
                                    perkara[index]['nama'],
                                    // 'Hukum Keluarga',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      // color: GlobalColors.mainColor,
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
                  margin: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: () {},
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

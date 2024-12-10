import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/repository/repository.dart';
// import 'package:loginn/tambah_layanan.dart';
import 'package:loginn/layanan_mitra/tambah_rekening.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RekeningView extends StatefulWidget {
  final String branchId;
  const RekeningView({super.key, required this.branchId});

  @override
  State<RekeningView> createState() => _RekeningViewState();
}

class _RekeningViewState extends State<RekeningView> {
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listBank = [];

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getSemuaRekeningMitra(
      branchId: widget.branchId
    );

    isLoading = false;

    if (response['status'] == true) {
      listBank = List<Map<String, dynamic>>.from(response['rekening']);
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

  //Menghapus index layanan
  deleteDataLayanan(int index) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.deleteRekening(id: listBank[index]['id']);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Daftar Rekening',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listBank.length,
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
                              border: Border.all(color: Colors.black38)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.card_membership,
                                color: GlobalColors.mainColor,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(listLayanan[index]['nama'],
                                    Text(listBank[index]['ref_bank_nama']??'',
                                        // 'Chat',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text(
                                      listBank[index]['norek']??'',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        // color: GlobalColors.mainColor,
                                      ),
                                    ),
                                    Text(
                                      listBank[index]['atas_nama']??'',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
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
                                        index < listBank.length) {
                                      await deleteDataLayanan(index);
                                    }
                                  },
                                  // onPressed: () {},
                                  icon: const Icon(Icons.delete))
                            ],
                          ));
                    },
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
                      onPressed: () async {
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddRekening()));
                        if (result != null) getData();
                      },
                      child: Text('Buat Metode Pembayaran',
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
        ),
      ),
    );
  }
}

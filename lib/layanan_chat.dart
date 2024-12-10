import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';
import 'package:loginn/tambah_layanan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayananChatView extends StatefulWidget {
  const LayananChatView({super.key});

  @override
  State<LayananChatView> createState() => _LayananChatViewState();
}

class _LayananChatViewState extends State<LayananChatView> {
  String role = '';
  SharedPreferences? pref;
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listLayanan = [];

  void init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      role = pref.getString('tipeKontakAlias') ?? '';
    });
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getSemuaLayananMitra();

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

  //Menghapus index layanan
  deleteDataLayanan(int index) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response =
        await repository.deleteLayananMitra(id: listLayanan[index]['id']);
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
          'Daftar Layanan',
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
                    itemCount: listLayanan.length,
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
                              ((listLayanan[index]['id_kategori'] ??'') !='6') ?                                                   
                              Icon(
                                Icons.chat_outlined,
                                color: GlobalColors.mainColor,
                                size: 30,
                              ):                            
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(listLayanan[index]['nama'],
                                    Text(listLayanan[index]['nama'],
                                        // 'Chat',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                        if (listLayanan[index]['deskripsi'] !=
                                            null)
                                          Text(
                                            listLayanan[index]['deskripsi'],                                        
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              // color: GlobalColors.mainColor,
                                            ),
                                          ),
                                    Row(
                                      children: [
                                        if ((listLayanan[index]['id_kategori'] ??'') !='6')
                                        Text(
                                          'Rp.${listLayanan[index]['harga_jual']}',
                                          // listLayanan[index]['harga_jual'],
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: GlobalColors.mainColor,
                                          ),
                                        ),                                     
                                        if ((listLayanan[index]['id_kategori'] ??'') !='6')
                                          Text(
                                            '/ ${listLayanan[index]['durasi']} Menit',                                        
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: GlobalColors.mainColor,
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                  onPressed: () async {
                                    if (index != null &&
                                        index >= 0 &&
                                        index < listLayanan.length) {
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
                      onPressed: () async{
                       var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TambahLayanaView()));
                                    if (result!=null)getData();
                      },
                      child: Text('Buat Layanan',
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

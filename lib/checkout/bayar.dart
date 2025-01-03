import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/checkout/va.dart';
import 'package:loginn/metode_bayar/pilih_metode_pembayaran.dart';
import 'package:loginn/repository/repository.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranView extends StatefulWidget {
  final Map<String, dynamic> mitra;
  final Map<String, dynamic> produk;
  final Map<String, dynamic> klasifikasi;
  final Map<String, dynamic> jenisPerkara;
  final String judul;
  final String deskripsi;
  const PembayaranView({
    super.key,
    required this.mitra,
    required this.produk,
    required this.klasifikasi,
    required this.jenisPerkara,
    required this.judul,
    required this.deskripsi,
  });

  @override
  State<PembayaranView> createState() => _PembayaranViewState();
}

class _PembayaranViewState extends State<PembayaranView> {
  Map<String, dynamic> metodeBayar = {};
  bool isLoading = false;
  Repository repository = Repository();

  List<Map<String, dynamic>> listData = [];

  String nama = '';
  String email = '';

  postDataMasalah() async {
    if (metodeBayar.isEmpty) {
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
                  'Silahkan Memilih Metode Pembayaran Terlebih Dahulu',
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
      return;
    }
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.postDetailMasalah1(
        idMitra: widget.mitra['id'],
        idProduk: widget.produk['id'],
        harga: widget.produk['harga_jual'],
        qyt: '1',
        durasi: widget.produk['durasi'],
        diskon: '0',
        subtotal: widget.produk['harga_jual'],
        total: widget.produk['harga_jual'],
        status: '0',
        tanggal: DateTime.now().toString(),
        klasifikasi: widget.klasifikasi['id'] ?? '',
        judul: widget.judul,
        idMetodeBayar: metodeBayar['id_metode_pembayaran'],
        idRekening: metodeBayar['id'],
        deskripsi: widget.deskripsi,
        idJenisPerkara: widget.jenisPerkara['id']);
    isLoading = false;
    if (response['status'] == true) {
      // Navigator.of(context).pop(true);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VirtualAccountView(
          idPenjualan: response['data'],
          total: widget.produk['harga_jual'],
          createdAt: DateTime.now(),
          branchId: widget.mitra['sys_branches_id'],
          bankId: metodeBayar['ref_bank_id'],
        ),
      ));
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

    SharedPreferences pref = await SharedPreferences.getInstance();

    nama = pref.getString("nama") ?? '';
    email = pref.getString("email") ?? '';
    isLoading = false;
    setState(() {});
  }

  getData1() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getProdukPerkara1(
        idPerkara: widget.jenisPerkara['id']);

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

  @override
  void initState() {
    super.initState();
    getData();
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Checkout Pesanan',
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
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(96, 63, 35, 35),
                                blurRadius: 6,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: GlobalColors.mainColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Informasi User',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        nama,
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      email,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),                  
                      Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(96, 63, 35, 35),
                                  blurRadius: 6,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.description_outlined,
                                    color: GlobalColors.mainColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Informasi Surat',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.jenisPerkara['ref_jenis_perkara_nama'] ?? '',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Rp. ${widget.jenisPerkara['harga_jual']}',                                     
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.groups_3_rounded,
                                  color: GlobalColors.mainColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Informasi Advokat',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.mitra['nama'] ?? '',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.mitra['email'] ?? '',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(96, 63, 35, 35),
                                blurRadius: 6,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.cases_outlined,
                                  color: GlobalColors.mainColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Rincian Pesanan',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.produk['nama'] ??'',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                // Text(
                                //   'Rp. ${widget.produk['harga_jual'] ?? ''}',
                                //   style: GoogleFonts.ubuntu(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w300,
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        )),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 15, right: 15),
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6,
                        ),
                      ]),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      color: GlobalColors.mainColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('Metode Pembayaran',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () async {
                                      var result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MetodePembayaranView(
                                                    branchId: widget.mitra[
                                                        'sys_branches_id'])),
                                      );
                                      if (result != null) {
                                        setState(() {
                                          metodeBayar = result;
                                        });
                                      }
                                    },
                                    child: Text('Pilih',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          color: GlobalColors.mainColor,
                                          fontWeight: FontWeight.w500,
                                        )))
                              ],
                            ),
                            Text(
                                metodeBayar.isNotEmpty
                                    ? metodeBayar['ref_bank_nama']
                                    : 'Belum memilih metode Pembayaran',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(15),
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6,
                        ),
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Rp. ${widget.jenisPerkara['harga_jual'] ?? ''}',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biaya Admin',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Rp. 0',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Rp. ${widget.jenisPerkara['harga_jual']}',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Rp. ${widget.jenisPerkara['harga_jual']}',
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColors.mainColor,
                        ),
                        onPressed: postDataMasalah,
                        // () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const VirtualAccountView()),
                        //   );
                        // },
                        child: Text(
                          'Buat',
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
      )),
    );
  }
}

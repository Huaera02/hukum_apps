import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';
import 'package:loginn/riwayat_mitra.dart';
import 'package:loginn/riwayat_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VirtualAccountView extends StatefulWidget {
  final String branchId;
  final String bankId;
  final String total;
  final DateTime createdAt;
  const VirtualAccountView({
    super.key,
    required this.branchId,
    required this.bankId,
    required this.total,
    required this.createdAt,
  });

  @override
  State<VirtualAccountView> createState() => _VirtualAccountViewState();
}

class _VirtualAccountViewState extends State<VirtualAccountView> {
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listDetailBank = [];

  String role = '';
  SharedPreferences? pref;

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
    Map<String, dynamic> response = await repository.getDetailRekening(
        bankId: widget.bankId, branchId: widget.branchId);

    isLoading = false;

    if (response['status'] == true) {
      listDetailBank = List<Map<String, dynamic>>.from(response['rekening']);
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
    init();
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
          'Pembayaran',
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
                    itemCount: listDetailBank.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              // width: 600,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Bayar Dalam',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),

                                      // const SizedBox(width: 185,),
                                      Time(
                                          jamSelesai: widget.createdAt
                                              .add(const Duration(days: 1))),
                                      // Text(
                                      //   // widget.createdAt.add(Duration(days: 1));
                                      //     widget.createdAt.toString(),
                                      //     // '23:56:10',
                                      //     style: GoogleFonts.ubuntu(
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w500,
                                      //         color: GlobalColors.mainColor)),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total Pembayaran',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      // const SizedBox(
                                      //   width: 150,
                                      // ),
                                      Text('Rp. ${widget.total}',
                                          // 'Rp. 52.000',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: GlobalColors.mainColor)),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Metode Pembayaran',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),

                                      // const SizedBox(width: 185,),
                                      Text('Transfer Bank',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: GlobalColors.mainColor)),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Nama Bank',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      // const SizedBox(
                                      //   width: 150,
                                      // ),
                                      Text(
                                          listDetailBank[index]
                                                  ['ref_bank_nama'] ??
                                              '',
                                          // 'BRI',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: GlobalColors.mainColor)),
                                    ],
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 500,
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Text('Lakukan pembayaran ke rekening berikut:',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(listDetailBank[index]['norek'] ?? '',
                                    // '73098765432124',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: GlobalColors.mainColor)),
                                Text(listDetailBank[index]['atas_nama'] ?? '',
                                    // 'Huaera',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: GlobalColors.mainColor)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: InkWell(
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38)),
                                child: Center(
                                    child: Text(
                                  'Upload Bukti Pembayaran',
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(
                    left: 26, right: 26, bottom: 20, top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,
                  ),
                  onPressed: () {
                    role == 'advokat' || role == 'notaris'
                        ?
                        // Navigator.popUntil(
                        //     context,
                        //     ModalRoute.withName('/RiwayatMitraView'),
                        //   );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RiwayatMitraView()))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HistoryView()));
                  },
                  child: Text(
                    'Konfirmasi Pembayaran',
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
      )),
    );
  }
}

class Time extends StatefulWidget {
  final DateTime? jamSelesai;
  const Time({
    super.key,
    required this.jamSelesai,
  });

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Duration? _timeRemaining;
  Timer? timer;

  reduceTime() {
    int reduction = 1;
    final int seconds = _timeRemaining!.inSeconds - reduction;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      _timeRemaining = Duration(seconds: seconds);
    }
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    _timeRemaining = widget.jamSelesai!.difference(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => reduceTime());
  }

  buildTime() {
    try {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final String hours = twoDigits(_timeRemaining!.inHours);
      final String minutes = twoDigits(_timeRemaining!.inMinutes.remainder(60));
      final String seconds = twoDigits(_timeRemaining!.inSeconds.remainder(60));

      return '$hours:$minutes:$seconds';
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.jamSelesai == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Text(
              buildTime(),
              style: GoogleFonts.ubuntu(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}

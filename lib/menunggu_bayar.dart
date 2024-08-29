import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/bayar.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/riwayat_mitra.dart';
// import 'package:loginn/riwayat_mitra.dart';
import 'package:loginn/riwayat_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenungguBayarView extends StatefulWidget {
  const MenungguBayarView({super.key});

  @override
  State<MenungguBayarView> createState() => _MenungguBayarViewState();
}

class _MenungguBayarViewState extends State<MenungguBayarView> {
  String role = '';
  SharedPreferences? pref;


  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      role = pref.getString('tipeKontakAlias') ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: GlobalColors.mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 150),            
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.watch_later_outlined, 
                    size: 120, color: GlobalColors.mainColor,),
                    // Image.asset('assets/images/Succes Icon.png',
                    // width: 120,
                    // height: 120,),
                    // const SizedBox(height: 30,),
                    Text('Menunggu Pembayaran',
                    style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.mainColor
                    ),),
                    const SizedBox(height: 50),
                    Text('Mohon Bayar Sebesar Rp. 52.000 sebelum 24 jam',
                    style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: GlobalColors.mainColor
                    ),
                    textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 320,),
            Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsets.only(left: 26, right: 26, ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.mainColor,
                ),
                onPressed: () {
                  role == 'advokat' || role == 'notaris'?
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const RiwayatMitraView()))
                : Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const HistoryView()));
                },
                child: Text('Konsultasi Saya',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),),
              ),      
            ),
          ],
        ),
      ),
    );
  }
}
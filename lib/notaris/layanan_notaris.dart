import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';

class LayananNotarisView extends StatefulWidget {
  const LayananNotarisView({super.key});

  @override
  State<LayananNotarisView> createState() => _LayananNotarisViewState();
}

class _LayananNotarisViewState extends State<LayananNotarisView> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Pilih Layanan Notaris',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20, ),
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                alignment: Alignment.centerLeft,
                height: 136,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Otentik.png',
                    width: 70,
                    height: 120,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Pembuatan Akta Otentik',
                        style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5),
                        Text('Akta Otentik seperti Akta jual\nbeli, hibah, waris, perjanjian\nmenyewa, perjanjian kredit,\nperjanjian kemitraan, dan\nlain-lain.',
                        style: GoogleFonts.ubuntu(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54))
                      ]
                    ),
                    Radio(
                      value: 1, 
                      groupValue: _value, 
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      })
                  ]
                )
              ),

              //Pengesahan Dokumen Hukum
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, ),
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                alignment: Alignment.centerLeft,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Pengesahan Dokumen Hukum.png',
                    width: 70,
                    height: 140,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Pengesahan Dokumen Hukum',
                        style: GoogleFonts.ubuntu(
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,),
                        const SizedBox(height: 5),
                        Text('Dokumen-dokumen hukum\nseperti perjanjian,kontrak,\ndan surat kuasa.',
                        style: GoogleFonts.ubuntu(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54))
                      ]
                    ),
                    Radio(
                      value: 2, 
                      groupValue: _value, 
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      })
                  ]
                )
              ),

              //Pendaftaran Perkara Hukum
               Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, ),
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                alignment: Alignment.centerLeft,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Pendaftaran Perkara Hukum.png',
                    width: 70,
                    height: 140,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Pendaftaran Perkara Hukum',
                        style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,),
                        const SizedBox(height: 5),
                        Text('Notaris bisa mendaftarkan perjanjian\ntertentuke instansi yang berwenang,\nseperti BPN dalam kasus PPAT\nuntuk pendaftaran hak atas tanah.',
                        style: GoogleFonts.ubuntu(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54))
                      ]
                    ),
                    Radio(
                      value: 3, 
                      groupValue: _value, 
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      })
                  ]
                )
              ),


              //Pengesahan Tanda Tangan
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, ),
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                alignment: Alignment.centerLeft,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Pengesahan Tanda Tangan.png',
                    width: 70,
                    height: 120,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Pengesahan Tanda Tangan',
                        style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,),
                        const SizedBox(height: 5),
                        Text('Notaris dan PPAT mengesahkan\ntanda tangan di dokumen-dokumen\npenting.',
                        style: GoogleFonts.ubuntu(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54))
                      ]
                    ),
                    Radio(
                      value: 4, 
                      groupValue: _value, 
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      })
                  ]
                )
              ),

              //Penyusunan Perjanjian Khusus
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, ),
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                alignment: Alignment.centerLeft,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Penyusunan Perjanjian Khusus.png',
                    width: 70,
                    height: 120,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Penyusunan Perjanjian Khusus',
                        style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5),
                        Text('Penyusunan perjanjian khusus dibuat\nsesuai dengan kebutuhan klien,\nseperti perjanjian pra-nikah,dan\nsebagainya.',
                        style: GoogleFonts.ubuntu(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54))
                      ]
                    ),
                    Radio(
                      value: 5, 
                      groupValue: _value, 
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      })
                  ]
                )
              ),


              //Pengurusan Akta Perusahaan
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, ),
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                alignment: Alignment.centerLeft,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black38)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Pengurusan Akta Perusahaan.png',
                    width: 70,
                    height: 70,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Pengurusan Akta Perusahaan',
                        style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5),
                        Text(' Notaris juga dapat membantu dalam\npembuatan akta-akta yang berkaitan\ndengan pendirian perusahaan dan\nperubahan status perusahaan.',
                        style: GoogleFonts.ubuntu(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54))
                      ]
                    ),
                    Radio(
                      value: 6, 
                      groupValue: _value, 
                      onChanged: (value){
                        setState(() {
                          _value = value as int;
                        });
                      })
                  ]
                )
              ),

              Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.mainColor,
                ),
                onPressed: () {
                //   Navigator.push(context, 
                // MaterialPageRoute(builder: (context) => const BottomNavView()));
                },
                child: Text('Selanjutnya',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.btnColor,
                ),),
              ),      
            ),
            ],
          )),
    );
  }
}
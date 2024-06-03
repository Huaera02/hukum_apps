import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/bayar.dart';
import 'package:loginn/global_colors.dart';

class MasukkanMasalahmuView extends StatefulWidget {
  const MasukkanMasalahmuView({super.key});

  @override
  State<MasukkanMasalahmuView> createState() => _MasukkanMasalahmuViewState();
}

class _MasukkanMasalahmuViewState extends State<MasukkanMasalahmuView> {

  String? valueChoose;
  List<String> listItem = [
    "Administrasi Negara", 
    "Asuransi", 
    "Bisnis dan Perusahaan",
    "Hak Intelektual",
    "Hutang Piutang",
    "Keluarga",
    "Pertanahan dan Properti",
    "Pidana",
    "Teknologi Informasi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Detail Masalah',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey.shade700,
                      )
                    ),
                    alignment: Alignment.center,
                    child: DropdownButton(
                      value: valueChoose,
                      hint: Text('Pilih Kategori Hukum', 
                      style: GoogleFonts.ubuntu(
                        color: Colors.black
                      ),),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                      onChanged: (newValue){
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem, 
                          style: GoogleFonts.ubuntu(fontSize: 14),),
                        );
                      }).toList(),
                      ),
                  ),

                  const SizedBox(height: 15,),
                  TextFormField(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.ubuntu(
                      ),
                      hintText: 'Judul / Topik Masalah',
                      hintStyle: GoogleFonts.ubuntu(
                        color: Colors.black
                      ),
                      border: const OutlineInputBorder(), 
                    ),
                  ),

                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 200,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      keyboardType: TextInputType.text,
                      textAlignVertical: TextAlignVertical.top, 
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.ubuntu(),
                        hintText: 'Deskripsi Masalah',
                        hintStyle: GoogleFonts.ubuntu(
                          color: Colors.black
                        ),
                        border: const OutlineInputBorder(), 
                      ),
                      maxLines: null, 
                      expands: true,
                    ),
                  )

                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 52,
              margin: const EdgeInsets.only(left: 26, right: 26, top: 285, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.mainColor,
                ),
                onPressed: () {
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const PembayaranView()));
                },
                child: Text('Konfirmasi',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.btnColor,
                ),),
              ),      
            ),
          ],
        ),)
    );
  }
}
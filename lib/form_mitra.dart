import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/profile_mitra.dart';

class FormMitraView extends StatelessWidget {
  const FormMitraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Lengkapi Informasi',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: 500,
            decoration: BoxDecoration(
              color: GlobalColors.mainColor.withOpacity(0.5),
              ),
            child: Text('     Informasi Pribadi',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white)
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [                
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    labelStyle: GoogleFonts.ubuntu(
                    ),
                    hintText: 'Masukkan Nama',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                    
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Tempat, Tanggal Lahir',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan Tempat, Tanggal Lahir',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan Alamat',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan Email',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'No Telepon',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan No Telepon',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10,),
          Container(
            width: 500,
            decoration: BoxDecoration(
              color: GlobalColors.mainColor.withOpacity(0.5),
              ),
            child: Text('     Kualifikasi Pendidikan',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white)
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [                
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Gelar Hukum',
                    labelStyle: GoogleFonts.ubuntu(
                    ),
                    hintText: 'Masukkan Gelar Hukum',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                    
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Asal Perguruan Tinggi',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan Asal Perguruan Tinggi',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'No. Registrasi Profesi (jika ada)',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan No. Registrasi Profesi',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Pengalaman Kerja (yang relevan)',
                    labelStyle: GoogleFonts.ubuntu(),
                    hintText: 'Masukkan Pengalaman Kerja',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: const UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 500,
            decoration: BoxDecoration(
              color: GlobalColors.mainColor.withOpacity(0.5),
              ),
            child: Text('     Dokumen Identifikasi',
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white)
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  color: Colors.white
                  ),
                child: const Icon(Icons.upload_file_outlined, 
                size: 25,
                color: Colors.black54)
              ),

              Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  color: Colors.white
                  ),
                child: Text('KTP',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54
                ),),
              ),

              Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  color: Colors.white
                  ),
                child: Text('Sertifikat',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54
                ),),
              ),
            ],
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
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const ProfileMitraView()));
                },
                child: Text('Selesai',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.btnColor,
                ),),
              ),      
            ),
        ],
      ),
    );
  }
}
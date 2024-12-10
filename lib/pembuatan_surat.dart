import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class BuatSuratView extends StatefulWidget {
  const BuatSuratView({super.key});

  @override
  State<BuatSuratView> createState() => _BuatSuratViewState();
}

class _BuatSuratViewState extends State<BuatSuratView> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Pembuatan Surat',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Surat Gugatan',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 1', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Jawaban Gugatan',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 2', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Surat Replik',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 3', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                      
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Surat Duplik',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 4', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Daftar Bukti',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 5', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Surat Kesimpulan',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 6', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Surat Somasi',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 7', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Pembuatan Surat Perjanjian',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 8', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20,),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Kontrak Memori Banding',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 9', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                
                      Container(
                      margin: const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, top: 20),
                      alignment: Alignment.centerLeft,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.black38)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: GlobalColors.mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text('Kontrak Memor Kasasi',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight.w500,
                                )),
                          ),                    
                          // const SizedBox(width: 1,),
                          Radio(
                            value: 'option 10', 
                            groupValue: _selectedValue, 
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },)
                        ],
                      )),
                  ],
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
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MasukkanMasalahmuView(
                        //               mitra: widget.mitra,
                        //               produk: listLayanan[_value - 1],
                        //             )));                        
                      },
                      child: Text('Selanjutnya',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.btnColor,
                          ))),
                )
            ],
          )),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/tambah_keahlian.dart';

class EditDataMitra extends StatefulWidget {
  const EditDataMitra({super.key});

  @override
  State<EditDataMitra> createState() => _EditDataMitraState();
}

class _EditDataMitraState extends State<EditDataMitra> {
  List<Map<String, dynamic>> data = [
    {
      'keahlian': "Pemerasan dan pengacaman",
      'value': false, 
    },
    {
      'keahlian': "Pencurian", 
      'value': false, 
    },
    {
      'keahlian': "Penipuan",
      'value': false, 
    },
    {
      'keahlian': "Pembunuhan",
      'value': false, 
    },
    {
      'keahlian': "Penggelapan",
      'value': false, 
    },
    {
      'keahlian': "Pemalsuan",
      'value': false, 
    },
    {
      'keahlian': "Kejahatan Terhadap Kesusilaan",  
      'value': false, 
    },
    {
      'keahlian': "Pemalsuan Uang",
      'value': false, 
    },
    {
      'keahlian': "Perusakan",
      'value': false, 
    },
    {
      'keahlian': "Penghinaan",
      'value': false, 
    },
    {
      'keahlian': "Kejahatan Terhadap Ketertiban Hukum",
      'value': false, 
    },
    {
      'keahlian': "Perjudian",
      'value': false, 
    },
    {
      'keahlian': "Kejahatan Terhadap Asal Usul Perkawinan",
      'value': false, 
    },
    {
      'keahlian': "Penganiayaan",
      'value': false, 
    },
    {
      'keahlian': "Kejahatan Terhadap Kemerdekaan Orang Lain",
      'value': false, 
    },
    {
      'keahlian': "Penadahan",
      'value': false, 
    },
    {
      'keahlian': "Sumpah Palsu dan Keterangan Palsu",
      'value': false, 
    },
    {
      'keahlian': "Lainnya",
      'value': false, 
    },
  ];

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: GlobalColors.mainColor,
            title: Text(
              'Edit Data',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      body: ListView(
        children: [
          Container(
            color: GlobalColors.mainColor,
            child: TabBar(
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelPadding: const EdgeInsets.symmetric(horizontal: 2),
              tabs: [
                Tab(
                  child: Text(
                    'Data Pribadi',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    'Pendidikan',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      // color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Bidang Keahlian',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      // color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    'Pengalaman',
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      // color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 400,
            child: TabBarView(
              children: [
                ListView(
                  children: [
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
                              labelText: 'Tanggal Lahir',
                              labelStyle: GoogleFonts.ubuntu(),
                              hintText: 'Masukkan Tanggal Lahir',
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
                ]
                ),

                //Tab2
                ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [                
                          TextFormField(
                            style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Lulusan',
                              labelStyle: GoogleFonts.ubuntu(
                              ),
                              hintText: 'Contoh: S1',
                              hintStyle: GoogleFonts.ubuntu(),
                              border: const UnderlineInputBorder(),
                              
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Asal Perguruan Tinggi',
                              labelStyle: GoogleFonts.ubuntu(
                              ),
                              hintText: 'Contoh: S.H',
                              hintStyle: GoogleFonts.ubuntu(),
                              border: const UnderlineInputBorder(),
                              
                            ),
                          ),
                          
                          TextFormField(
                            style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Lulusan',
                              labelStyle: GoogleFonts.ubuntu(
                              ),
                              hintText: 'Contoh: S1',
                              hintStyle: GoogleFonts.ubuntu(),
                              border: const UnderlineInputBorder(),
                              
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(fontSize: 13, color: GlobalColors.textColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Asal Perguruan Tinggi',
                              labelStyle: GoogleFonts.ubuntu(
                              ),
                              hintText: 'Contoh: S.H',
                              hintStyle: GoogleFonts.ubuntu(),
                              border: const UnderlineInputBorder(),
                              
                            ),
                          ),

                        ],
                      ),
                    ),
                  ]
                ),

                //Tab3
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return CheckboxListTile(
                      title: Text(data[index]['keahlian']),
                      value: data[index]['value'], 
                      onChanged: (value){
                        setState(() {
                          data[index]['value'] = value!;
                        });
                      });
                  }),

                //Tab4
                ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => const AddKeahlian()));
                          }, 
                          child: const Text('Perceraian',
                          style: TextStyle(
                            fontSize: 14, 
                            color: Colors.black),)),
                          const Divider(
                              thickness: 1.0,
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const AddKeahlian()));
                              }, 
                              child: const Text('Sengketa Tanah',
                              style: TextStyle(
                            fontSize: 14, 
                            color: Colors.black),)),
                            const Divider(
                              thickness: 1.0,
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const AddKeahlian()));
                              }, 
                              child: const Text('Warisan',
                              style: TextStyle(
                            fontSize: 14, 
                            color: Colors.black),)),
                            const Divider(
                              thickness: 1.0,
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const AddKeahlian()));
                              }, 
                              child: const Text('Gono Gini',
                              style: TextStyle(
                            fontSize: 14, 
                            color: Colors.black),)),
                            const Divider(
                              thickness: 1.0,
                            )
                      ],
                    ),
                    
                  ]
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}
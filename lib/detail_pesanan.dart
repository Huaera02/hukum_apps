import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';

class DetailPesananView extends StatefulWidget {
  const DetailPesananView({super.key});

  @override
  State<DetailPesananView> createState() => _DetailPesananViewState();
}

class _DetailPesananViewState extends State<DetailPesananView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: GlobalColors.mainColor,
            title: Text(
              'Detail Pesanan',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.black,
              indicatorColor: GlobalColors.mainColor,
              labelColor: GlobalColors.mainColor, 
              tabs: [
                Tab(
                  child: Text(
                    'Rincian Pesanan',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Chat',
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                margin: const EdgeInsets.only(left: 20, top: 10, right: 20 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Info Transaksi',
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        Text('Berhasil',
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green.shade400
                        ),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Detail Pesanan',
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,)
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Nur.png',
                                width: 50,
                                height: 70,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nurmiati, S.H',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,)
                                  ),
                                  Text('Advokat',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,)
                                  ),
                                ],
                              )
                            ],
                          ),

                          Divider(
                            thickness:1.0,
                            color: Colors.grey.shade400 ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range_outlined, color: GlobalColors.mainColor,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tanggal dan Waktu',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,)
                                  ),
                                  Text('Senin, 20 Jun 2022',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,)
                                  ),
                                  Text('08:00 AM',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,)
                                  )
                                ],
                              )
                            ],
                          ),

                          Divider(
                            thickness:1.0,
                            color: Colors.grey.shade400 ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.chat_outlined, color: GlobalColors.mainColor,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tipe Layanan',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,)
                                  ),
                                  Text('Chat',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,)
                                  ),
                                  Text('30 Menit',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,)
                                  )
                                ],
                              )
                            ],
                          ), 
                          Divider(
                            thickness:1.0,
                            color: Colors.grey.shade400 ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.title, color: GlobalColors.mainColor,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Topik/Judul Masalah',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,)
                                  ),
                                  Text('Perceraian',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,)
                                  ),
                                ],
                              )
                            ],
                          ), 
                          
                          Divider(
                            thickness:1.0,
                            color: Colors.grey.shade400 ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.description_outlined, color: GlobalColors.mainColor,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Deskripsi Masalah',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,)
                                  ),
                                  Text('Selamat pagi, Pak/Bu Advokat. Saya sangat\nmembutuhkan bantuan Anda karena saya\nsedang mengalami masalah rumah tangga yang\ncukup rumit. Saya sudah menikah dengan suami\nsaya selama 10 tahun, dan selama lima tahun\nterakhir, pernikahan kami rasanya semakin\nmemburuk. Awalnya, kami selalu bisa\nberkomunikasi dengan baik, tapi sekarang kami\nhampir tidak pernah berbicara tanpa bertengkar.',
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 12.5,),
                                    
                                  ),
                                ],
                              )
                            ],
                          ), 
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,)
                        ),
                        Text('52.000',
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,)
                        )
                      ],
                    ),
                  ],
                ),
              ),
              
              // Tab Halaman kedua
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/advokat1.png',
                    width: 100,
                    height: 100,),
                    const SizedBox(height: 120,),
                    Text('Berikan Waktu untuk Menghubungkan dengan',
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w100
                    ),),
                    const SizedBox(height: 10,),
                    Text('Nurmiati, S.H',
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 100,),
                    Text('Halo Zhafira, Kami sudah memberitahu Advokat tentang Permintaan',
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w100
                      ),
                      textAlign: TextAlign.center,),
                      const SizedBox(height: 10,),
                      Text('60 Detik',
                      style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: GlobalColors.mainColor
                      ),)
                  ],
                ),)
              
              ],))
          ]
          )
      ),
    );
  }
}
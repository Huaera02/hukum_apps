import 'package:data_filters/data_filters.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/pilih_layanan_meeting.dart';
// import 'package:loginn/profile_advokat1.dart';
// import 'package:loginn/profile_advokat2.dart';

class MeetingAdvokatView extends StatefulWidget {
  const MeetingAdvokatView({super.key});

  @override
  State<MeetingAdvokatView> createState() => _MeetingAdvokatViewState();
}

class _MeetingAdvokatViewState extends State<MeetingAdvokatView> {
  List<int>? filterIndex;
  @override
  Widget build(BuildContext context) {
    List<List> data = [
      ['5 Tahun', '4,6', 'Makassar'],     
    ];
    
    List<String> titles = ['Pengalaman', 'Rating', 'Kabupaten/Kota'];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Pilih Advokat',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          DataFilters(
            data: data,
            filterTitle: titles,
            showAnimation: true,
            recent_selected_data_index: (List<int>? index) {
              setState(() {
                filterIndex = index;
              });
            },
            style: FilterStyle(
              buttonColor: GlobalColors.mainColor,
              buttonColorText: Colors.white,
              filterBorderColor: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                // Jika tidak ada filter atau index saat ini cocok dengan filter
                if (filterIndex == null || filterIndex!.contains(index)) {
                  return Container(
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20 ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            // Navigator.push(context, 
                            // MaterialPageRoute(builder: (context) => const ProfileAdvokat1View()));
                          },
                          splashColor: GlobalColors.btnColor,
                          child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 6,
                                )
                              ]
                            ),
                            child: Row(
                              children: [
                                Container(
                                margin: const EdgeInsets.all(10),
                                width: 90,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    color: Colors.grey.shade200)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/Nur.png',
                                      width: 70,
                                      height: 120,),
                                      Image.asset('assets/images/Online.png',
                                      width: 15,
                                      height: 15,)]
                                  )
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Nurmiati, S.H',
                                        style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset('assets/images/icon_pengalaman.png',
                                      height: 15,
                                      width: 15),
                                        const SizedBox(width: 10),
                                            Text('5 Tahun',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset('assets/images/icon_rating.png',
                                      height: 15,
                                      width: 15),
                                        const SizedBox(width: 10),
                                            Text('4.6/5 Tahun',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)
                                      ),
                                    ],
                                    ),
                                    const SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Free',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            const SizedBox(width: 90,),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(context, 
                                                MaterialPageRoute(builder: (context) => const LayananMeeting()));
                                              },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: GlobalColors.mainColor,
                                                  fixedSize: const Size(90, 20), 
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5)), 
                                                  ),
                                                ),
                                                child: Text('Pilih',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white
                                                ),),
                                              ),
                                          ],
                                        )
                                    ],  
                                    ),
                              ],
                            ),
                            ),
                        ),

                      //Advokat Populer 2
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, 
                          // MaterialPageRoute(builder: (context) => const ProfileAdvokat2View()));
                        },
                        splashColor: GlobalColors.btnColor,
                        child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                              )
                            ]
                          ),
                          child: Row(
                            children: [
                              Container(
                              margin: const EdgeInsets.all(10),
                              width: 90,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  color: Colors.grey.shade200)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/gbr_advokat2.png',
                                    width: 70,
                                    height: 120,),
                                    Image.asset('assets/images/Online.png',
                                    width: 15,
                                    height: 15,)]
                                )
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Muh. Rizaldi, S.H., M.H',
                                      style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/icon_pengalaman.png',
                                    height: 15,
                                    width: 15),
                                      const SizedBox(width: 10),
                                          Text('10 Tahun',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)
                                    ),
                                    const SizedBox(width: 10),
                                    Image.asset('assets/images/icon_rating.png',
                                    height: 15,
                                    width: 15),
                                      const SizedBox(width: 10),
                                          Text('4.9/5 Tahun',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)
                                    ),
                                  ],
                                  ),
                                  const SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Free',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            const SizedBox(width: 90,),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(context, 
                                                MaterialPageRoute(builder: (context) => const LayananMeeting()));
                                              },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: GlobalColors.mainColor,
                                                  fixedSize: const Size(90, 20), 
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5)), 
                                                  ),
                                                ),
                                                child: Text('Pilih',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white
                                                ),),
                                              ),
                                          ],
                                        )
                                  ],  
                                  ),
                            ],
                          ),
                        ),
                      ),

                      ],
                    ),
                  );
                  
                  // return ListAdvokatView(advokat_app_data:data);
                } else {
                  // Jika tidak cocok dengan filter, tampilkan konten kosong
                  // ignore: prefer_const_constructors
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
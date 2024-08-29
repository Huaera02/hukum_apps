import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/masukkan_masalah.dart';

class LayananMeeting extends StatefulWidget {
  const LayananMeeting({super.key});

  @override
  State<LayananMeeting> createState() => _LayananMeetingState();
}

class _LayananMeetingState extends State<LayananMeeting> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: GlobalColors.mainColor,
          title: Text(
            'Pilih Layanan',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20, ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black38)
                          ),
                          child: Row(
                            children: [
                            Icon(Icons.video_camera_front, 
                              color: GlobalColors.mainColor, 
                              size: 30,),
                            const SizedBox(width: 10,),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Video Call',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,)
                                  ),
                                    Text('Rp.70.000 / 30 Menit',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.mainColor,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 64,),
                              Radio(
                                value: 1, 
                                groupValue: _value, 
                                onChanged: (value){
                                  setState(() {
                                    _value = value as int;
                                  });
                                })
                            ],
                          ),
                            )
                            
                          ],)
                        )
                      ],
                    )
              ),


              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black38)
                          ),
                          child: Row(
                            children: [
                            Icon(Icons.video_camera_front_rounded, 
                              color: GlobalColors.mainColor, 
                              size: 30,),
                            const SizedBox(width: 10,),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Video Call',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,)
                                  ),
                                    Text('Rp.98.000 / 60 Menit',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.mainColor,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 64,),
                              Radio(
                                value: 2, 
                                groupValue: _value, 
                                onChanged: (value){
                                  setState(() {
                                    _value = value as int;
                                  });
                                })
                            ],
                          ),
                            )
                            
                          ],)
                        )
                      ],
                    )
              ),


              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black38)
                          ),
                          child: Row(
                            children: [
                            Icon(Icons.video_camera_front_rounded, 
                              color: GlobalColors.mainColor, 
                              size: 30,),
                            const SizedBox(width: 10,),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Video Call',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,)
                                  ),
                                    Text('Rp.110.000 / 90 Menit',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.mainColor,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 56,),
                              Radio(
                                value: 3, 
                                groupValue: _value, 
                                onChanged: (value){
                                  setState(() {
                                    _value = value as int;
                                  });
                                })
                            ],
                          ),
                            )
                            
                          ],)
                        )
                      ],
                    )
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black38)
                          ),
                          child: Row(
                            children: [
                            Icon(Icons.video_camera_front_rounded, 
                              color: GlobalColors.mainColor, 
                              size: 30,),
                            const SizedBox(width: 10,),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Video Call',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,)
                                  ),
                                    Text('Rp.150.000 / 180 Menit',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: GlobalColors.mainColor,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 48,),
                              Radio(
                                value: 4, 
                                groupValue: _value, 
                                onChanged: (value){
                                  setState(() {
                                    _value = value as int;
                                  });
                                })
                            ],
                          ),
                            )
                            
                          ],)
                        )
                      ],
                    )
              ),

              Container(
                width: double.infinity,
                height: 52,
                margin: const EdgeInsets.only(left: 26, right: 26, top: 247, bottom: 20),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.mainColor,),
                onPressed: (){
                  // Navigator.push(context, 
                  // MaterialPageRoute(builder: (context) => const MasukkanMasalahmuView()));
                }, 
              child: Text('Selanjutnya',
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: GlobalColors.btnColor,))),
              )
            ],
          )),
    );
  }
}
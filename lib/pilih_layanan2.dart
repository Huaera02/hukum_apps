import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/chatnotaris.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';

class PilihLayanan2View extends StatefulWidget {
  const PilihLayanan2View({super.key});

  @override
  State<PilihLayanan2View> createState() => _PilihLayanan2ViewState();
}

class _PilihLayanan2ViewState extends State<PilihLayanan2View> {
  int _value = 1;
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listLayanan = [];

  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getLayananMitra();

    isLoading = false;

    if (response['status'] == true) {
      listLayanan = List<Map<String, dynamic>>.from(response['kategori']);
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
    getData();
  }
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
        

        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: const EdgeInsets.only(left: 20, right: 20, top: 20, ),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Container(
        //                   padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
        //                   alignment: Alignment.centerLeft,
        //                   width: 500,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10),
        //                     border: Border.all(
        //                       color: Colors.black38)
        //                   ),
        //                   child: Row(
        //                     children: [
        //                     Icon(Icons.chat_sharp, 
        //                       color: GlobalColors.mainColor, 
        //                       size: 30,),
        //                     const SizedBox(width: 20,),
        //                     Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text('Chat',
        //                           style: GoogleFonts.ubuntu(
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w500,)
        //                           ),
        //                             Text('30 Menit',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       const SizedBox(width: 100,),
        //                       Text('Rp. 30.000',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           ),
        //                       // const SizedBox(width: 1,),
        //                     Radio(
        //                       value: 1, 
        //                       groupValue: _value, 
        //                       onChanged: (value){
        //                         setState(() {
        //                           _value = value as int;
        //                         });
        //                       })
                            
        //                   ],)
        //                 ),

        //                 const SizedBox(height: 10),
        //                 // Chat 60 Menit
        //                 Container(
        //                   padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
        //                   alignment: Alignment.centerLeft,
        //                   width: 500,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10),
        //                     border: Border.all(
        //                       color: Colors.black38)
        //                   ),
        //                   child: Row(
        //                     children: [
        //                     Icon(Icons.chat_sharp, 
        //                       color: GlobalColors.mainColor, 
        //                       size: 30,),
        //                     const SizedBox(width: 20,),
        //                     Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text('Chat',
        //                           style: GoogleFonts.ubuntu(
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w500,)
        //                           ),
        //                             Text('60 Menit',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       const SizedBox(width: 100,),
        //                       Text('Rp. 40.000',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           ),
        //                       // const SizedBox(width: 135,),
        //                     Radio(
        //                       value: 2, 
        //                       groupValue: _value, 
        //                       onChanged: (value){
        //                         setState(() {
        //                           _value = value as int;
        //                         });
        //                       })
                            
        //                   ],)
        //                 ),

        //                 //chat 90 Menit
        //                 const SizedBox(height: 10),
        //                 Container(
        //                   padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
        //                   alignment: Alignment.centerLeft,
        //                   width: 500,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10),
        //                     border: Border.all(
        //                       color: Colors.black38)
        //                   ),
        //                   child: Row(
        //                     children: [
        //                     Icon(Icons.chat_sharp, 
        //                       color: GlobalColors.mainColor, 
        //                       size: 30,),
        //                     const SizedBox(width: 20,),
        //                     Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text('Chat',
        //                           style: GoogleFonts.ubuntu(
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w500,)
        //                           ),
        //                             Text('90 Menit',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       const SizedBox(width: 100,),
        //                       Text('Rp. 50.000',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           ),
        //                       // const SizedBox(width: 135,),
        //                     Radio(
        //                       value: 3, 
        //                       groupValue: _value, 
        //                       onChanged: (value){
        //                         setState(() {
        //                           _value = value as int;
        //                         });
        //                       })
                            
        //                   ],)
        //                 ),

        //                 //chat 120 menit
        //                 const SizedBox(height: 10),
        //                 Container(
        //                   padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
        //                   alignment: Alignment.centerLeft,
        //                   width: 500,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10),
        //                     border: Border.all(
        //                       color: Colors.black38)
        //                   ),
        //                   child: Row(
        //                     children: [
        //                     Icon(Icons.chat_sharp, 
        //                       color: GlobalColors.mainColor, 
        //                       size: 30,),
        //                     const SizedBox(width: 20,),
        //                     Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text('Chat',
        //                           style: GoogleFonts.ubuntu(
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w500,)
        //                           ),
        //                             Text('120 Menit',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                       const SizedBox(width: 95,),
        //                       Text('Rp. 60.000',
        //                             style: GoogleFonts.ubuntu(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.w500,
        //                               color: GlobalColors.mainColor,
        //                             ),
        //                           ),
        //                       // const SizedBox(width: 130,),
        //                     Radio(
        //                       value: 4, 
        //                       groupValue: _value, 
        //                       onChanged: (value){
        //                         setState(() {
        //                           _value = value as int;
        //                         });
        //                       })
                            
        //                   ],)
        //                 ),

        //               ],
        //             )
        //       ),
                                            
        //       Container(
        //         width: double.infinity,
        //         height: 52,
        //         margin: const EdgeInsets.only(left: 26, right: 26, top: 247, bottom: 20),
        //         child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //         backgroundColor: GlobalColors.mainColor,),
        //         onPressed: (){
        //           Navigator.push(context, 
        //           MaterialPageRoute(builder: (context) => const PilihNotarisView()));
        //         }, 
        //         child: Text('Selanjutnya',
        //         style: GoogleFonts.ubuntu(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w500,
        //           color: GlobalColors.btnColor,))),
        //       )
        //     ]
        //     )
        //     )
    );   
  }
}
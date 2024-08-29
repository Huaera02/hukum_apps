import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loginn/bayar.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';

class MetodePembayaranView extends StatefulWidget {
  const MetodePembayaranView({super.key});

  @override
  State<MetodePembayaranView> createState() => _MetodePembayaranViewState();
}

class _MetodePembayaranViewState extends State<MetodePembayaranView> {
  int _selectedValue = 0;
  bool isLoading = false;
  Repository repository = Repository();
  List<Map<String, dynamic>> listMetodePembayaran = [];
  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.getMetodeBayar();

    isLoading = false;

    if (response['status'] == true) {
      listMetodePembayaran =
          List<Map<String, dynamic>>.from(response['metodePembayaran']);
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
            'Pilih Metode Pembayaran',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transfer Bank',
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: listMetodePembayaran.length,
                            itemBuilder: (context, index) {
                              return RadioListTile(
                                contentPadding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                value: index + 1,
                                groupValue: _selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value as int;
                                  });
                                },
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image.asset('assets/images/bca.png',
                                    //     width: 30, height: 30),                                 
                                    Text(
                                      listMetodePembayaran[index]['nama'],
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )
                                  ],
                                ),                               
                              );
                            })
                      ],
                    ),
                  ),
                ),
                 Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.only(left: 26, right: 26, top: 200, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context, listMetodePembayaran[_selectedValue-1]);
                    //   Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => const PembayaranView()));
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
            ),
            Visibility(
              visible: isLoading,
              child: const Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        )

            // ListView(
            //   children: [
            //     Container(
            //           alignment: Alignment.topLeft,
            //            padding: const EdgeInsets.all(10),
            //            decoration: const BoxDecoration(
            //               color: Colors.white,
            //               boxShadow: [
            //                BoxShadow(
            //                  color: Colors.black38,
            //                  blurRadius: 6,
            //                ),
            //               ]
            //            ),
            //            child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('E-Walet',
            //               style: GoogleFonts.ubuntu(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.bold,
            //               ),),
            //               const SizedBox(height: 5,),
            //               RadioListTile(
            //               value: 1,
            //               groupValue: _selectedValue,
            //               onChanged: (value) {
            //                 setState(() {
            //                   _selectedValue = value as int;
            //                 });
            //               },
            //               title: Row(
            //                 children: [
            //                   Image.asset('assets/images/gopay.png', width: 30, height: 30),
            //                   const SizedBox(width: 2),
            //                   Text('Gopay',
            //                   style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black
            //                   ),
            //                   )
            //                 ],
            //               ),
            //               subtitle: Text('sambungkan dengan gopay',
            //               style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black54
            //               ),
            //             ),
            //               ),

            //               RadioListTile(
            //               value: 2,
            //               groupValue: _selectedValue,
            //               onChanged: (value) {
            //                 setState(() {
            //                   _selectedValue = value as int;
            //                 });
            //               },
            //               title: Row(
            //                 children: [
            //                   Image.asset('assets/images/ovo.png', width: 30, height: 30),
            //                   const SizedBox(width: 2),
            //                   Text('Ovo',
            //                   style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black
            //                   ),
            //                   )
            //                 ],
            //               ),
            //               subtitle: Text('sambungkan dengan Ovo',
            //               style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black54
            //               ),
            //             ),
            //               ),

            //               RadioListTile(
            //               value: 3,
            //               groupValue: _selectedValue,
            //               onChanged: (value) {
            //                 setState(() {
            //                   _selectedValue = value as int;
            //                 });
            //               },
            //               title: Row(
            //                 children: [
            //                   Image.asset('assets/images/LinkAja.png', width: 30, height: 30),
            //                   const SizedBox(width: 2),
            //                   Text('LinkAja',
            //                   style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black
            //                   ),
            //                   )
            //                 ],
            //               ),
            //               subtitle: Text('sambungkan dengan LinkAja',
            //               style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black54
            //               ),
            //             ),
            //               ),

            //               //Transfer Bank
            //               const Divider(
            //                 thickness: 1,
            //               ),
            //               Text('Transfer Bank',
            //               style: GoogleFonts.ubuntu(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.bold,
            //               ),),
            //               const SizedBox(height: 5,),
            //               RadioListTile(
            //               value: 4,
            //               groupValue: _selectedValue,
            //               onChanged: (value) {
            //                 setState(() {
            //                   _selectedValue = value as int;
            //                 });
            //               },
            //               title: Row(
            //                 children: [
            //                   Image.asset('assets/images/bca.png', width: 30, height: 30),
            //                   const SizedBox(width: 2),
            //                   // Text('BCA',
            //                   // style: GoogleFonts.ubuntu(
            //                   //   fontSize: 14,
            //                   //   fontWeight: FontWeight.bold,
            //                   //   color: Colors.black
            //                   // ),
            //                   // )
            //                 ],
            //               ),
            //               subtitle: Text('Bank BCA',
            //               style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black54
            //               ),
            //             ),
            //               ),

            //               RadioListTile(
            //               value: 5,
            //               groupValue: _selectedValue,
            //               onChanged: (value) {
            //                 setState(() {
            //                   _selectedValue = value as int;
            //                 });
            //               },
            //               title: Row(
            //                 children: [
            //                   Image.asset('assets/images/bni.png', width: 30, height: 30),
            //                   // const SizedBox(width: 2),
            //                   // Text('BNI',
            //                   // style: GoogleFonts.ubuntu(
            //                   //   fontSize: 14,
            //                   //   fontWeight: FontWeight.bold,
            //                   //   color: Colors.black
            //                   // ),
            //                   // )
            //                 ],
            //               ),
            //               subtitle: Text('Bank BNI',
            //               style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black54
            //               ),
            //             ),
            //               ),

            //               RadioListTile(
            //               value: 6,
            //               groupValue: _selectedValue,
            //               onChanged: (value) {
            //                 setState(() {
            //                   _selectedValue = value as int;
            //                 });
            //               },
            //               title: Row(
            //                 children: [
            //                   Image.asset('assets/images/mandiri.png', width: 30, height: 30),
            //                   // const SizedBox(width: 2),
            //                   // Text('Mandiri',
            //                   // style: GoogleFonts.ubuntu(
            //                   //   fontSize: 14,
            //                   //   fontWeight: FontWeight.bold,
            //                   //   color: Colors.black
            //                   // ),
            //                   // )
            //                 ],
            //               ),
            //               subtitle: Text('Bank Mandiri',
            //               style: GoogleFonts.ubuntu(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                     color: Colors.black54
            //               ),
            //             ),
            //               ),
            //             ],
            //            ),
            //         ),

                //     Container(
                //   width: double.infinity,
                //   height: 52,
                //   margin: const EdgeInsets.only(left: 26, right: 26, top: 200, bottom: 20),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: GlobalColors.mainColor,
                //     ),
                //     onPressed: () {
                //     //   Navigator.push(context,
                //     // MaterialPageRoute(builder: (context) => const PembayaranView()));
                //     },
                //     child: Text('Konfirmasi',
                //     style: GoogleFonts.ubuntu(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w500,
                //       color: GlobalColors.btnColor,
                //     ),),
                //   ),
                // ),
            //   ],),
            ));
  }
}
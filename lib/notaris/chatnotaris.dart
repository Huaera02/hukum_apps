// import 'package:data_filters/data_filters.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:loginn/notaris/layanan_notaris.dart';
// import 'package:loginn/profile_notaris1.dart';

class Notarisppat2View extends StatefulWidget {
  const Notarisppat2View({super.key});

  @override
  State<Notarisppat2View> createState() => _Notarisppat2ViewState();
}

class _Notarisppat2ViewState extends State<Notarisppat2View> {
  List<int>? filterIndex;

  @override
  Widget build(BuildContext context) {
    List<String> bidangKeahlian = ['Perceraian', 'Sengketa', 'Gono Gini', 'Warisan'];
    List<String> pengalaman = ['<5 tahun', '5 tahun', '> 5 tahun'];
    List<String> kabupatenKota = ['Makassar', 'Maros', 'Bone', 'Sidrap', 'Soppeng'];

    List<String> selectedBidangKeahlian = [];
    List<String> selectedPengalaman = [];
    List<String> selectedKabupatenKota = [];

    int value = 1;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), // Tinggi AppBar
        child: AppBar(
          // backgroundColor: GlobalColors.mainColor,
          // automaticallyImplyLeading: false, // Menghilangkan ikon back default
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 70, right: 10), // Padding atas untuk status bar
              child: Row(
                children: [
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_rounded)),         
                  Expanded(
                    child: SizedBox(
                      width: 200, // Atur lebar sesuai kebutuhan Anda
                      height: 40, // Atur tinggi sesuai kebutuhan Anda
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Cari...',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.black54,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: GlobalColors.mainColor,
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0), // Sesuaikan padding vertikal agar teks berada di tengah
                        ),
                      ),
                    ),



                  ),
                  // const SizedBox(width: 10.0),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context, 
                        builder: (BuildContext context){
                          return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return SizedBox(
                                // color: Colors.grey[300],
                                height: 500,
                                child: ListView(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Bidang Keahlian', 
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14, 
                                              fontWeight: FontWeight.bold)),
                                          Wrap(
                                            spacing: 8.0,
                                            children: bidangKeahlian.map((keahlian) {
                                              return FilterChip(
                                                label: Text(keahlian),
                                                selected: selectedBidangKeahlian.contains(keahlian),
                                                selectedColor: GlobalColors.mainColor,
                                                onSelected: (isSelected) {
                                                  setState(() {
                                                    isSelected
                                                        ? selectedBidangKeahlian.add(keahlian)
                                                        : selectedBidangKeahlian.remove(keahlian);
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                          const SizedBox(height: 20),
                                          Text('Pengalaman', 
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14, 
                                              fontWeight: FontWeight.bold)),
                                          Wrap(
                                            spacing: 8.0,
                                            children: pengalaman.map((pengalaman) {
                                              return FilterChip(
                                                label: Text(pengalaman),
                                                selected: selectedPengalaman.contains(pengalaman),
                                                selectedColor: GlobalColors.mainColor,
                                                onSelected: (isSelected) {
                                                  setState(() {
                                                    isSelected
                                                        ? selectedPengalaman.add(pengalaman)
                                                        : selectedPengalaman.remove(pengalaman);
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                          const SizedBox(height: 20),
                                          Text('Kabupaten/Kota', 
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 14, 
                                              fontWeight: FontWeight.bold)),
                                          Wrap(
                                            spacing: 8.0,
                                            children: kabupatenKota.map((kabupaten) {
                                              return FilterChip(
                                                label: Text(kabupaten),
                                                selected: selectedKabupatenKota.contains(kabupaten),
                                                selectedColor: GlobalColors.mainColor,
                                                onSelected: (isSelected) {
                                                  setState(() {
                                                    isSelected
                                                        ? selectedKabupatenKota.add(kabupaten)
                                                        : selectedKabupatenKota.remove(kabupaten);
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),

                                          Container(
                                            width: double.infinity,
                                            height: 52,
                                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: GlobalColors.mainColor,
                                              ),
                                              onPressed: () {
                                                Navigator.push(context, 
                                              MaterialPageRoute(builder: (context) => const Notarisppat2View()));
                                              },
                                              child: Text('Terapkan',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: GlobalColors.btnColor,
                                              ),),
                                            ),      
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          );
                        }
                      );                         
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20), // Menambahkan padding di sekitar TextFormField
            child: Column(
              children: [                     
                InkWell(
                  onTap: (){
                    // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ProfileAdvokat1View()));
                  },
                  splashColor: GlobalColors.btnColor,
                  child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
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
                          margin: const EdgeInsets.only(right: 10),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5), // Menyelaraskan border radius gambar dengan container
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/Nur.png',
                                  width: 90, // Sesuaikan lebar sesuai dengan lebar container
                                  height: 120, // Sesuaikan tinggi sesuai dengan tinggi container
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Image.asset(
                                    'assets/images/Online.png', // Ganti dengan URL gambar online Anda
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                      const SizedBox(width: 20),
                                      Image.asset('assets/images/location.png',
                                      height: 15,
                                      width: 15),
                                      const SizedBox(width: 6),
                                      Text('Makassar',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500)
                                      ),
                                    ],
                                ),
                                const SizedBox(height: 45),
                                Text('Free',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                  ),
                                ),                                                                    
                            ],  
                          ),
                          const SizedBox(width: 35,),
                          Radio(
                            value: 1, 
                            groupValue: value, 
                            onChanged: (value){
                              setState(() {
                                value = value as int;
                              });
                            })
                      ],
                    ),
                    ),
                ),


                //Advokat 2
                const SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => const ProfileAdvokat1View()));
                  },
                  splashColor: GlobalColors.btnColor,
                  child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
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
                          margin: const EdgeInsets.only(right: 10),
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5), // Menyelaraskan border radius gambar dengan container
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/gbr_advokat2.png',
                                  width: 90, // Sesuaikan lebar sesuai dengan lebar container
                                  height: 120, // Sesuaikan tinggi sesuai dengan tinggi container
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Image.asset(
                                    'assets/images/Online.png', // Ganti dengan URL gambar online Anda
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Muh.Rizaldi, S.H., M.H',
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
                                      const SizedBox(width: 20),
                                      Image.asset('assets/images/location.png',
                                      height: 15,
                                      width: 15),
                                      const SizedBox(width: 6),
                                      Text('Makassar',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500)
                                      ),
                                    ],
                                ),
                                const SizedBox(height: 45),
                                Text('Free',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                  ),
                                ),                                                                    
                            ],  
                          ),
                          const SizedBox(width: 30,),
                          Radio(
                            value: 2, 
                            groupValue: value, 
                            onChanged: (value){
                              setState(() {
                                value = value as int;
                              });
                            })
                      ],
                    ),
                    ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 52,
            margin: const EdgeInsets.only(left: 26, right: 26, top: 334, bottom: 20),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: GlobalColors.mainColor,),
            onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const LayananNotarisView()));
            }, 
            child: Text('Selanjutnya',
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: GlobalColors.btnColor,))),
          )
        ],
      ),

    );
  }
}
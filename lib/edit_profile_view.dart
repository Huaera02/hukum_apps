import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/repository.dart';
import 'package:loginn/profile_view.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  bool isLoading = false;
  Repository repository = Repository();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final nohpController = TextEditingController();
  final alamatController = TextEditingController();

  List<Map<String, dynamic>> listData = [];

  //Data Pribadi
  getData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.editDataPribadiMitra();

    isLoading = false;

    if (response['status'] == true) {
      namaController.text = response['data']['nama'] ?? '';
      emailController.text = response['data']['email'] ?? '';
      nohpController.text = response['data']['hp'] ?? '';
      alamatController.text = response['data']['alamat'] ?? '';

      listData = List<Map<String, dynamic>>.from(response['pendidikan']);
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

  //menyimpan Data Pribadi yang sudah diupdate
  //menyimpan Data Pribadi yang sudah diupdate
  postData() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> response = await repository.putTombolSimpanDataUser(
        email: emailController.text,
        nohp: nohpController.text,
        nama: namaController.text,
        alamat: alamatController.text);

    isLoading = false;

    if (response['status'] == true) {
      // Navigator.of(context).pop(true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ProfileView(),
      ));
      getData();
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
          'Edit Profile',
          style: GoogleFonts.ubuntu(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 35),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/profile 1.png',
                                  width: 150,
                                  height: 150,
                                ),
                                // TextButton(onPressed: (){},
                                // child: Text('Ganti Foto profil',
                                // style: GoogleFonts.ubuntu(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.bold,
                                //     color: GlobalColors.mainColor))
                                // )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 48, right: 48),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: namaController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: GlobalColors.textColor),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Nama Lengkap',
                                    labelStyle: GoogleFonts.ubuntu(),
                                    hintText: 'Masukkan Nama Lengkap',
                                    hintStyle: GoogleFonts.ubuntu(),
                                    border: const UnderlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: GlobalColors.textColor),
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
                                  controller: nohpController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: GlobalColors.textColor),
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: 'No Hp',
                                    labelStyle: GoogleFonts.ubuntu(),
                                    hintText: 'Masukkan No Hp',
                                    hintStyle: GoogleFonts.ubuntu(),
                                    border: const UnderlineInputBorder(),
                                  ),
                                ),
                                TextFormField(
                                  controller: alamatController,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: GlobalColors.textColor),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Alamat',
                                    labelStyle: GoogleFonts.ubuntu(),
                                    hintText: 'Masukkan Alamat',
                                    hintStyle: GoogleFonts.ubuntu(),
                                    border: const UnderlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                      ),
                      onPressed: postData,
                      child: Text('Ubah Profile',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.btnColor,
                          ))),
                )
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
        ),
      ),
    );
  }
}

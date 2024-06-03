import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginn/edit_profile_view.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/login_view.dart';
import 'package:loginn/newpass_view.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(246, 240, 237, 237),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.mainColor,
        title: Text('Profile',
        style: GoogleFonts.ubuntu(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                   padding: const EdgeInsets.all(20),
                   decoration: const BoxDecoration(
                      color: Colors.white,
                   ),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/profile 1.png',
                        width: 50,
                        height: 50,),
                        const SizedBox(width: 10,),
                        Text('Zhafira\n -',
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(width: 150,),
                        IconButton.filledTonal(onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => const EditProfileView()));
                        }, 
                        icon: Icon(Icons.edit, color: GlobalColors.mainColor,)
                        ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text('Email',
                      style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,)
                      ),
                      Text('Zhafira12@gmail.com',
                      style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,)
                      ),
                    ],
                   )
                ),

                Container(
                  margin: const EdgeInsets.only(top: 15),
                   padding: const EdgeInsets.all(10),
                   decoration: const BoxDecoration(
                      color: Colors.white,
                   ),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(onPressed: (){}, icon: Icon(Icons.verified_user_rounded, color: GlobalColors.mainColor, size: 20,),  
                      label: Text('Verifikasi Email',
                      style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))),

                      Divider(
                        thickness: 1.0,
                        color: Colors.grey.shade400),
            
                      TextButton.icon(onPressed: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => const NewPassView()));
                      }, 
                      icon: Icon(Icons.key, color: GlobalColors.mainColor, size: 20,),  
                      label: Text('Ubah Kata Sandi',
                      style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))),

                      Divider(
                        thickness: 1.0,
                        color: Colors.grey.shade400),
            
                      TextButton.icon(onPressed: (){}, icon: Icon(Icons.delete, color: GlobalColors.mainColor, size: 20,),  
                      label: Text('Hapus Akun',
                      style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))),
                    ],
                   ),
                ),
                // Container(
                //    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                //    padding: const EdgeInsets.all(10),
                //    decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: const [
                //        BoxShadow(
                //          color: Colors.black38,
                //          blurRadius: 6,
                //        ),
                //       ]
                //    ),
                //    child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Image.asset('assets/images/profile 1.png',
                //         width: 50,
                //         height: 50,),
                //         const SizedBox(width: 10,),
                //         Text('Zhafira\n -',
                //         style: GoogleFonts.ubuntu(
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold,
                //         ),),
                //         const SizedBox(width: 150,),
                //         IconButton.filledTonal(onPressed: (){
                //           Navigator.push(context, 
                //           MaterialPageRoute(builder: (context) => const EditProfileView()));
                //         }, 
                //         icon: Icon(Icons.edit, color: GlobalColors.mainColor,)
                //         ),
                //         ],
                //       ),
                //       const SizedBox(height: 20,),
                //       Text('Email',
                //       style: GoogleFonts.ubuntu(
                //       fontSize: 12,
                //       fontWeight: FontWeight.bold,)
                //       ),
                //       Text('Zhafira12@gmail.com',
                //       style: GoogleFonts.ubuntu(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w300,)
                //       )
                //     ],
                //    )
                // ),
                
                
                // Container(
                //   width: 380,
                //   margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                //    padding: const EdgeInsets.all(10),
                //    decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: const [
                //        BoxShadow(
                //          color: Colors.black38,
                //          blurRadius: 6,
                //        ),
                //       ]
                //    ),
                //    child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       TextButton.icon(onPressed: (){}, icon: Icon(Icons.verified_user_rounded, color: GlobalColors.mainColor, size: 20,),  
                //       label: Text('Verifikasi Email',
                //       style: GoogleFonts.ubuntu(
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black))),

                //       TextButton.icon(onPressed: (){
                //         Navigator.push(context, 
                // MaterialPageRoute(builder: (context) => const NewPassView()));
                //       }, 
                //       icon: Icon(Icons.key, color: GlobalColors.mainColor, size: 20,),  
                //       label: Text('Ubah Kata Sandi',
                //       style: GoogleFonts.ubuntu(
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black))),

                //       // TextButton.icon(onPressed: (){}, icon: Icon(Icons.language, color: GlobalColors.mainColor, size: 20,),  
                //       // label: Text('Ganti Bahasa',
                //       // style: GoogleFonts.ubuntu(
                //       // fontSize: 16,
                //       // fontWeight: FontWeight.bold,
                //       // color: Colors.black))),

                //       TextButton.icon(onPressed: (){}, icon: Icon(Icons.delete, color: GlobalColors.mainColor, size: 20,),  
                //       label: Text('Hapus Akun',
                //       style: GoogleFonts.ubuntu(
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black))),
                //     ],
                //    ),
                // ),
                TextButton(onPressed: (){
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const LoginView()));
                }, 
                child: Text('Keluar Akun',
                style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.mainColor))
                      )
              ],
            )
          ],
        ),),
    );
  }
}
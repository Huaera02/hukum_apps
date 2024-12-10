import 'package:flutter/material.dart';
import 'package:loginn/advokat/cari_advokat.dart';
import 'package:loginn/chats/api/apis.dart';
import 'package:loginn/chats/screens/home_screen.dart';
// import 'package:loginn/chtadvokat1.dart';
import 'package:loginn/menu/dash_view.dart';
// import 'package:loginn/pesan.dart';
import 'package:loginn/profile/profile_mitra.dart';
import 'package:loginn/profile/profile_mitra_notaris.dart';
import 'package:loginn/profile/profile_view.dart';
import 'package:loginn/riwayat/riwayat_mitra.dart';
import 'package:loginn/riwayat/riwayat_view.dart';
import 'package:loginn/warna/global_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedTabIndex = 0;
  String role = '';

  SharedPreferences? pref;

  void _onNavbarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
    init();
  }

  void init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      role = pref.getString('tipeKontakAlias') ?? '';
    });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Widget getProfileView() {
    if (role == 'advokat') {
      return const ProfileMitraView();
    } else if (role == 'notaris') {
      return const ProfileMitraNotarisView();
    } else {
      return const ProfileView();
    }
  }

  // Widget getHistoryView() {
  //   if (role == 'advokat') {
  //     return const RiwayatMitraView();
  //   } else if (role == 'notaris') {
  //     return const RiwayatMitraNotarisView();
  //   } else {
  //     return const HistoryView();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    init();
    final listpage = <Widget>[
      const DashboardView(),
      const CariAdvokatView(),
      const HomeScreen(),
      // const PesanView(),
      role == 'advokat' || role == 'notaris'
          ? const RiwayatMitraView()
          : const HistoryView(),
      // getHistoryView(),
      getProfileView(),

      // role == 'advokat' || role == 'notaris'
      // role == 'advokat'
      // ? const ProfileMitraView()
      // : const ProfileView(),

      // role == 'notaris'
      // ? const ProfileMitraNotarisView()
      // : const ProfileView()
    ];

    final bottomNavbarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chat',
      ),
      const BottomNavigationBarItem(
          icon: Icon(Icons.list_alt), label: 'Riwayat Transaksi'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
    ];

    final bottomNarBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavbarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: GlobalColors.textColor,
      selectedItemColor: GlobalColors.mainColor,
      onTap: _onNavbarTapped,
    );

    return Scaffold(
      body: Center(
        child: listpage[_selectedTabIndex],
      ),
      bottomNavigationBar: bottomNarBar,
    );
  }
}

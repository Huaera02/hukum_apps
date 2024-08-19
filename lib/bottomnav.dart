import 'package:flutter/material.dart';
import 'package:loginn/cari_advokat.dart';
// import 'package:loginn/chtadvokat1.dart';
import 'package:loginn/dash_view.dart';
import 'package:loginn/global_colors.dart';
import 'package:loginn/pesan.dart';
import 'package:loginn/profile_mitra.dart';
import 'package:loginn/profile_view.dart';
import 'package:loginn/riwayat_view.dart';
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

  @override
  Widget build(BuildContext context) {
    init();
    final listpage = <Widget>[
      const DashboardView(),
      const CariAdvokatView(),
      const PesanView(),
      const HistoryView(),
      role == 'advokat' || role == 'notaris'
          ? const ProfileMitraView()
          : const ProfileView()
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

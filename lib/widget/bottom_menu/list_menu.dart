import 'package:flutter/cupertino.dart';
import 'package:sandangs/pages/home_page.dart';
import 'package:sandangs/pages/keranjang_produk.dart';
import 'package:sandangs/pages/my_profile.dart';
import 'package:sandangs/pages/status_production.dart';

class ListMenu{
  int currentTab = 0;

  ListMenu(int tab,Widget screen){
    currentTab = tab;
  }
  final List<Widget> screens = [
    const HomePages(),
    const StatusProduction(),
    const KeranjangProduk(),
    const MyProfile(),
  ];
}
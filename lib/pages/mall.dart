import 'package:flutter/material.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/widget/appbar_custom/appbar_tittle.dart';
import 'package:sandangs/widget/gridview/produk_gridview.dart';
import 'package:sandangs/widget/kategori/kategori_produk.dart';
import 'package:sandangs/widget/slideview/slideview.dart';

class Mall extends StatefulWidget {

  const Mall({Key? key}) : super(key: key);

  @override
  State<Mall> createState() => _MallState();
}

class _MallState extends State<Mall> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTittle(),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SlideView(),
              Container(
                margin: EdgeInsets.only(top: 10),
              ),
              Text(
                "Mall",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: secondaryColor,
                  fontSize: 25,
                ),
              ),
              KategoriProduk(),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25, top: 10),
                child: Row(
                  children: [
                    Text('Recommended',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('View All',
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          )),
                    ),
                  ],
                ),
              ),
              ProdukGridview(),
            ],
          )),
    );
  }
}

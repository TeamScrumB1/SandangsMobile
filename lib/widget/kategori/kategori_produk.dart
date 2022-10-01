import 'package:flutter/material.dart';
import 'package:sandangs/widget/fitting/list_kategori.dart';
import 'package:sandangs/widget/kategori/item_kategori.dart';


class KategoriProduk extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 20,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for(int i=0;i<kategoriList.length;i++)
            InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return Scaffold();
                      })
                  );
                },
                child: ItemKategori(nama: kategoriList[i].name, img: kategoriList[i].img)
            )
        ],
      ),
    );
  }
}
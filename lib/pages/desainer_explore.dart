import 'package:flutter/material.dart';
import 'package:sandangs/api/api_top_desainer.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/models/desainer_model.dart';
import 'package:sandangs/pages/detail_desainer.dart';
import 'package:sandangs/pages/pilih_desainer.dart';
import 'package:sandangs/widget/appbar_custom/appbar_tittle.dart';
import 'package:sandangs/widget/kategori/kategori_produk.dart';
import 'package:sandangs/widget/listview/vertical_list_desainer.dart';

class DesainerExplore extends StatefulWidget {
  const DesainerExplore({Key? key}) : super(key: key);

  @override
  State<DesainerExplore> createState() => _DesainerExploreState();
}

class _DesainerExploreState extends State<DesainerExplore> {
  late Future<Desainer> allDesainerApi;

  @override
  void initState(){
    super.initState();
    allDesainerApi = ApiServiceTopDesainer().topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTittle(),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Explore Desainer",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: secondaryColor,
                    fontSize: 25,
                  ),
                ),
              ),
              const KategoriProduk(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Recommended',
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )
                        ),
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PilihDesainer())
                            );
                          },
                          child: Text(
                              'View All',
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FutureBuilder(
                            future: allDesainerApi,
                            builder: (context, AsyncSnapshot<Desainer> snapshot) {
                              var state = snapshot.connectionState;
                              if (state != ConnectionState.done) {
                                return const Center(child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.desainer.length,
                                    itemBuilder: (context, index) {
                                      var desainer = snapshot.data?.desainer[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return DetailDesainer(desainer: desainer!);
                                                }));
                                          },
                                          child: VerticalListDesainer(desainer: desainer!)
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(child: Text(snapshot.error.toString()));
                                } else {
                                  return const Text('');
                                }
                              }
                            },
                          )
                        ]
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
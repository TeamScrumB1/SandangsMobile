import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sandangs/api/api_top_desainer.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/models/desainer_model.dart';
import 'package:sandangs/pages/detail_desainer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DesainerAprove extends StatefulWidget {
  String idProject;
  DesainerAprove({required this.idProject}) ;

  @override
  State<DesainerAprove> createState() => _DesainerAproveState(idProject: idProject);
}

class _DesainerAproveState extends State<DesainerAprove> {
  late Future<Desainer> _desainer;
  String status = "false";
  String idProject;
  _DesainerAproveState({required this.idProject}) ;


  @override
  void initState(){
    super.initState();
    _desainer = ApiServiceTopDesainer().topHeadLines();
  }

  Future accepted(String idDesainer, String idProject) async {
    final response = await http.post(Uri.parse("https://fashionizt.yufagency.com/accept_desainer.php"), body: {
      "id_desainer" : idDesainer,
      "id_project" : idProject,
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Successfully Accepted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        fontSize: 15,
        textColor: secondaryColor,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Failed to Accept",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        fontSize: 15,
        textColor: secondaryColor,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 275,
      child: FutureBuilder(
        future: _desainer,
        builder: (context, AsyncSnapshot<Desainer> snapshot){
          var state = snapshot.connectionState;
          if(state!=ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.hasData){
              return Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var desainer = snapshot.data?.desainer[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push((context),
                            MaterialPageRoute(builder: (context){
                              return DetailDesainer(desainer: desainer!);
                            })
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 1,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: size.height * 1,
                          width: size.width * 0.4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: CircleAvatar(
                                    backgroundImage:  CachedNetworkImageProvider(
                                        desainer!.imgProfil),
                                    radius: 65,
                                  ),
                                ),
                              ),
                              Text(
                                desainer.nama,
                                style: nameCard,
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 20.0,
                                      color: Colors.amber,
                                    ),
                                    Text(desainer.rating,style: ratingCard,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              status == "false" || status == desainer.id ?
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    status = desainer.id;
                                    print ("id project : " +idProject);
                                    print ("id desainer : " +status);
                                  });
                                  // accepted(status, idProject);
                                },
                                child: Text(
                                  'Accepted',
                                  style: TextStyle(
                                    color: status == desainer.id ? Colors.white : Colors.green,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(status == desainer.id ? Colors.green : Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.green),
                                      ),
                                    )
                                ),
                              ) : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  'Rejected',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data?.desainer.length,
                ),
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }else{
              return Text('');
            }
          }
        },
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';

class FittingRoomProv with ChangeNotifier{
  int status = 0;
  int fitur = 0;

  setStatus(int kode){
    status = kode;
  }
  setFitur(int kode){
    fitur = kode;
  }
  int getFitur(){
    return fitur;
  }
  int getStatus(){
    return status;
  }
}
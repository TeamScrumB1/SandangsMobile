import 'package:flutter/cupertino.dart';

class FittingRoomProv with ChangeNotifier{
  int status = 0;
  int swap = 0;
  int fitur = 0;

  setStatus(int kode){
    status = kode;
  }
  setSwap(int kode){
    swap = kode;
  }
  setFitur(int kode){
    fitur = kode;
  }
  int getFitur(){
    return fitur;
  }
  int getSwap(){
    return swap;
  }
  int getStatus(){
    return status;
  }
}
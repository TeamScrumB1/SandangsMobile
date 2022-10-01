import 'package:flutter/material.dart';
import 'package:sandangs/constant.dart';

class BottomAppbarDetailProduk extends StatelessWidget {
  const BottomAppbarDetailProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0,3),
                blurRadius: 3,
                spreadRadius: 3,
              )
            ]
        ),
        height: size.height*0.06,
        child: Row(
          children: [
            Container(
              width: size.width*0.2,
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: secondaryColor,
                ),
                iconSize: 25,
                onPressed: (){},
              ),
            ),
            Container(
              width: size.width*0.2,
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.accessibility_outlined,
                  color: secondaryColor,
                ),
                iconSize: 25,
                onPressed: (){},
              ),
            ),
            Container(
              width: size.width*0.6,
              alignment: Alignment.center,
              color: orangePrice,
              child: TextButton(
                onPressed: (){},
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

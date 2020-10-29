import 'package:flutter/material.dart';

import 'package:banco_brasil/app/modules/home/home_page.dart';

class Botao extends StatelessWidget {
  final String titulo;
  final Function onPressed;
  final Icon icon;
  const Botao({
    Key key,
    this.titulo,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Icon(
                icon.icon,
                size: 35,
                color: azul,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$titulo',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
  }
}

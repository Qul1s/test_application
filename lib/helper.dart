import 'package:flutter/material.dart';


void ShowDialog(String text, context){
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
          title: const Text('Вітаю!',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "KyivTypeSans",
              color: Color.fromRGBO(243, 243, 245, 1))),
          content: Text(text, 
                        style: const TextStyle(
                               fontSize: 22,
                               fontWeight: FontWeight.bold,
                               fontFamily: "KyivTypeSans",
                               color: Color.fromRGBO(240, 240, 240, 1))),
          actions: <Widget>[TextButton(
                     onPressed: () => Navigator.pop(context),
                     child: const Text('OK',
                                       style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "KyivTypeSans",
                                            color: Color.fromRGBO(240, 240, 240, 1)))),
                                          ],
                                        ),
                                      );
}


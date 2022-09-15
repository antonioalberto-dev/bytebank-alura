import 'package:flutter/material.dart';
import 'package:flutter_aplic/screens/transferencia/lista.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: ListaTransferencia(),
      debugShowCheckedModeBanner: false,
    );
  }
}
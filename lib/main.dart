import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: formulario_transferencia(),
      ),
    );
  }
}

class formulario_transferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return;
  }
}

class lista_de_tranferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        transferencia('100', '125'),
        transferencia('200', '1254'),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle_outline),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Dice roller'),
      ),
    );
  }
}

class transferencia extends StatelessWidget {
  final String valor;
  final String numeroConta;

  transferencia(this.valor, this.numeroConta);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(numeroConta),
      ),
    );
  }
}

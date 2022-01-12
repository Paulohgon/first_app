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
  final TextEditingController _controladorCampoNumConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Tranferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: _controladorCampoNumConta,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                labelText: 'Numero da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: '0.00',
                icon: Icon(Icons.monetization_on),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {},
          ),
        ],
      ),
    );
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

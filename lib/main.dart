import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: lista_de_tranferencia(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Tranferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controladorCampoNumConta, '0000', 'Número da conta'),
          Editor(_controladorCampoValor, '0000', 'Valor'),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () => _criaTranferencia(context),
          ),
        ],
      ),
    );
  }

  void _criaTranferencia(BuildContext context) {
    final int? conta = int.tryParse(_controladorCampoNumConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (conta != null && valor != null) {
      final transferencia_criada = Transferencia(valor, conta);
      debugPrint('$transferencia_criada');
      Navigator.pop(context, transferencia_criada);
    }
  }
}

class lista_de_tranferencia extends StatefulWidget {
  final List<Transferencia> _qtdTranferencia = [];

  @override
  State<StatefulWidget> createState() {
    return lista_de_tranferenciaState();
  }
}

class lista_de_tranferenciaState extends State<lista_de_tranferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Lista de transferencia'),
      ),
      body: ListView.builder(
          itemCount: widget._qtdTranferencia.length,
          itemBuilder: (context, indice) {
            final tranferencia = widget._qtdTranferencia[indice];
            return item_transferencia(tranferencia);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return formulario_transferencia();
          }));
          future.then((tranferenciaRecebida) {
            setState(() {
              if (tranferenciaRecebida != null) {
                debugPrint('chegou no then do future');
                debugPrint('$tranferenciaRecebida');
                widget._qtdTranferencia.add(tranferenciaRecebida);
              }
            });
          });
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}

class item_transferencia extends StatelessWidget {
  final Transferencia _transferencia;

  item_transferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
  @override
  String toString() {
    return 'Transferencia: valor $valor e numero da conta $numeroConta';
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData? icone;

  Editor(this._controlador, this._dica, this._rotulo, {this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: _rotulo,
          hintText: _dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencia(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nova transferência'),
        ),
        body: Column(
          children: <Widget>[
            Editor(
              controlador: _controllerCampoConta,
              rotulo: 'Numero da conta',
              dica: '00000',
              icone: Icons.account_balance_wallet,
            ),
            Editor(
              controlador: _controllerCampoValor,
              rotulo: 'Valor',
              dica: 'R\$ 00.00',
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text('Salvar'),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _controllerCampoConta.text;
    final double? valor = double.tryParse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferencia');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 22.0,
        ),
        decoration: InputDecoration(
          icon: Icon(icone),
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencias'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(250.90, '1762-3')),
          ItemTransferencia(Transferencia(543.21, '86123-0')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('-> Dentro do then');
            debugPrint('$transferenciaRecebida');
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('R\$ ${_transferencia._valor.toStringAsFixed(2)}'),
        subtitle: Text(_transferencia._conta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double _valor;
  final String _conta;

  Transferencia(this._valor, this._conta);

  @override
  String toString() {
    return 'Conta: $_conta | Valor: R\$ ${_valor.toStringAsFixed(2)}';
  }
}

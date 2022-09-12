import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Transferencias'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('estou aqui');
            },
            child: const Icon(Icons.add),
          ),
          body: ListaTransferencia(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(200.0, '1762-3')),
        ItemTransferencia(Transferencia(543.21, '86123-0')),
      ],
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
}

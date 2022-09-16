import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Editor(
                controlador: _controllerCampoConta,
                rotulo: 'Numero da conta',
                dica: '00000',
                icone: Icons.account_balance_wallet,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Editor(
                controlador: _controllerCampoValor,
                rotulo: 'Valor',
                dica: 'R\$ 00.00',
                icone: Icons.monetization_on,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal.shade50,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Salvar'),
                ),
                onPressed: () => _criaTransferencia(context),
              ),
            ),
          ],
        ),
      ),
    );
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

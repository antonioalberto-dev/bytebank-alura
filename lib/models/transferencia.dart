class Transferencia {
  double _valor;
  String _conta;

  Transferencia(this._valor, this._conta);

  double get valor{
    return _valor;
  }

  String get conta{
    return _conta;
  }

  set valor(double valor) {
    this._valor = valor;
  }

  set conta(String conta) {
    this._conta = conta;
  }

  @override
  String toString() {
    return 'Conta: $_conta | Valor: R\$ ${_valor.toStringAsFixed(2)}';
  }
}

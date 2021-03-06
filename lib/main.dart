import 'package:flutter/material.dart';

void main() => runApp(_ByteBankApp());

class _ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _FormTransfer(),
      ),
    );
  }
}

class _FormTransfer extends StatelessWidget {
  final TextEditingController _controllerNumberCountText =
      TextEditingController();
  final TextEditingController _controllerValueText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando transferência"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: TextField(
              controller: _controllerNumberCountText,
              style: TextStyle(
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: TextField(
              controller: _controllerValueText,
              style: TextStyle(
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              final int numberCount = int.tryParse(_controllerNumberCountText.text);
              final double value = double.tryParse(_controllerValueText.text);
              if(numberCount != null && value != null) {
                final tranfersCompleted = _Transfer(value, numberCount);
                debugPrint('$tranfersCompleted');
              }
          },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class _TranfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          _ItemTransfer(_Transfer(100.0, 1000)),
          _ItemTransfer(_Transfer(200.0, 1000)),
          _ItemTransfer(_Transfer(350.0, 1000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemTransfer extends StatelessWidget {
  final _Transfer _transfer;

  _ItemTransfer(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer._value.toString()),
        subtitle: Text(_transfer._numberCount.toString()),
      ),
    );
  }
}

class _Transfer {
  final double _value;
  final int _numberCount;

  _Transfer(this._value, this._numberCount);
  @override
  String toString() {
    // TODO: implement toString
    return '$_Transfer(_value: $_value, _numberCount: $_numberCount)';
  }
}

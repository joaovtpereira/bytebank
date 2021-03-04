import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Transferências'),
          ),
          body: _TranfersList(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
          ),
        ),
      ),
    ); //RunApp é o ponto de partida

class _TranfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ItemTransfer(_Transfer(100.0, 1000)),
        _ItemTransfer(_Transfer(200.0, 1000)),
        _ItemTransfer(_Transfer(350.0, 1000)),
      ],
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
}
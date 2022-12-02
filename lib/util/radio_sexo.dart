import 'package:flutter/material.dart';

enum SexoEnum { masculino, feminino}

// ignore: must_be_immutable
class RadioSexo extends StatefulWidget {
  TextEditingController? controller;
  RadioSexo({Key? key, this.controller}) : super(key: key);

  @override
  State<RadioSexo> createState() => _RadioSexoState();
}

class _RadioSexoState extends State<RadioSexo> {
  SexoEnum? _escolha = SexoEnum.masculino;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text('Masculino'),
            leading: Radio<SexoEnum> (
              value: SexoEnum.masculino,
              groupValue: _escolha,
              onChanged: (SexoEnum? value) {
                setState(() {
                  _escolha = value;
                  widget.controller?.text = 'M';
                });
              },
            ),
          )
        ),
         Expanded(
          child: ListTile(
            title: const Text('Feminino'),
            leading: Radio<SexoEnum> (
              value: SexoEnum.feminino,
              groupValue: _escolha,
              onChanged: (SexoEnum? value) {
                setState(() {
                  _escolha = value;
                  widget.controller?.text = 'F';
                });
              },
            ),
          )
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final List<Map<String, Object>> respostas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.respostas,
    required this.perguntaSelecionada,
    required this.responder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map(
              (resp) => Resposta(
                texto: resp['texto'].toString(),
                quandoSelecionado: () => responder(
                  int.parse(
                    resp['pontuacao'].toString(),
                  ),
                ),
              ),
            )
            .toList()
      ],
    );
  }
}

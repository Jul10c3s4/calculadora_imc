import 'dart:math';

class Imc {
  double _peso;
  double _altura;

  Imc(this._peso, this._altura);

  double get peso => _peso;

  double get altura => _altura;

  set peso(double Peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  String getImc() {
    double imc = _peso / pow(_altura, 2);
    return imc.toStringAsFixed(2);
  }

  String calcularIMC() {
    double imc = _peso / pow(_altura, 2);
    String text;
    imc < 16
        ? text =
            "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de Magreza grave"
        : imc > 16 && imc < 17
            ? text =
                "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de Magreza moderada"
            : imc > 17 && imc < 18.5
                ? text =
                    "Seu imc é: ${imc.toStringAsFixed(2)}, você está estado de Magreza leve"
                : imc > 18.5 && imc < 25
                    ? text =
                        "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de saudável"
                    : imc > 25 && imc < 30
                        ? text =
                            "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de sobrepeso"
                        : imc > 30 && imc < 35
                            ? text =
                                "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de obesidade grau I"
                            : imc > 35 && imc < 40
                                ? text =
                                    "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de obesidade grau II (severa)"
                                : imc >= 40
                                    ? text =
                                        "Seu imc é: ${imc.toStringAsFixed(2)}, você está em estado de obesidade grau III (mórbida)"
                                    : text = "";
    return text;
  }
}

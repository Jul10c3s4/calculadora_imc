import 'package:calculadora_imc/models/pessoa.dart';
import 'package:calculadora_imc/shared/widgets/Custom-card.dart';
import 'package:calculadora_imc/shared/widgets/custom-text.dart';
import 'package:calculadora_imc/shared/widgets/custom-textField.dart';
import 'package:flutter/material.dart';

class CalculatorImcPage extends StatefulWidget {
  const CalculatorImcPage({super.key});

  @override
  State<CalculatorImcPage> createState() => _CalculatorImcPageState();
}

class _CalculatorImcPageState extends State<CalculatorImcPage> {
  final TextEditingController _alturaController =
      TextEditingController(text: "");
  final TextEditingController _pesoController = TextEditingController(text: "");
  var imcs = <Imc>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText.title("Histórico de Imcs"),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: imcs.length,
                          itemBuilder: (context, index) {
                            var imc = imcs[index];
                            return CustomCard(imc: imc);
                          },
                        ),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(
            Icons.history_edu,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: CustomText.title("Calculadora de IMC"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                  title: "Insira seu altura: ",
                  textControler: _alturaController,
                  hintText: "1.80",
                  sufixIcon: const Icon(Icons.height)),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  title: "Insira seu peso: ",
                  textControler: _pesoController,
                  hintText: "60",
                  sufixIcon: const Icon(Icons.scale)),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (_alturaController.text == "" ||
                        _pesoController.text == "") {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: CustomText.subTitle(
                                  "Preencha todos os campos para calcular o imc!"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: CustomText.subTitleOk("ok"))
                              ],
                            );
                          });
                    } else {
                      imcs.add(Imc(double.parse(_pesoController.text),
                          double.parse(_alturaController.text)));
                      _alturaController.text = "";
                      _pesoController.text = "";
                      setState(() {});
                    }
                  },
                  child: CustomText.titleWhite(
                    "Calcular",
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      backgroundColor:
                          const Color.fromARGB(194, 255, 102, 153)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              imcs.isNotEmpty ? CustomCard(imc: imcs.last) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

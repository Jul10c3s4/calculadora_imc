import 'package:calculadora_imc/models/pessoa.dart';
import 'package:calculadora_imc/shared/widgets/custom-text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  Imc imc;
  CustomCard({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    print(imc.peso);
    return Card(
      color: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CustomText.subTitleCard("Altura: ${imc.altura.toString()}"),
                    CustomText.subTitleCard("Peso: ${imc.peso.toString()}")
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CustomText.subTitleCard("Imc: ${imc.getImc()}"),
                const SizedBox(
                  width: 4,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: CustomText.subTitle(imc.calcularIMC()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: CustomText.subTitleOk("ok"))
                            ],
                          );
                        });
                  },
                  child: CustomText.subTitleCardButton("detalhes"),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 0),
                      backgroundColor: Colors.purple),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

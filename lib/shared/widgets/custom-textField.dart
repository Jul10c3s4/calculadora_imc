import 'package:calculadora_imc/shared/widgets/custom-text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String title;
  TextEditingController textControler;
  String hintText;
  Widget sufixIcon;

  CustomTextField(
      {super.key,
      required this.title,
      required this.textControler,
      required this.hintText,
      required this.sufixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.subTitle(title),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: textControler,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: sufixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

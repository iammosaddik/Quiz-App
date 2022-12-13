import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NeuButton extends StatelessWidget {
   NeuButton({Key? key, required this.onTap ,required this.isButtonPressed}) : super(key: key);

  final onTap;
  bool isButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 80.0,
          width: double.infinity,
          child: Icon(Icons.favorite,color:isButtonPressed ? Colors.green: Colors.red.shade400,size: 60,),
          decoration: BoxDecoration(
            color:isButtonPressed ? Colors.black : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(6,6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-6,-6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ]
          ),
        ),
      ),
    );
  }
}

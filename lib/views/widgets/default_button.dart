import 'package:flutter/material.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:30,
      
   
 
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.red,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize:18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

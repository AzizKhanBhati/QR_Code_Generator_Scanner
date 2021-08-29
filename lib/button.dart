import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Widget widget;

  const MyButton({Key? key, required this.name, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 18, vertical: 8)),
          backgroundColor: MaterialStateProperty.all(Colors.grey[200])),
      child: Text(
        name,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
    );
  }
}

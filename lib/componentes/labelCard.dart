import 'package:flutter/material.dart';

class LabelCard extends StatelessWidget {
  final String info;
  final IconData icone;

  const LabelCard({Key? key, required this.info, required this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icone),
            SizedBox(
              width: 20,
            ),
            Text(info),
          ],
        ),
      ),
    );
  }
}

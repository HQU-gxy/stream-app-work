import 'package:flutter/material.dart';
import 'package:work2/controlObj.dart';

class StupidButton extends StatelessWidget {
  final ControlObject object;
  const StupidButton({Key? key, required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final em = MediaQuery.of(context).textScaleFactor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape:
            MaterialStateProperty.all(const CircleBorder()),
          ),
          onPressed: object.onPressed,
          child: ClipOval(
            child: Image.asset(
              object.picture,
              height: 35 * em, // magic number
              width: 35 * em,
            ),
          ),
        ),
        Text(
          object.name,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

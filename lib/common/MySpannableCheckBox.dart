import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MySpannableCheckBox extends StatefulWidget {
  const MySpannableCheckBox({super.key});

  @override
  State<MySpannableCheckBox> createState() => _MySpannableCheckBoxState();
}

class _MySpannableCheckBoxState extends State<MySpannableCheckBox> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Color((0xE6969696)));
    TextStyle linkStyle = const TextStyle(color: Colors.green);

    return Row(
      children: [
        Checkbox(
            value: _value,
            onChanged: (newValue) => setState(() => _value = newValue)),
        RichText(

            text: TextSpan(
          style: defaultStyle,
          children: <TextSpan>[
            const TextSpan(text: "By signing up you accept the "),
            TextSpan(
                text: "Term of Service ",
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Term of Service Clicked"),
                    ));
                  }),
            const TextSpan(text: " on "),
            TextSpan(
                text: "Privacy policy",
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Privacy policy Clicked"),
                    ));
                  }),
          ],
        ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/MyToast.dart';

// Reference : PageView
// https://www.youtube.com/watch?v=sFXg-phkbQU
class NutritionScreen extends StatefulWidget {
  final TextStyle optionStyle;

  const NutritionScreen({
    super.key,
    required this.optionStyle,
  });

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        displayToast("Page ${index + 1}",ToastGravity.BOTTOM);
      },
      children: [
        Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              "Page1",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 34,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          color: Colors.green,
          child: const Center(
            child: Text(
              "Page2",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 34,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          child: const Center(
            child: Text(
              "Page3",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 34,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

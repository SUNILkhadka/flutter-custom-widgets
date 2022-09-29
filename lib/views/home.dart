import 'package:custom_components/core/color.dart';
import 'package:custom_components/core/routes.dart';
import 'package:custom_components/views/utilities/custompainter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  Size buttonSize = const Size(300, 70);
  List<Set> myList = [
    {'Custom Buttons', Icons.smart_button, Routes.buttons},
    {'Custom Slider', Icons.slideshow, Routes.sliders},
  ];
  double figWidth = 300;

  Widget elevatedButton(
    BuildContext context, {
    required String routeName,
    required IconData icon,
    required String label,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
          fixedSize: buttonSize, backgroundColor: AppColor.primaryColor),
      icon: Icon(icon),
      label: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Widgets'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                CustomPaint(
                  size: Size(figWidth, (figWidth * 0.625).toDouble()),
                  painter: RPSCustomPainter(),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return elevatedButton(
                      context,
                      routeName: myList.elementAt(index).last,
                      label: myList.elementAt(index).first,
                      icon: myList.elementAt(index).elementAt(1),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  }),
                  itemCount: myList.length,
                ),
              ],
            ),
          ),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ElevatedButton.icon(
        //         onPressed: () {
        //           Navigator.popAndPushNamed(context, Routes.buttons);
        //         },
        //         style: ElevatedButton.styleFrom(fixedSize: buttonSize),
        //         icon: const Icon(Icons.smart_button),
        //         label: const Text('Custom Buttons'),
        //       ),
        //       ElevatedButton.icon(
        //         onPressed: () {
        //           Navigator.popAndPushNamed(context, Routes.sliders);
        //         },
        //         icon: const Icon(Icons.slideshow),
        //         label: const Text('Custom Buttons'),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

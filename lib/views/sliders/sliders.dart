// ignore_for_file: avoid_print

import 'package:custom_components/core/color.dart';
import 'package:custom_components/views/sliders/customslidertheme.dart';
import 'package:custom_components/views/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  const SlidersPage({super.key});

  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double sliderValue = 50;
  double bigSliderValue = 50;
  int indexTop = 0;
  double min = 0;
  double max = 100;
  int divisions = 5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Slider'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            normalSlider(context),
            const CustomSliderTheme(),
            cupertionSliders(context),
            dissabledSlider(context),
            bigHorizontalSlider(context),
            Expanded(
              child: bigVerticalSlider(context),
            ),
          ],
        ),
      ),
    );
  }

  SliderTheme bigVerticalSlider(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          trackHeight: 70,
          overlayShape: SliderComponentShape.noOverlay,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
          overlayColor: Colors.transparent,
          trackShape: RectangularSliderTrackShape()),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 10),
              child: labelText(min, 0, 60),
            ),
            Expanded(
              child: Stack(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                        label: bigSliderValue.round().toString(),
                        value: bigSliderValue,
                        min: min,
                        max: max,
                        onChanged: (value) {
                          setState(() {
                            bigSliderValue = value;
                          });
                        }),
                  ),
                  Center(
                    child: Text(
                      bigSliderValue.round().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 10),
              child: labelText(max, 0, 60),
            ),
          ],
        ),
      ),
    );
  }

  SliderTheme bigHorizontalSlider(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 50,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          labelText(min, 20, 40),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: Slider(
              value: bigSliderValue,
              onChanged: (value) {
                setState(() {
                  bigSliderValue = value;
                });
              },
              min: min,
              max: max,
            ),
          ),
          labelText(max, 0, 50),
        ],
      ),
    );
  }

  SliderTheme dissabledSlider(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
          // You can set dissabled parameters here !
          ),
      child: Slider(
        value: 50,
        onChanged: null,
        min: min,
        max: max,
      ),
    );
  }

  SizedBox cupertionSliders(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlider(
        value: sliderValue,
        min: min,
        max: max,
        onChanged: onChanged,
        onChangeStart: (value) {
          print('Onchanged Dragging');
        },
        onChangeEnd: (value) {
          print('Onchanged Endedd');
        },
      ),
    );
  }

  SliderTheme normalSlider(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: Colors.green,
        inactiveTrackColor: const Color.fromARGB(255, 3, 8, 104),
        trackHeight: 2,
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        thumbColor: Colors.green,
        overlayColor: Colors.green.withOpacity(0.3),
        valueIndicatorColor: Colors.green.withOpacity(0.3),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 15),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 10,
        ),
      ),
      child: Row(
        children: [
          labelText(min, 10, 40),
          Expanded(
            child: Slider(
              label: '${sliderValue.toInt()}',
              divisions: 100,
              value: sliderValue,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
          labelText(max, 5, 50),
        ],
      ),
    );
  }

  void onChanged(value) {
    setState(() {
      sliderValue = value;
    });
  }

  labelText(double value, double padding, double width) => Container(
        padding: EdgeInsets.all(padding),
        width: width,
        child: Text(
          value.round().toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      );
}




// class CustomSlider extends StatefulWidget {
//   final double value;
//   final double min;
//   final double max;
//   final double radiusOfSliderBob;
//   final double activeLineHeight;
//   final double inactiveLineHeight;
//   final ValueChanged<double> onChanged;
//   final Color? activeColor;
//   final Color? inactiveColor;
//   final Color? bobColor;
//   final double? height;
//   const CustomSlider({
//     super.key,
//     this.radiusOfSliderBob = 5,
//     this.activeLineHeight = 4,
//     this.inactiveLineHeight = 2,
//     required this.value,
//     required this.onChanged,
//     this.min = 0.0,
//     this.max = 1.0,
//     this.activeColor = const Color(0xFFad7ffb),
//     this.inactiveColor = const Color.fromARGB(255, 3, 8, 104),
//     this.bobColor = const Color.fromARGB(255, 3, 8, 104),
//     this.height,
//   })  : assert(min <= max),
//         assert(value >= min && value <= max);

//   @override
//   State<CustomSlider> createState() => _CustomSliderState();
// }

// class _CustomSliderState extends State<CustomSlider> {
//   late double activeWidth;

//   @override
//   void initState() {
//     activeWidth = widget.value;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraint) {
//       return SizedBox(
//         height: widget.height ?? constraint.maxHeight,
//         width: constraint.maxWidth,
//         child: Stack(
//           children: [
//             Container(
//               height: widget.activeLineHeight,
//               color: widget.activeColor,
//               width: activeWidth,
//             ),
//             Container(
//               height: widget.inactiveLineHeight,
//               color: widget.inactiveColor,
//               width: constraint.maxWidth - 10,
//             )
//           ],
//         ),
//       );
//     });
//   }
// }

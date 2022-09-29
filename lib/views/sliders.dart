import 'package:custom_components/color.dart';
import 'package:custom_components/views/utils.dart';
import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  const SlidersPage({super.key});

  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double sliderValue = 50;
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
        body: SliderTheme(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              normalSlider(),
              divisionSlider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget divisionSlider() {
    final labels = ['0', '20', '40', '60', '80', '100', '+'];
    double min = 0;
    double max = labels.length - 1;
    int divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Methods.modelBuilder(
              labels,
              (index, label) {
                final selectedColor = Colors.black;
                final unselectedColor = Colors.black.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label, color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          divisions: divisions,
          value: indexTop.toDouble(),
          min: min,
          max: max,
          onChanged: (index) {
            setState(() {
              indexTop = index.toInt();
            });
          },
        ),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      Container(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  Row normalSlider() {
    return Row(
      children: [
        labelText(min),
        Expanded(
          child: Slider(
            label: '${sliderValue.toInt()}',
            divisions: 100,
            value: sliderValue,
            min: min,
            max: max,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
        ),
        labelText(max),
      ],
    );
  }

  labelText(double value) => Container(
        padding: value == 0 ? EdgeInsets.all(20) : EdgeInsets.zero,
        width: 40,
        child: Text(
          value.round().toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      );
}

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final double radiusOfSliderBob;
  final double activeLineHeight;
  final double inactiveLineHeight;
  final ValueChanged<double> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? bobColor;
  final double? height;
  const CustomSlider({
    super.key,
    this.radiusOfSliderBob = 5,
    this.activeLineHeight = 4,
    this.inactiveLineHeight = 2,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.activeColor = const Color(0xFFad7ffb),
    this.inactiveColor = const Color.fromARGB(255, 3, 8, 104),
    this.bobColor = const Color.fromARGB(255, 3, 8, 104),
    this.height,
  })  : assert(min <= max),
        assert(value >= min && value <= max);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double activeWidth;

  @override
  void initState() {
    activeWidth = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      return SizedBox(
        height: widget.height ?? constraint.maxHeight,
        width: constraint.maxWidth,
        child: Stack(
          children: [
            Container(
              height: widget.activeLineHeight,
              color: widget.activeColor,
              width: activeWidth,
            ),
            Container(
              height: widget.inactiveLineHeight,
              color: widget.inactiveColor,
              width: constraint.maxWidth - 10,
            )
          ],
        ),
      );
    });
  }
}

import 'package:custom_components/views/utilities/utils.dart';
import 'package:flutter/material.dart';

class CustomSliderTheme extends StatefulWidget {
  const CustomSliderTheme({super.key});

  @override
  State<CustomSliderTheme> createState() => _CustomSliderThemeState();
}

class _CustomSliderThemeState extends State<CustomSliderTheme> {
  int indexTop = 0;

  @override
  Widget build(BuildContext context) {
    const activeColor = Colors.deepOrange;
    final inactiveColor = Colors.orange.shade200;
    const double thumbRadius = 14;
    const double tickMarkRadius = 8;
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: activeColor,
        inactiveTrackColor: inactiveColor,
        thumbColor: activeColor,
        trackHeight: 5,
        thumbShape:
            const RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
        tickMarkShape:
            const RoundSliderTickMarkShape(tickMarkRadius: tickMarkRadius),
        activeTickMarkColor: activeColor,
        inactiveTickMarkColor: inactiveColor,
        overlayColor: activeColor.shade100,
      ),
      child: () {
        final labels = ['0', '20', '40', '60', '80', '100', '+'];
        double min = 0;
        double max = labels.length - 1;
        int divisions = labels.length - 1;

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: Utilities.modelBuilder(
                  labels,
                  (index, label) {
                    const selectedColor = Colors.black;
                    final unselectedColor = Colors.black.withOpacity(0.3);
                    final isSelected = index <= indexTop;
                    final color = isSelected ? selectedColor : unselectedColor;

                    return buildLabel(label: label, color: color, width: 35);
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
      }(),
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );
}

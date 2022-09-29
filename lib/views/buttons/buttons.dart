import 'package:custom_components/core/color.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  Color containerColor = AppColor.backgroundshadeblue;
  Size buttonSize = const Size(300, 70);
  TextStyle textStyle = const TextStyle().copyWith(
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    onPressed() {
      setState(() {
        containerColor = AppColor.backgroundshadepink;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          width: 400,
          color: containerColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textNormalButton(onPressed),
              textIconButton(onPressed),
              elevatedNormalButton(onPressed),
              elevatedIconButton(onPressed),
              outlinedButton(onPressed)
            ],
          ),
        ),
      ),
    );
  }

  OutlinedButton outlinedButton(onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: buttonSize,
        side: const BorderSide(width: 2),
      ),
      child: const Text('Outlined Button'),
    );
  }

  ElevatedButton elevatedIconButton(VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.access_alarm),
      label: Text(
        'Elevated Icon Button',
        style: textStyle,
      ),
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => const BorderSide(color: Colors.green, width: 3)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => AppColor.secondaryColor),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20));
        }),
      ),
    );
  }

  TextButton textNormalButton(VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: () {
        setState(() {
          containerColor = AppColor.backgroundshadeblue;
        });
      },
      autofocus: false,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        minimumSize: buttonSize,
        padding: const EdgeInsets.all(5),
        backgroundColor: AppColor.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Text(
        'Text Button 1',
        style: textStyle,
      ),
    );
  }

  ElevatedButton elevatedNormalButton(VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        enableFeedback: false,
        animationDuration: const Duration(seconds: 5),
        backgroundColor: AppColor.backgroundGray,
        shadowColor: Colors.orange,
        surfaceTintColor: Colors.blue,
        elevation: 5,
        padding: const EdgeInsets.all(15),
        minimumSize: buttonSize,
        side: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'ElevatedButton',
        style: textStyle.copyWith(
          color: AppColor.black,
        ),
      ),
    );
  }

  Widget textIconButton(VoidCallback onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.smart_button),
      label: Text(
        'TextIcon Button',
        style: textStyle,
      ),
      style: TextButton.styleFrom(
          fixedSize: buttonSize,
          side: BorderSide(
            width: 3,
            color: AppColor.primaryColor,
            style: BorderStyle.solid,
            strokeAlign: StrokeAlign.inside,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          )),
          elevation: 3,
          backgroundColor: Colors.white),
    );
  }
}

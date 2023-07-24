import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

const borderColor = Colors.green;
const sidebarColor = Colors.green;
const backgroundStartColor = Colors.green;
const backgroundEndColor = Colors.green;
final buttonColors = WindowButtonColors(iconNormal: Colors.green, mouseOver: Colors.green[100], mouseDown: Colors.green, iconMouseOver: Colors.green, iconMouseDown: Colors.green);
final closeButtonColors = WindowButtonColors(mouseOver: const Color(0xFFD32F2F), mouseDown: Colors.green, iconNormal: Colors.green, iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

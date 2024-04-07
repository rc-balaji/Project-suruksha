import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  final String leftText;
  final String rightText;
  final ValueChanged<bool>? onChanged;
  final bool initialValue;

  const ToggleSwitch({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.onChanged,
    this.initialValue = false,
  }) : super(key: key);

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged?.call(_value);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _value ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.leftText,
              style: TextStyle(
                color: _value ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Text(
              widget.rightText,
              style: TextStyle(
                color: _value ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

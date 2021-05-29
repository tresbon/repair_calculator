import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorResult extends StatelessWidget {
  final String header;
  final String result;

  CalculatorResult({this.header, this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          header,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        Center(
          child: Text(result,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

class CalculatorField extends StatelessWidget {
  final String header;
  final Widget child;

  CalculatorField({this.header, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontSize: 17),
          ),
          child
        ],
      ),
    );
  }
}

class CalculatorInput extends StatelessWidget {
  final Pattern pattern;
  final int maxLength;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;

  CalculatorInput(
      {this.pattern, this.maxLength, this.keyboardType, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 17),
      inputFormatters: [
        FilteringTextInputFormatter.allow(pattern),
        LengthLimitingTextInputFormatter(maxLength)
      ],
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}

class CalculatorRadio<T> extends StatelessWidget {
  final String title;
  final ValueChanged<T> onChanged;
  final T value;
  final T groupValue;

  CalculatorRadio({this.title, this.value, this.groupValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      leading:
          Radio(value: value, groupValue: groupValue, onChanged: onChanged),
    );
  }
}

class CalculatorCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CalculatorCheckbox({this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "С подгоном по рисунку",
        style: TextStyle(fontSize: 17),
      ),
      leading: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
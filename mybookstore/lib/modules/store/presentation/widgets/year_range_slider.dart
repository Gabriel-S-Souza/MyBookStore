import 'package:flutter/material.dart';

class YearRangeSlider extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final ValueChanged<RangeValues> onChanged;

  const YearRangeSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  State<YearRangeSlider> createState() => _YearRangeSliderState();
}

class _YearRangeSliderState extends State<YearRangeSlider> {
  late RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    _rangeValues = RangeValues(widget.minValue.toDouble(), widget.maxValue.toDouble());
  }

  @override
  Widget build(BuildContext context) => RangeSlider(
        values: _rangeValues,
        min: widget.minValue.toDouble(),
        max: widget.maxValue.toDouble(),
        divisions: widget.maxValue - widget.minValue,
        labels: RangeLabels(
          _rangeValues.start.round().toString(),
          _rangeValues.end.round().toString(),
        ),
        onChanged: (values) {
          setState(() {
            _rangeValues = values;
          });
          widget.onChanged(values);
        },
      );
}

import 'package:delivery_app/src/Colors/colors.dart';
import 'package:flutter/material.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues _values = RangeValues(0.3, 1.0);
  int _minPrice = 0;
  int _maxPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$_minPrice €', style: TextStyle(fontSize: 16)),
        Container(
          width: 300,
          child: RangeSlider(
            overlayColor: MaterialStateProperty.all(gris),
            activeColor: orange,
            inactiveColor: gris,
            values: _values,
            min: 0,
            max: 1000,
            onChanged: (RangeValues newValue) {
              setState(() {
                _values = newValue;
                _minPrice = _values.start.round();
                _maxPrice = _values.end.round();
              });
            },
          ),
        ),
        Text('$_maxPrice €', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

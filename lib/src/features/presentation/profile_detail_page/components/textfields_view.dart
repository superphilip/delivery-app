import 'package:delivery_app/src/utils/Extensions/screen_size.dart';
import 'package:flutter/material.dart';

class TextfieldsProfileDetailView extends StatelessWidget {
  const TextfieldsProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        _createTextFieldUsername(context),
        _createTextFieldEmail(context),
        _createTextFieldPhone(context),
        _createTextFieldDateOfBirth(context),
        _createTextFieldDeliveryAdress(context)
      ],
    );
  }
}

Widget _createTextFieldUsername(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      ),
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
        ),
      ),
    ),
  );
}

Widget _createTextFieldEmail(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      ),
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
        ),
      ),
    ),
  );
}

Widget _createTextFieldPhone(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      ),
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Phone',
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
        ),
      ),
    ),
  );
}

Widget _createTextFieldDateOfBirth(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      ),
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          hintText: 'Date of Birth',
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
        ),
      ),
    ),
  );
}

Widget _createTextFieldDeliveryAdress(BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.85),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor
        )
      ),
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        maxLines: 2,
        decoration: InputDecoration(
          hintText: 'Delivery Address',
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
        ),
      ),
    ),
  );
}

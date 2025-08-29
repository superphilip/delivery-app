import 'package:delivery_app/src/Colors/colors.dart';
import 'package:delivery_app/src/Features/presentation/commons_widgets/commons_widgets.dart';
import 'package:flutter/material.dart';

class ListTitleChecked extends StatefulWidget {
  final String texto;
  final bool isActive;
  final void Function()? func;

  const ListTitleChecked({super.key, this.texto = '', this.isActive = false, this.func});

  @override
  State<ListTitleChecked> createState() => _ListTitleCheckedState();
}

class _ListTitleCheckedState extends State<ListTitleChecked> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_listTiles(context: context, texto: widget.texto, isActive: widget.isActive, func: widget.func)],
    );
  }
}

Widget _listTiles({
  required BuildContext context,
  required String texto,
  bool isActive = false,
  void Function()? func,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
    ),
    child: ListTile(
      onTap: func,
      title: headerText(texto, isActive ? orange : Colors.black, 17, FontWeight.w400),
      trailing: Icon(isActive ? Icons.check : null, color: orange),
    ),
  );
}

import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;
  const CategoryModal({Key? key, this.categoria}) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff0f2041),
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
      );
}

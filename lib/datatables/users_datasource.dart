import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/usuario.dart';

class UsersDTS extends DataTableSource {
  final BuildContext context;
  final List<Usuario> users;

  UsersDTS(this.users, this.context);

  @override
  DataRow getRow(int index) {
    final Usuario user = this.users[index];

    final image =
        Image(image: AssetImage('no-image.jpg'), width: 35, height: 35);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(child: image)),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(IconButton(
            onPressed: () {
              NavigationService.replaceTo('/dashboard/users/${user.uid}');
            },
            icon: Icon(Icons.edit_outlined))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}

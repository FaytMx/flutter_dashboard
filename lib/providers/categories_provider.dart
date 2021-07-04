import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/models/category.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');

    final categoriesResp = CategoriesResponse.fromMap(resp);

    this.categorias = [...categoriesResp.categorias];

    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {
      "nombre": name,
    };

    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);

      categorias.add(newCategory);

      notifyListeners();
    } catch (e) {
      print(e);
      throw 'Error al crear la categoria';
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {
      "nombre": name,
    };

    try {
      await CafeApi.put('/categorias/$id', data);

      this.categorias = this.categorias.map((c) {
        if (c.id != id) {
          return c;
        }
        c.nombre = name;
        return c;
      }).toList();

      notifyListeners();
    } catch (e) {
      print(e);
      throw 'Error al actualizar la categoria';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.delete('/categorias/$id', {});

      this.categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

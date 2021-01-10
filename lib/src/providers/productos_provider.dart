import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:rellenitos_delivery/src/models/producto_model.dart';

class ProductosProvider {
  final String _url =
      'https://rellenitos-delivery-backend.herokuapp.com/loader';

  Future<List<ProductoModel>> loadProducts() async {
    final resp = await postRequest();

    //final decodedDataPrev = json.decode(resp.body);

    final List<ProductoModel> listaProductos = new List();
    //print(decodedDataPrev);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null) return [];

    decodedData.forEach((descriptor, producto) {
      final prodTemp = ProductoModel.fromJson(producto);

      if (prodTemp != null) {
        if (prodTemp.flagActivadoNumero == "1") {
          listaProductos.add(prodTemp);
        }
      }
    });

    return listaProductos;
  }

  Future<http.Response> postRequest() async {
    Map data = {'token': '12345678901234567890'};
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(_url,
        headers: {"Content-Type": "application/json"}, body: body);
    //print("${response.statusCode}");
    //print("${response.body}");
    return response;
  }
}

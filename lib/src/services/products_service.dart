import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:rellenitos_delivery/src/models/producto_model.dart';

class ProductsService with ChangeNotifier {
  ProductoModel _product;

  List<ProductoModel> _productList;

  ProductoModel get product => this._product;

  List<ProductoModel> get productList => _productList;

  bool get existProduct => this._product != null ? true : false;

  bool get existProductList => this._productList != null ? true : false;

  set product(ProductoModel p_product) {
    this._product = p_product;
    notifyListeners();
  }

  set productList(List<ProductoModel> p_productList) {
    this._productList = p_productList;
    notifyListeners();
  }

  final String _url = 'https://rellenitos-delivery-app.herokuapp.com/loader';

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

    productList = listaProductos;

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

  ProductoModel mtdBuscarProducto(String idProducto) {
    ProductoModel productoResponse;

    productoResponse = null;

    if (this.existProductList) {
      productoResponse =
          productList.where((x) => x.idProducto == idProducto).first;
    }

    return productoResponse;
  }

  Future<List<Detalle>> mtdBuscarDetalleProducto(
      int p_tipo, String p_idProducto) async {
    ProductoModel productoSeleccionado;
    List<Detalle> detalleListResponse;

    detalleListResponse = null;

    if (this.existProductList) {
      productoSeleccionado =
          productList.where((x) => x.idProducto == p_idProducto).first;

      switch (p_tipo) {
        case 1:
          detalleListResponse = productoSeleccionado.detalleBase;
          break;
/*          
        case 2:
          detalleListResponse = productoSeleccionado.detalleAgregado;
          break;
        case 3:
          detalleListResponse = productoSeleccionado.detalleExtras;
          break;
*/
      }
    }

    return detalleListResponse;
  }
}

import 'package:flutter/material.dart';
import 'package:rellenitos_delivery/src/widgets/detalles_producto.dart';

class DetallesProductoHelper {
  @required
  static final String idProducto = '';

  static exit(context, idProducto) => showDialog(
      context: context,
      builder: (context) => DetallesProducto(idProducto: idProducto));
}

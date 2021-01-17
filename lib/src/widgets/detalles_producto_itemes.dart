import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rellenitos_delivery/src/services/products_service.dart';
import 'package:rellenitos_delivery/src/models/producto_model.dart';
import 'package:rellenitos_delivery/src/widgets/boton_detalle.dart';

class DetallesProductoItemes extends StatelessWidget {
  @required
  final String idProducto;

  const DetallesProductoItemes({this.idProducto});

  @override
  Widget build(BuildContext context) {
    final productsService =
        Provider.of<ProductsService>(context, listen: false);

    return FutureBuilder(
      future: productsService.mtdBuscarDetalleProducto(1, idProducto),
      builder: (BuildContext context, AsyncSnapshot<List<Detalle>> snapshot) {
        if (snapshot.hasData) {
          final listaDetalles = snapshot.data;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listaDetalles.length,
              itemBuilder: (context, i) =>
                  Container(child: BotonDetalle(detalle: listaDetalles[i]))
//                  Text(listaDetalles[i].titulo)
              );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

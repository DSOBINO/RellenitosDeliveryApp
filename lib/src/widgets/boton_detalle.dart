import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rellenitos_delivery/src/models/producto_model.dart';
import 'package:rellenitos_delivery/src/services/products_service.dart';

class BotonDetalle extends StatelessWidget {
  @required
  final Detalle detalle;

  const BotonDetalle({this.detalle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text(detalle.cantidadNumero.toString()),
          SizedBox(width: 20, height: 20),
          Text(detalle.titulo),
          SizedBox(width: 20, height: 20),
          imagenDetalle(detalle.foto1)
        ],
      ),
    );
  }

  Widget imagenDetalle(String p_Foto) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3.0),
            topRight: Radius.zero,
            bottomLeft: Radius.circular(3.0),
            bottomRight: Radius.zero),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[Image.network(p_Foto, fit: BoxFit.cover)],
        ),
      ),
      width: 20,
      height: 20,
      margin: EdgeInsets.fromLTRB(2, 2, 2, 0),

/*
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(2, 3),
              blurRadius: 3),
        ],
        borderRadius: BorderRadius.circular(3),
      ),
*/
    );
  }
}

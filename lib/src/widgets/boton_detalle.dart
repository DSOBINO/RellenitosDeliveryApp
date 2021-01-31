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
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          /*
          image: const DecorationImage(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            fit: BoxFit.cover,
          ),
          */
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            SizedBox(width: 5, height: 5),
            ConstrainedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(detalle.cantidadNumero.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.amberAccent)),
                  ]),
              constraints: BoxConstraints(
                minWidth: 20,
                maxWidth: 30,
              ),
            ),
            SizedBox(width: 2, height: 5),
            ConstrainedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("x",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ]),
              constraints: BoxConstraints(
                minWidth: 20,
                maxWidth: 30,
              ),
            ),
            SizedBox(width: 2, height: 5),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(detalle.titulo),
                  ]),
            ),
            SizedBox(width: 5, height: 5),
            imagenDetalle(detalle.foto1)
          ],
        ),
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
      width: 40,
      height: 40,
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

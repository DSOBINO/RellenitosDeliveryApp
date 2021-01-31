import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rellenitos_delivery/src/services/products_service.dart';
import 'package:rellenitos_delivery/src/models/producto_model.dart';
import 'package:rellenitos_delivery/src/widgets/detalles_producto_itemes.dart';

class DetallesProducto extends StatelessWidget {
  @required
  final String idProducto;

  const DetallesProducto({this.idProducto});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: _buildChild(context, idProducto));
  }

  Widget _buildChild(BuildContext context, String idProducto) {
    final productsService = Provider.of<ProductsService>(context, listen: true);

    ProductoModel productoFicha = productsService.mtdBuscarProducto(idProducto);
    int cantidadDetalles = 0;
    double fieldSpaceHeight = 0;

    if (productsService.existProductList) {
      cantidadDetalles = productoFicha.detalleBase.length;
    }

    Widget card;

    card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(productoFicha.foto1),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 100.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Text(productoFicha.titulo),
                        SizedBox(height: fieldSpaceHeight),
                        Text(productoFicha.subTitulo1),
                      ])),
                ]),
                SizedBox(width: fieldSpaceHeight, height: fieldSpaceHeight),
                DetallesProductoItemes(idProducto: idProducto),
                SizedBox(width: fieldSpaceHeight, height: fieldSpaceHeight),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                  SizedBox(width: 8, height: 8),
                  RaisedButton(
                      onPressed: () {},
                      child: Text('Yes'),
                      color: Colors.white,
                      textColor: Colors.redAccent)
                ])
              ])),

          /*
          Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  
                  Text('Cantidad detalles : ${cantidadDetalles.toString()}'),
                  
                ],
              ))

        */
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

/*
          
          Column(
        children: <Widget>[
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            SizedBox(width: 8),
            RaisedButton(
                onPressed: () {},
                child: Text('Yes'),
                color: Colors.white,
                textColor: Colors.redAccent)
          ])
        ],
      )
      */

}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rellenitos_delivery/src/models/producto_model.dart';
import 'package:rellenitos_delivery/src/services/products_service.dart';

class BotonGordo extends StatelessWidget {
  @required
  final String idProducto;
  final Function onPress;

  const BotonGordo({this.idProducto, this.onPress});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context, listen: true);

    ProductoModel productoFicha = productsService.mtdBuscarProducto(idProducto);

    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _BotonProductoBackground(productoFicha.foto1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100, width: 40),
              SizedBox(width: 20),
              Expanded(
                  child: Text(productoFicha.titulo,
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonProductoBackground extends StatelessWidget {
  final String fotoProducto;

  const _BotonProductoBackground(this.fotoProducto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.zero,
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.zero),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(this.fotoProducto, fit: BoxFit.cover)
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

/*
class _BotonGordoBackground extends StatelessWidget {
  
    final IconData icon;
    final Color color1;
    final Color color2;

  const _BotonGordoBackground( this.icon, this.color1, this.color2 );

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon( this.icon, size: 150, color: Colors.white.withOpacity(0.2) )
            )
          ],
        ),
      ),

      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all( 20 ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow( color: Colors.black.withOpacity(0.2), offset: Offset(4,6), blurRadius: 10 ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
          ]
        )
      ),
    );
  }
}
*/

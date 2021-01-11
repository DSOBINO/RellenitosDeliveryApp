import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rellenitos_delivery/src/models/producto_model.dart';
import 'package:rellenitos_delivery/src/providers/productos_provider.dart';
import 'package:rellenitos_delivery/src/widgets/boton_gordo.dart';
import 'package:animate_do/animate_do.dart';

class DespliegueProductos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _MainScroll(),
        Positioned(bottom: -10, right: 0, child: _BotonNewList())
      ],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {},
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductoModel>>(
      future: productosProvider
          .loadProducts(), // this is a code smell. Make sure that the future is NOT recreated when build is called. Create the future in initState instead.
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        Widget newsListSliver;
        if (snapshot.hasData) {
          final listaProductos = snapshot.data;
          newsListSliver = SliverList(
            delegate: SliverChildListDelegate(
                List.generate(listaProductos.length, (idx) {
              return _crearBotonProducto(listaProductos[idx]);
            })),
          );
        } else {
          newsListSliver = SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          );
        }

        return CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                floating: true,
                delegate:
                    _SliverCustomHeaderDelegate(minheight: 170, maxheight: 300
/*                    
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      child: _Titulo(),
                    )
*/
                        )),
            newsListSliver
          ],
        );
      },
    );
  }
/*
  Widget _createProductDisplay() {
    return FutureBuilder(
      future: productosProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final listaProductos = snapshot.data;

          return ListView.builder(
            itemCount: listaProductos.length,
            itemBuilder: (context, i) => _crearBotonProducto(listaProductos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
*/

  Widget _crearBotonProducto(ProductoModel producto) {
    return BotonGordo(
      icon: FontAwesomeIcons.plus,
      texto: producto.titulo,
      fotoProducto: producto.foto1,
      color1: Color(0xff317183),
      color2: Color(0xff46997D),
      onPress: () {
        print('Click sobre botón ${producto.titulo}.');
      },
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  //final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minheight, @required this.maxheight
      //@required this.child
      });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(fit: StackFit.expand, children: [
      Image.network(
          'https://images.pexels.com/photos/747964/pexels-photo-747964.jpeg',
          fit: BoxFit.cover),
/*          
      Positioned(
          top: 0,
          bottom: 400,
          left: 0,
          right: 500,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              ))),
*/
      Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black54],
          stops: [0.5, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      )),
      Positioned(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
        child: Text('Lorem Ipsum',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
            )),
      )
    ]);

    //SizedBox.expand(child: child);
  }

  double titleOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight;
    //|| child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

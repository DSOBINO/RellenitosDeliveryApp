import 'package:flutter/material.dart';
import 'package:rellenitos_delivery/src/models/producto_model.dart';
import 'package:rellenitos_delivery/src/providers/productos_provider.dart';

class DespliegueProductos extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despliegue Productos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Despliegue Productos'),
        ),
        body: _createProductDisplay(),
      ),
    );
  }

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

  Widget _crearBotonProducto(ProductoModel producto) {
    return ListTile(
        title: Text('${producto.titulo} - ${producto.precioActualNumero}'),
        subtitle: Image.network(producto.foto1));
  }
}

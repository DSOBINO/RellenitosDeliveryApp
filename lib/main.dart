import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rellenitos_delivery/despliegue_productos.dart';
import 'package:rellenitos_delivery/main3.dart';
import 'package:rellenitos_delivery/src/services/products_service.dart';
import 'package:rellenitos_delivery/src/web_view_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new ProductsService())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => MyApp2(),
          'listado': (_) => DespliegueProductos(),
          'WebViewExample': (_) => WebViewExample(),
        },
      ),
    );
  }
}

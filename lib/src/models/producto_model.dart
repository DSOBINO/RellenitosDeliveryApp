// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  ProductoModel({
    this.idProducto,
    this.flagActivadoNumero,
    this.titulo,
    this.subTitulo1,
    this.subTitulo2,
    this.foto1,
    this.foto2,
    this.nombre,
    this.precioActualNumero,
    this.precioAntesNumero,
    this.descuentoNumero,
    this.fechaInicio,
    this.fechaTermino,
    this.detalleBase,
    this.detalleAgregado,
    this.detalleExtras,
  });

  String idProducto;
  String flagActivadoNumero;
  String titulo;
  String subTitulo1;
  String subTitulo2;
  String foto1;
  String foto2;
  String nombre;
  String precioActualNumero;
  String precioAntesNumero;
  String descuentoNumero;
  String fechaInicio;
  String fechaTermino;
  List<Detalle> detalleBase;
  List<Detalle> detalleAgregado;
  List<Detalle> detalleExtras;

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        idProducto: json["ID_Producto"],
        flagActivadoNumero: json["Flag_Activado_Numero"],
        titulo: json["Titulo"],
        subTitulo1: json["SubTitulo_1"],
        subTitulo2: json["SubTitulo_2"],
        foto1: json["Foto_1"],
        foto2: json["Foto_2"],
        nombre: json["Nombre"],
        precioActualNumero: json["Precio_Actual_Numero"],
        precioAntesNumero: json["Precio_Antes_Numero"],
        descuentoNumero: json["Descuento_Numero"],
        fechaInicio: json["Fecha_Inicio"],
        fechaTermino: json["Fecha_Termino"],
        detalleBase: List<Detalle>.from(
            json["Detalle_Base"].map((x) => Detalle.fromJson(x))),
        detalleAgregado: List<Detalle>.from(
            json["Detalle_Agregado"].map((x) => Detalle.fromJson(x))),
        detalleExtras: List<Detalle>.from(
            json["Detalle_Extras"].map((x) => Detalle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID_Producto": idProducto,
        "Flag_Activado_Numero": flagActivadoNumero,
        "Titulo": titulo,
        "SubTitulo_1": subTitulo1,
        "SubTitulo_2": subTitulo2,
        "Foto_1": foto1,
        "Foto_2": foto2,
        "Nombre": nombre,
        "Precio_Actual_Numero": precioActualNumero,
        "Precio_Antes_Numero": precioAntesNumero,
        "Descuento_Numero": descuentoNumero,
        "Fecha_Inicio": fechaInicio,
        "Fecha_Termino": fechaTermino,
        "Detalle_Base": List<dynamic>.from(detalleBase.map((x) => x.toJson())),
        "Detalle_Agregado":
            List<dynamic>.from(detalleAgregado.map((x) => x.toJson())),
        "Detalle_Extras":
            List<dynamic>.from(detalleExtras.map((x) => x.toJson())),
      };
}

class Detalle {
  Detalle({
    this.idProducto,
    this.flagActivadoNumero,
    this.prioridad,
    this.destacado,
    this.cantidadNumero,
    this.titulo,
    this.subTitulo,
    this.valorMedida,
    this.valorUnidad,
    this.valorAdelante,
    this.foto1,
    this.foto2,
  });

  String idProducto;
  String flagActivadoNumero;
  String prioridad;
  String destacado;
  String cantidadNumero;
  String titulo;
  String subTitulo;
  String valorMedida;
  String valorUnidad;
  String valorAdelante;
  String foto1;
  String foto2;

  factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        idProducto: json["ID_Producto"],
        flagActivadoNumero: json["Flag_Activado_Numero"],
        prioridad: json["Prioridad"],
        destacado: json["Destacado"],
        cantidadNumero: json["Cantidad_Numero"],
        titulo: json["Titulo"],
        subTitulo: json["SubTitulo"],
        valorMedida: json["Valor_Medida"],
        valorUnidad: json["Valor_Unidad"],
        valorAdelante: json["Valor_Adelante"],
        foto1: json["Foto_1"],
        foto2: json["Foto_2"],
      );

  Map<String, dynamic> toJson() => {
        "ID_Producto": idProducto,
        "Flag_Activado_Numero": flagActivadoNumero,
        "Prioridad": prioridad,
        "Destacado": destacado,
        "Cantidad_Numero": cantidadNumero,
        "Titulo": titulo,
        "SubTitulo": subTitulo,
        "Valor_Medida": valorMedida,
        "Valor_Unidad": valorUnidad,
        "Valor_Adelante": valorAdelante,
        "Foto_1": foto1,
        "Foto_2": foto2,
      };
}

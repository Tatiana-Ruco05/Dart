/*Desarrolle una aplicación que calcule propinas para servicios de delivery. 
Solicite el valor del pedido, seleccione el tipo de servicio (comida, farmacia, supermercado) 
y la calidad del servicio (excelente 20%, bueno 15%, regular 10%). Calcule la propina sugerida, 
el total a pagar y muestre un mensaje personalizado según la calificación del servicio.
*/
import 'dart:io';

void main(List<String> args) {
  print('Ingrese el valor de la compra: ');
  //String? recibe nulos y es la forma como recibe datos readLineSync
  String? valor_recibido = stdin.readLineSync();
  double valor_pedido = double.parse(valor_recibido ?? '0');
  print(valor_pedido);

  //seleccionar el tipo de servicio
  print("Seleccione el servicio: ");
  print("1. Comida");
  print("2. Farmacia");
  print("3. Supermercado");
  print("Opcion: ");
  String? opcion_entrada = stdin.readLineSync();
  int tipo_servicio = int.parse(opcion_entrada ?? '0');

  // seleccion de calificacion servicio //

  print("Ingrese la opcion de la calificacion de servicio dada por el usuario");
  print("1. Excelente");
  print("2. Bueno");
  print("3. Regular");

  int calificacionServicio = 0;
  calificacionServicio = int.parse(
    stdin.readLineSync()!,
  ); // "!" Hace que un valor no pueda ser nulo

  double propinaTotal = 0; // double almacena numeros decimales

  if (calificacionServicio == 1) {
    print("Excelente");
    propinaTotal = valor_pedido * 0.20;
    print("El valor de la tu propina seria de $propinaTotal");
  } else if (calificacionServicio == 2) {
    print("Bueno");
    propinaTotal = valor_pedido * 0.15;
    print("El valor de la tu propina seria de $propinaTotal");
  } else if (calificacionServicio == 3) {
    print("Regular");
    propinaTotal = valor_pedido * 0.10;
  }

  String servicio = "";
  switch (tipo_servicio) {
    case 1:
      servicio = "Comida";
      break;
    case 2:
      servicio = "Farmacia";
      break;
    case 3:
      servicio = "Supermercado";
      break;
    default:
      servicio = "No encontrado";
      break;
  }
  print(servicio);
}

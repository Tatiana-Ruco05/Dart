/*Ejercicio 3: Calculadora de Tiempo de Viaje Urbano
Implemente una calculadora que estime tiempos de viaje considerando diferentes medios de transporte y
condiciones de tráfico. Solicite origen, destino (distancia en km), medio de transporte (a pie, bicicleta, carro,
transporte público) y hora del día (hora pico, normal). Calcule tiempo estimado y costo total.*/

import 'dart:io';

void main() {
  print('Ingrese distancia en km: ');
  double distancia = double.parse(stdin.readLineSync()!);

  print('Medio de transporte (pie, bicicleta, carro, publico): ');
  String medio = stdin.readLineSync()!;
  
  /* signo de exclamación ! se usa principalmente para la anulación de nulos (nullable),
   indicando que una variable que podría ser nula tiene un valor en tiempo de ejecución*/
  print('Hora del día (pico, normal): ');
  String hora = stdin.readLineSync()!;

  // Velocidades promedio (km/h) y costos por km
  double velocidad = 0.0;
  double costoPorKm = 0.0;

  switch (medio) {
    case 'pie':
      velocidad = 5.0;
      costoPorKm = 0.0;
      break;
    case 'bicicleta':
      velocidad = 15.0;
      costoPorKm = 0.1;
      break;
    case 'carro':
      velocidad = 40.0;
      costoPorKm = 0.5;
      if (hora == 'pico') velocidad *= 0.7;
      break;
    case 'publico':
      velocidad = 20.0;
      costoPorKm = 0.3;
      if (hora == 'pico') velocidad *= 0.8; 
    default:
      print('Medio no válido.');
      return;
  }

  // Tiempo en horas y minutos
  double tiempoHoras = distancia / velocidad;
  int tiempoMinutos = (tiempoHoras * 60).round();

  // Costo total
  double costoTotal = distancia * costoPorKm;

  print('\nTiempo estimado: $tiempoMinutos minutos');
  print('Costo total: \$${costoTotal.toStringAsFixed(2)}');
}
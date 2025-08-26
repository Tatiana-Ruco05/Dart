/*Ejercicio 7: Gestor de Ubicaciones Favoritas
Desarrolle un sistema para gestionar ubicaciones favoritas tipo GPS. Cree una clase Ubicacion con nombre,
latitud, longitud, categoría (casa, trabajo, restaurante, hospital) y notas. Permita agregar, eliminar, buscar por
categoría y calcular distancia aproximada entre dos ubicaciones. */

import 'dart:math';

class Ubicacion {
  String nombre;
  double latitud;
  double longitud;
  String categoria; // casa, trabajo, restaurante, hospital
  String notas;

  //this-- se refiere a la instancia actual del objeto o clase en la que se está ejecutando un método o constructor
  Ubicacion(
    this.nombre,
    this.latitud,
    this.longitud,
    this.categoria,
    this.notas,
  );

    //// Distancia aproximada usando fórmula de Pythagoras simple
    double distanciaA(Ubicacion otra) {
    double dx = latitud - otra.latitud;
    double dy = longitud - otra.longitud;
    return sqrt(dx * dx + dy * dy);
  }

  void mostrar() {
    print('$nombre ($categoria) - $latitud, $longitud | $notas');
  }
}

void main() {
  List<Ubicacion> ubicaciones = [];

  // Agregar ubicaciones
  ubicaciones.add(Ubicacion('Casa', 4.61, -74.08, 'casa', 'Mi hogar'));
  ubicaciones.add(Ubicacion('Trabajo', 4.63, -74.07, 'trabajo', 'Oficina'));
  ubicaciones.add(Ubicacion('Restaurante', 4.62, -74.09, 'restaurante', 'Pizza place'),
  );

  // Mostrar todas
  print('--- Todas las ubicaciones ---');
  ubicaciones.forEach((u) => u.mostrar());

  // Buscar por categoría
  print('\n--- Restaurantes ---');
  ubicaciones
      .where((u) => u.categoria == 'restaurante')
      .forEach((u) => u.mostrar());

  // Calcular distancia entre dos ubicaciones
  print(
    '\nDistancia Casa-Trabajo: ${ubicaciones[0].distanciaA(ubicaciones[1])}',
  );
}

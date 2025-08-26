/*Ejercicio 6: Sistema de Notificaciones Push
Diseñe un simulador de sistema de notificaciones para aplicaciones móviles. Cree una clase Notificacion con
propiedades: título, mensaje, tipo (info, advertencia, error), fecha/hora, leída/no leída. Implemente métodos para
crear, marcar como leída, filtrar por tipo y mostrar estadísticas de notificaciones. */

import 'dart:io';

class Notificacion {
  String titulo;
  String mensaje;
  String tipo; // info, advertencia, error
  // DateTime-- es una clase que representa un punto específico en el tiempo, incluyendo fecha y hora con precisión de microsegundos
  DateTime fechaHora;
  bool leida;

  Notificacion(this.titulo, this.mensaje, this.tipo)
    : fechaHora = DateTime.now(),
      leida = false;

  void marcarLeida() {
    leida = true;
  }

  //toString() es un método que se utiliza para obtener la representación en cadena de un objeto.
  String toString() {
    return '$titulo ($tipo) - $mensaje [$fechaHora] - ${leida ? "Leída" : "No leída"}';
  }
}

void main() {
  List<Notificacion> notificaciones = [];

  // Crear notificaciones de ejemplo
  notificaciones.add(Notificacion('Bienvenida', 'Hola usuario', 'info'));
  notificaciones.add(Notificacion('Alerta', 'Batería baja', 'advertencia'));
  notificaciones.add(Notificacion('Error', 'Conexión fallida', 'error'));

  // Marcar una como leída
  notificaciones[1].marcarLeida();

  // Filtrar por tipo (info, advertencia, error)
  stdout.write('Filtrar por tipo (info, advertencia, error): ');
  String filtro = stdin.readLineSync()!.toLowerCase();
  var filtradas = notificaciones.where((n) => n.tipo == filtro).toList();

  
  print('\nNotificaciones filtradas:');
  for (var n in filtradas) {
    print(n);
  }

  // Estadísticas de como se mostratra al imprimir
  int total = notificaciones.length;
  int leidas = notificaciones.where((n) => n.leida).length;
  print('\nEstadísticas: $leidas leídas de $total.');
}

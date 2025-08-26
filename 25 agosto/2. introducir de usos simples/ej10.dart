/*Ejercicio 10: Sistema de Valoraciones y Reseñas
Desarrolle un sistema de reseñas tipo app store. Cree clase Reseña con usuario, calificación (1-5 estrellas),
comentario, fecha y utilidad. Implemente funciones para agregar reseñas, calcular promedio de calificaciones,
filtrar por estrellas, mostrar reseñas más útiles y generar estadísticas.*/

// Clase Resena: Representa una reseña con usuario, calificación, comentario, fecha y utilidad.
class Resena {
  String usuario;
  int calificacion; // 1-5
  String comentario;
  DateTime fecha;
  int utilidad;

  Resena(this.usuario, this.calificacion, this.comentario, this.fecha, this.utilidad);
}

// Clase SistemaResenas: Maneja una lista de reseñas con funciones para agregar, filtrar, etc.
class SistemaResenas {
  List<Resena> resenas = []; 

  void agregar(Resena resena) {
    resenas.add(resena);
  }

  // Calcula el promedio de calificaciones usando map y reduce.
  double promedioCalificaciones() {
    if (resenas.isEmpty) return 0;
    return resenas.map((r) => r.calificacion).reduce((a, b) => a + b) / resenas.length;
  }

  List<Resena> filtrarPorEstrellas(int estrellas) {
    return resenas.where((r) => r.calificacion == estrellas).toList();
  }
 
  List<Resena> resenasMasUtiles(int top) {
    List<Resena> sorted = List.from(resenas)..sort((a, b) => b.utilidad.compareTo(a.utilidad));
    return sorted.sublist(0, top < sorted.length ? top : sorted.length);
  }

  // Genera estadísticas: cuenta reseñas por estrellas y muestra promedio.
  void generarEstadisticas() {
    for (int i = 1; i <= 5; i++) {
      int count = filtrarPorEstrellas(i).length; 
      print('$i estrellas: $count reseñas');
    }
    print('Promedio: ${promedioCalificaciones()}'); 
  }
}

// Función principal: Prueba las funcionalidades del sistema de reseñas.
void main() {
  SistemaResenas sistema = SistemaResenas(); 
  sistema.agregar(Resena('User1', 4, 'Bueno', DateTime.now(), 10)); 
  sistema.agregar(Resena('User2', 2, 'Malo', DateTime.now(), 5)); 
  print('Promedio: ${sistema.promedioCalificaciones()}'); 
  sistema.generarEstadisticas(); 
  List<Resena> utiles = sistema.resenasMasUtiles(1); 
  print('Más útil: ${utiles[0].usuario}'); 
}
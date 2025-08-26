/*Ejercicio 8: Reproductor de Lista Musical
Implemente un reproductor musical básico con clase Cancion (título, artista, duración, género, calificación) y clase
Playlist. Funcionalidades: crear playlist, agregar/quitar canciones, reproducir aleatoria, calcular duración total,
filtrar por género y mostrar estadísticas de reproducción.*/
import 'dart:math';


// Clase Cancion: Representa una canción con título, artista, duración, género y calificación.
class Cancion {
  String titulo;
  String artista;
  int duracion; 
  String genero;
  double calificacion;

  Cancion(this.titulo, this.artista, this.duracion, this.genero, this.calificacion);
}

// Clase Playlist: Maneja una lista de canciones con funciones para agregar, quitar, reproducir, etc.
class Playlist {
  List<Cancion> canciones = [];

  void agregar(Cancion cancion) {
    canciones.add(cancion);
    print('Canción agregada: ${cancion.titulo}');
  }

  void quitar(String titulo) {
    canciones.removeWhere((c) => c.titulo == titulo);
    print('Canción quitada: $titulo');
  }

  void reproducirAleatoria() {
    if (canciones.isEmpty) return;
    Random random = Random();
    int indice = random.nextInt(canciones.length);
    print('Reproduciendo: ${canciones[indice].titulo} de ${canciones[indice].artista}');
  }

  // Calcula la duración total sumando las duraciones con fold.
  //fold()--  es un método de Iterable y Stream que reduce una colección a un único valor acumulado.
  int duracionTotal() {
    return canciones.fold(0, (sum, c) => sum + c.duracion);
  }

  List<Cancion> filtrarPorGenero(String genero) {
    return canciones.where((c) => c.genero == genero).toList();
  }

  void mostrarEstadisticas() {
    if (canciones.isEmpty) return;
    double promedio = canciones.map((c) => c.calificacion).reduce((a, b) => a + b) / canciones.length;
    print('Duración total: ${duracionTotal()} seg. Promedio calificación: $promedio');
  }
}

// Función principal: Prueba las funcionalidades de la playlist.
void main() {
  Playlist playlist = Playlist();
  playlist.agregar(Cancion('Song1', 'Artista1', 180, 'Rock', 4.5));
  playlist.agregar(Cancion('Song2', 'Artista2', 200, 'Pop', 3.8));
  playlist.reproducirAleatoria();
  playlist.mostrarEstadisticas();
  List<Cancion> rock = playlist.filtrarPorGenero('Rock');
  print('Canciones Rock: ${rock.length}');
}







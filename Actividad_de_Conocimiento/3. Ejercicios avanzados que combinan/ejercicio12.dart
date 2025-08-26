/*
Ejercicio 12: Red Social de Intercambio de Libros
Desarrolle una red social para intercambio de libros con clases Usuario, Libro, Intercambio y Reseña. Los
usuarios publican libros disponibles, solicitan intercambios, califican transacciones y escriben reseñas. Incluya
sistema de reputación, historial de intercambios, búsqueda avanzada y notificaciones de nuevos libros.
---------------------------------------------
*/

// Clase Usuario
class Usuario {
  String nombre;
  List<Libro> librosDisponibles = [];
  List<Intercambio> historialIntercambios = [];
  double reputacion = 0.0;

  Usuario(this.nombre);

  // Método para publicar un libro
  void publicarLibro(Libro libro) {
    librosDisponibles.add(libro);
    print("$nombre ha publicado el libro: ${libro.titulo}");
  }

  // Método para solicitar intercambio
  void solicitarIntercambio(Libro libro, Usuario otroUsuario) {
    print("$nombre solicita intercambio a ${otroUsuario.nombre} por el libro: ${libro.titulo}");
    Intercambio intercambio = Intercambio(this, otroUsuario, libro);
    historialIntercambios.add(intercambio);
    otroUsuario.historialIntercambios.add(intercambio);
  }
}

// Clase Libro
class Libro {
  String titulo;
  String autor;

  Libro(this.titulo, this.autor);
}

// Clase Intercambio
class Intercambio {
  Usuario solicitante;
  Usuario receptor;
  Libro libro;
  bool completado = false;

  Intercambio(this.solicitante, this.receptor, this.libro);

  // Método para completar intercambio
  void completar() {
    completado = true;
    print("Intercambio completado entre ${solicitante.nombre} y ${receptor.nombre} por el libro ${libro.titulo}");
  }
}

// Clase Resena (antes Reseña, corregido para Dart)
class Resena {
  Usuario autor;
  String comentario;
  int estrellas;

  Resena(this.autor, this.comentario, this.estrellas);

  void mostrarResena() {
    print("Reseña de ${autor.nombre}: $comentario - ${estrellas} estrellas");
  }
}

// ----------------- MAIN -----------------
void main() {
  // Crear usuarios
  Usuario ana = Usuario("Ana");
  Usuario pedro = Usuario("Pedro");

  // Crear libros
  Libro libro1 = Libro("Cien Años de Soledad", "Gabriel García Márquez");
  Libro libro2 = Libro("La Ciudad y los Perros", "Mario Vargas Llosa");

  // Publicar libros
  ana.publicarLibro(libro1);
  pedro.publicarLibro(libro2);

  // Solicitar intercambio
  ana.solicitarIntercambio(libro2, pedro);

  // Crear intercambio manual y completarlo
  Intercambio intercambio = Intercambio(ana, pedro, libro2);
  intercambio.completar();

  // Crear reseña
  Resena resena1 = Resena(ana, "Muy buen intercambio, excelente experiencia.", 5);
  resena1.mostrarResena();

  Resena resena2 = Resena(pedro, "Todo salió bien, recomendado.", 4);
  resena2.mostrarResena();
}
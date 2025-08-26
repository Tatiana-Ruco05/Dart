// Ejercicio 14: Sistema de Gestión de Eventos Comunitarios
/*Implemente una plataforma para organizar eventos locales con clases Organizador, Evento, Participante,
ubicación y categoría. Los organizadores crean eventos, los usuarios se registran, sistema de pagos, check-in
QR, notificaciones automáticas, evaluación post-evento y estadísticas de asistencia.
// Clases: Organizador, Evento, Participante, Ubicacion, Categoria
// Funcionalidades: crear eventos, registrar usuarios, sistema de pagos, check-in QR, estadísticas.
*/
class Organizador {
  String nombre;
  List<Evento> eventos = [];

  Organizador(this.nombre);

  void crearEvento(Evento evento) {
    eventos.add(evento);
    print(" El organizador $nombre creó el evento '${evento.titulo}'.");
  }

  void mostrarEventos() {
    print("\nEventos creados por $nombre:");
    for (var e in eventos) {
      print("- ${e.titulo} en ${e.ubicacion.nombreLugar}");
    }
  }
}

class Evento {
  String titulo;
  String categoria;
  Ubicacion ubicacion;
  double precioEntrada;
  List<Participante> participantes = [];

  Evento(this.titulo, this.categoria, this.ubicacion, this.precioEntrada);

  void registrarParticipante(Participante p) {
    participantes.add(p);
    print("${p.nombre} se registró en el evento '$titulo'.");
  }

  void mostrarEstadisticas() {
    print("\n Estadísticas del evento '$titulo':");
    print("Categoría: $categoria");
    print("Ubicación: ${ubicacion.nombreLugar}");
    print("Participantes inscritos: ${participantes.length}");
  }
}

class Ubicacion {
  String nombreLugar;
  String direccion;

  Ubicacion(this.nombreLugar, this.direccion);
}

class Participante {
  String nombre;
  bool pagoRealizado = false;
  bool checkIn = false;

  Participante(this.nombre);

  void pagar(double monto) {
    pagoRealizado = true;
    print("$nombre pagó \$${monto.toStringAsFixed(2)}");
  }

  void hacerCheckIn() {
    if (pagoRealizado) {
      checkIn = true;
      print("$nombre hizo check-in con QR.");
    } else {
      print(" $nombre no ha pagado, no puede hacer check-in.");
    }
  }
}

void main() {
  Organizador juan = Organizador("Juan Pérez");

  // Crear ubicación y evento
  Ubicacion salon = Ubicacion("Salón Comunal", "Calle 45 #12-30");
  Evento concierto = Evento("Concierto Comunitario", "Música", salon, 10.0);

  // Organizador crea evento
  juan.crearEvento(concierto);

  // Participantes
  Participante ana = Participante("Ana");
  Participante pedro = Participante("Pedro");

  concierto.registrarParticipante(ana);
  concierto.registrarParticipante(pedro);

  // Pagos y check-in
  ana.pagar(10.0);
  ana.hacerCheckIn();

  pedro.hacerCheckIn(); // sin pagar

  // Estadísticas
  concierto.mostrarEstadisticas();
  juan.mostrarEventos();
}
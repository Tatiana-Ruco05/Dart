/*15: Marketplace de Servicios Profesionales
Desarrolle un Marketplace completo tipo &quot;servicios a domicilio&quot; con clases Cliente, Prestador, Servicio, Solicitud,
Pago y Calificación. Sistema de cotizaciones, agenda de citas, seguimiento en tiempo real, sistema de pagos,
calificaciones bidireccionales, historial de servicios y panel de estadísticas para prestadores.
*/
class Cliente {
  String nombre;
  List<Solicitud> solicitudes = [];

  Cliente(this.nombre);

  void solicitarServicio(Servicio servicio, Prestador prestador) {
    Solicitud nueva = Solicitud(this, prestador, servicio);
    solicitudes.add(nueva);
    prestador.solicitudes.add(nueva);
    print("$nombre solicitó el servicio '${servicio.nombre}' a ${prestador.nombre}.");
  }
}

class Prestador {
  String nombre;
  List<Servicio> servicios = [];
  List<Solicitud> solicitudes = [];

  Prestador(this.nombre);

  void agregarServicio(Servicio servicio) {
    servicios.add(servicio);
    print(" ${servicio.nombre} agregado a la lista de ${nombre}.");
  }

  void mostrarSolicitudes() {
    print("\nSolicitudes para $nombre:");
    for (var s in solicitudes) {
      print("- Servicio: ${s.servicio.nombre}, Cliente: ${s.cliente.nombre}, Estado: ${s.estado}");
    }
  }
}

class Servicio {
  String nombre;
  double precio;

  Servicio(this.nombre, this.precio);
}

class Solicitud {
  Cliente cliente;
  Prestador prestador;
  Servicio servicio;
  String estado = "Pendiente";

  Solicitud(this.cliente, this.prestador, this.servicio);

  void aceptar() {
    estado = "Aceptada";
    print("Solicitud de ${cliente.nombre} para '${servicio.nombre}' aceptada por ${prestador.nombre}.");
  }

  void pagar() {
    if (estado == "Aceptada") {
      Pago pago = Pago(cliente, prestador, servicio.precio);
      pago.realizarPago();
      estado = "Pagada";
    } else {
      print("No se puede pagar porque la solicitud aún no ha sido aceptada.");
    }
  }

  void calificar(int estrellas) {
    if (estado == "Pagada") {
      Calificacion cal = Calificacion(cliente, prestador, estrellas);
      cal.mostrarCalificacion();
    } else {
      print("No se puede calificar sin pagar primero.");
    }
  }
}

class Pago {
  Cliente cliente;
  Prestador prestador;
  double monto;

  Pago(this.cliente, this.prestador, this.monto);

  void realizarPago() {
    print("${cliente.nombre} pagó \$${monto.toStringAsFixed(2)} a ${prestador.nombre}.");
  }
}

class Calificacion {
  Cliente cliente;
  Prestador prestador;
  int estrellas;

  Calificacion(this.cliente, this.prestador, this.estrellas);

  void mostrarCalificacion() {
    print(" ${cliente.nombre} calificó a ${prestador.nombre} con $estrellas estrellas.");
  }
}

void main() {
  // Crear cliente y prestador
  Cliente laura = Cliente("Laura");
  Prestador pedro = Prestador("Pedro - Plomero");

  // Crear servicio
  Servicio plomeria = Servicio("Reparación de tuberías", 80.0);
  pedro.agregarServicio(plomeria);

  // Cliente solicita servicio
  laura.solicitarServicio(plomeria, pedro);

  // Prestador acepta solicitud
  pedro.solicitudes[0].aceptar();

  // Cliente paga
  pedro.solicitudes[0].pagar();

  // Cliente califica
  pedro.solicitudes[0].calificar(5);

  // Ver historial del prestador
  pedro.mostrarSolicitudes();
}

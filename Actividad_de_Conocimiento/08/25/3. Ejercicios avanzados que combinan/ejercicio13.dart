/*
Ejercicio 13: Finanzas Personales
Cree una aplicación completa de finanzas con clases Usuario, Cuenta, transacción, categoría y Presupuesto.
Funcionalidades: múltiples cuentas, categorización automática de gastos, presupuestos mensuales, alertas de
sobregiro, reportes financieros, metas de ahorro y análisis de patrones de gasto.
-----------------------------------
*/

class Usuario {
  String nombre;
  List<Cuenta> cuentas = [];

  Usuario(this.nombre);

  // Método para agregar una cuenta
  void agregarCuenta(Cuenta cuenta) {
    cuentas.add(cuenta);
    print("Cuenta '${cuenta.nombre}' agregada para $nombre.");
  }

  // Método para mostrar resumen financiero del usuario
  void mostrarResumen() {
    print("\n   Resumen financiero de $nombre    ");
    for (var cuenta in cuentas) {
      cuenta.mostrarCuenta();
    }
  }
}

// Clase Cuenta
class Cuenta {
  String nombre;
  double _saldo = 0.0;
  List<Transaccion> transacciones = [];

  Cuenta(this.nombre, [this._saldo = 0.0]);

  double get saldo => _saldo;

  // Método para agregar una transacción
  void agregarTransaccion(Transaccion t) {
    if (t.tipo == "gasto" && t.monto > _saldo) {
      print("Alerta: saldo insuficiente en la cuenta $nombre para realizar este gasto.");
    } else {
      if (t.tipo == "gasto") {
        _saldo -= t.monto;
      } else {
        _saldo += t.monto;
      }
      transacciones.add(t);
      print("Transacción registrada en $nombre: ${t.descripcion} (${t.tipo}) -> \$${t.monto}");
    }
  }

  // Método para mostrar detalles de la cuenta
  void mostrarCuenta() {
    print("\n--- Cuenta: $nombre ---");
    print("Saldo actual: $_saldo");
    print("Historial de transacciones:");
    for (var t in transacciones) {
      print("- ${t.descripcion}: ${t.tipo} de \$${t.monto}");
    }
  }
}

// Clase Transaccion
class Transaccion {
  String descripcion;
  double monto;
  String tipo; // ingreso o gasto
  String categoria;

  Transaccion(this.descripcion, this.monto, this.tipo, this.categoria);
}

void main() {
  // Crear usuario
  Usuario ana = Usuario("Ana");

  // Crear cuentas
  Cuenta cuentaAhorros = Cuenta("Ahorros", 1000.0);
  Cuenta cuentaNomina = Cuenta("Nómina", 500.0);

  // Agregar cuentas al usuario
  ana.agregarCuenta(cuentaAhorros);
  ana.agregarCuenta(cuentaNomina);

  // Registrar transacciones
  cuentaAhorros.agregarTransaccion(Transaccion("Depósito inicial", 200.0, "ingreso", "ahorro"));
  cuentaAhorros.agregarTransaccion(Transaccion("Pago luz", 120.0, "gasto", "servicios"));
  cuentaNomina.agregarTransaccion(Transaccion("Sueldo mensual", 800.0, "ingreso", "trabajo"));
  cuentaNomina.agregarTransaccion(Transaccion("Supermercado", 300.0, "gasto", "hogar"));
  cuentaNomina.agregarTransaccion(Transaccion("Ropa", 200.0, "gasto", "personal"));

  // Mostrar resumen financiero
  ana.mostrarResumen();
}

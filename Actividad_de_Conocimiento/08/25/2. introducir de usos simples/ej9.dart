/*Ejercicio 9: Gestor de Archivos Móvil
Cree un simulador de gestor de archivos para dispositivos móviles. Defina clase Archivo con nombre, tamaño,
tipo, fecha creación y ruta. Implemente operaciones: listar archivos, buscar por nombre/tipo, calcular espacio
usado, organizar por fecha/tamaño y simular transferencias entre carpetas.*/

// Clase Archivo: Representa un archivo con nombre, tamaño, tipo, fecha de creación y ruta.
class Archivo {
  String nombre;
  int tamano; // en KB
  String tipo;
  DateTime fechaCreacion;
  String ruta;

  Archivo(this.nombre, this.tamano, this.tipo, this.fechaCreacion, this.ruta);
}

// Clase GestorArchivos: Maneja una lista de archivos con operaciones como listar, buscar, organizar.
class GestorArchivos {
  List<Archivo> archivos = []; 

 
  void agregar(Archivo archivo) {
    archivos.add(archivo);
  }


  void listar() {
    for (Archivo a in archivos) {
      print('${a.nombre} - ${a.tamano} KB - ${a.ruta}');
    }
  }

  // Busca archivos por nombre usando where para filtrar.
  List<Archivo> buscarPorNombre(String nombre) {
    return archivos.where((a) => a.nombre.contains(nombre)).toList();
  }

  
  List<Archivo> buscarPorTipo(String tipo) {
    return archivos.where((a) => a.tipo == tipo).toList();
  }

  // Calcula el espacio total usado sumando tamaños con fold.
  int espacioUsado() {
    return archivos.fold(0, (sum, a) => sum + a.tamano);
  }

  // Organiza archivos por fecha de creación usando sort.
  void organizarPorFecha() {
    archivos.sort((a, b) => a.fechaCreacion.compareTo(b.fechaCreacion));
    print('Organizado por fecha');
  }

  
  void organizarPorTamano() {
    archivos.sort((a, b) => a.tamano.compareTo(b.tamano));
    print('Organizado por tamaño');
  }

 
  void transferir(Archivo archivo, String nuevaRuta) {
    archivo.ruta = nuevaRuta;
    print('Transferido ${archivo.nombre} a $nuevaRuta');
  }
}

// Función principal: Prueba las funcionalidades del gestor de archivos.
void main() {
  GestorArchivos gestor = GestorArchivos(); 
  gestor.agregar(Archivo('file1.txt', 100, 'txt', DateTime.now(), '/home')); 
  gestor.agregar(Archivo('file2.jpg', 200, 'jpg', DateTime(2023), '/home')); 
  gestor.listar(); 
  print('Espacio usado: ${gestor.espacioUsado()} KB'); 
  gestor.organizarPorTamano(); 
  gestor.transferir(gestor.archivos[0], '/downloads'); 
}
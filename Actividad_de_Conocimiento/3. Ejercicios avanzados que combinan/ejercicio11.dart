/*
Ejercicio 11: Plataforma de Cursos Online
Implemente un sistema completo de educación online con clases Usuario, Curso, Leccion y Progreso. Los
usuarios pueden inscribirse en cursos, ver lecciones, marcar completadas y obtener certificados. Incluya sistema
de calificaciones, progreso por curso, estadísticas de aprendizaje y recomendaciones personalizadas.
------------------------------------------
*/

class Usuario {
  String nombre;
  List<Curso> cursosInscritos = []; // lista de cursos a los que se inscribe

  Usuario(this.nombre);

  // método para inscribirse en un curso
  void inscribirse(Curso curso) {
    cursosInscritos.add(curso);
    print("$nombre se inscribió en el curso: ${curso.titulo}");
  }
}

class Curso {
  String titulo;
  List<Leccion> lecciones = []; // lista de lecciones del curso
  Map<Usuario, double> calificaciones = {}; // calificaciones de cada usuario

  Curso(this.titulo);

  // agregar lección al curso
  void agregarLeccion(Leccion l) {
    lecciones.add(l);
  }

  // asignar una nota al usuario
  void calificar(Usuario u, double nota) {
    calificaciones[u] = nota;
    print("El usuario ${u.nombre} obtuvo $nota en $titulo");
  }
}

class Leccion {
  String titulo;
  bool completada = false;

  Leccion(this.titulo);

  // marcar la lección como terminada
  void marcarCompletada() {
    completada = true;
  }
}

class Progreso {
  Usuario usuario;
  Curso curso;

  Progreso(this.usuario, this.curso);

  // calcula el porcentaje de avance del usuario
  double calcularProgreso() {
    int total = curso.lecciones.length;
    int completadas = curso.lecciones.where((l) => l.completada).length;
    return (completadas / total) * 100;
  }
}

void main() {
  Usuario u1 = Usuario("Ana");
  Curso c1 = Curso("Flutter Básico");

  // agregar lecciones
  c1.agregarLeccion(Leccion("Introducción"));
  c1.agregarLeccion(Leccion("Widgets"));

  // inscribir usuario
  u1.inscribirse(c1);

  // marcar lecciones y calcular progreso
  c1.lecciones[0].marcarCompletada();
  Progreso p = Progreso(u1, c1);
  print("Progreso de ${u1.nombre}: ${p.calcularProgreso()}%");
}
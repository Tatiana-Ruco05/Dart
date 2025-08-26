/*
Ejercicio 2: Verificador de Contraseñas Seguras
Cree un sistema que evalúe la fortaleza de contraseñas para aplicaciones móviles. Solicite una contraseña al
usuario y verifique: longitud mínima 8 caracteres, contiene mayúsculas, minúsculas, números y caracteres
especiales. Asigne puntaje (débil, media, fuerte, muy fuerte) y sugiera mejoras específicas.
-------------------------------------------------
Este programa solicita una contraseña al usuario y evalúa su fortaleza.

*/

import 'dart:io';

void main() {
  // Solicitar contraseña
  print("Ingrese una contraseña :");
  String? password = stdin.readLineSync();

  // Validar que no sea nula
  if (password == null || password.isEmpty) {
    print("No ingresó ninguna contraseña.");
    return;
  }

  // Variables de verificación
  bool tieneMayus = password.contains(RegExp(r'[A-Z]'));
  bool tieneMinus = password.contains(RegExp(r'[a-z]'));
  bool tieneNumero = password.contains(RegExp(r'[0-9]'));
  bool tieneEspecial = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
  bool longitudOk = password.length >= 8;

  // Calcular puntaje
  int puntaje = 0;
  if (tieneMayus) puntaje++;
  if (tieneMinus) puntaje++;
  if (tieneNumero) puntaje++;
  if (tieneEspecial) puntaje++;
  if (longitudOk) puntaje++;

  // Determinar nivel de seguridad
  String nivel = "";
  if (puntaje <= 2) {
    nivel = "Débil";
  } else if (puntaje == 3) {
    nivel = "Media";
  } else if (puntaje == 4) {
    nivel = "Fuerte";
  } else {
    nivel = "Muy fuerte";
  }

  print("Seguridad de la contraseña: $nivel");

  // Sugerencias de mejora
  if (!longitudOk) print("- La contraseña debe tener al menos 8 caracteres.");
  if (!tieneMayus) print("- Agrega al menos una letra mayúscula.");
  if (!tieneMinus) print("- Agrega al menos una letra minúscula.");
  if (!tieneNumero) print("- Incluye al menos un número.");
  if (!tieneEspecial) print("- Incluye un caracter especial (!, @, #, etc).");
}
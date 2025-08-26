/*Ejercicio 4: Generador de QR para WiFi
Desarrolle un generador de códigos QR para redes WiFi. Solicite el nombre de la red, contraseña, tipo de
seguridad (WPA, WEP, abierta) y genere un string con formato QR. Valide que la contraseña sea segura y
muestre instrucciones de uso para diferentes dispositivos móviles.*/
import 'dart:io';

void main() {
  print('Nombre de la red (SSID): ');
  String ssid = stdin.readLineSync()!;

  print('Contraseña: ');
  String contr = stdin.readLineSync()!;

 print('Tipo de seguridad (WPA, WEP, abierta): ');
  String seguridad = stdin.readLineSync()!;

  /* RegExp-- sirve para definir un patrón de búsqueda que se utiliza para buscar, validar o manipular texto en cadenas.*/
  /* bool-- es un tipo de dato que se utiliza para representar valores de verdadero o falso*/
  bool isSecure = true;
  if (seguridad != 'ABIERTA') {
    if (contr.length < 8 || !RegExp(r'[A-Z]').hasMatch(contr) || !RegExp(r'[0-9]').hasMatch(contr)) {
      isSecure = false;
      print('Advertencia: La contraseña no es segura (mínimo 8 chars, mayúscula y número).');
    }

    // este else se utiliza para saber si no necesita contraseña si es abierta
  } else {
    contr = ''; 
  }

  // Generar string QR (formato estándar)
  String QRString = 'WIFI:$ssid;   Tipo:$seguridad;   contraseña:$contr;  ;';

  print('\nString para QR: $QRString');
  if (isSecure || seguridad == 'ABIERTA') {
    print('Instrucciones:');
    print('- Android: Usa  como "QR WiFi" y escanea.');
    print('- iOS: Cámara detecta QR WiFi.');
  }
}





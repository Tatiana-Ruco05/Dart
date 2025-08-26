/*Ejercicio 5: Calculadora de Descuentos por Volumen
Cree una aplicación para calcular descuentos escalonados en compras online. Defina rangos de descuento: $0-
$50 (0%), $51-$100 (5%), $101-$200 (10%), $201+ (15%). Solicite el monto de compra, calcule el descuento
aplicable, muestre el ahorro y el total final con IVA (19%).*/
import 'dart:io';

void main() {
  print('Ingrese el monto de la compra ');
    /* signo de exclamación ! se usa principalmente para la anulación de nulos (nullable),
    indicando que una variable que podría ser nula tiene un valor en tiempo de ejecución*/
  print('Hora del día (pico, normal): ');
  double monto = double.parse(stdin.readLineSync()!);

  // Determinar descuento
  double descuentoPorc = 0.0;
  if (monto > 200) descuentoPorc = 0.15;
  else if (monto > 100) descuentoPorc = 0.10;
  else if (monto > 50) descuentoPorc = 0.05;

  double descuento = monto * descuentoPorc;
  double subtotal = monto - descuento;
  double iva = subtotal * 0.19;
  double total = subtotal + iva;

  print('\nDescuento: \$${descuento.toStringAsFixed(2)} (${(descuentoPorc * 100).toStringAsFixed(0)}%)');
  print('Ahorro: \$${descuento.toStringAsFixed(2)}');
  print('Total con IVA (19%): \$${total.toStringAsFixed(2)}');
}
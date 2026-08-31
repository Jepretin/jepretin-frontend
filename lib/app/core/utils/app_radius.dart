// lib/app/core/utils/app_radius.dart
import 'package:flutter/material.dart';

// --- NILAI DOUBLE (Bisa dipakai untuk ukuran Container, dll) ---
const double radiusXS = 4.0;
const double radiusSM = 8.0;
const double radiusMD = 12.0;
const double radiusLG = 16.0;
const double radiusXL = 24.0;
const double radiusFull = 999.0;

// --- BORDER RADIUS HELPER (Biar praktis langsung dipanggil di widget) ---
final BorderRadius borderRadiusXS = BorderRadius.circular(radiusXS);
final BorderRadius borderRadiusSM = BorderRadius.circular(radiusSM);
final BorderRadius borderRadiusMD = BorderRadius.circular(radiusMD);
final BorderRadius borderRadiusLG = BorderRadius.circular(radiusLG);
final BorderRadius borderRadiusXL = BorderRadius.circular(radiusXL);
final BorderRadius borderRadiusFull = BorderRadius.circular(radiusFull);
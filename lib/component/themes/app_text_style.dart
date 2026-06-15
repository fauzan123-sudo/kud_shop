import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  // ─── Heading ──────────────────────────────────────────────
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  // ─── Body ─────────────────────────────────────────────────
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  // ─── Label ────────────────────────────────────────────────
  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  // ─── Caption ──────────────────────────────────────────────
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  // ─── Button ───────────────────────────────────────────────
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // ─── Link ─────────────────────────────────────────────────
  static TextStyle link(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.primary,
  );

  // ─── Error ────────────────────────────────────────────────
  static const TextStyle error = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Colors.red,
  );

  // ─── Hint / Subtitle ──────────────────────────────────────
  static TextStyle hint = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.grey.shade600,
  );
}
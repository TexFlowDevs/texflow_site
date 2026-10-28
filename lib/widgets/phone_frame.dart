import 'package:flutter/material.dart';

class PhoneFrame extends StatelessWidget {
  static const largura = 300.0;
  static const altura = 620.0;

  final Widget child;

  const PhoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      height: altura,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F24),
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: const Color(0xFF3A4270), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 60,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(38),
        child: Stack(
          children: [
            Positioned.fill(child: child),
            Positioned(
              top: 8,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 86,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B0F24),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

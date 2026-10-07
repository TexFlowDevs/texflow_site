import 'package:flutter/material.dart';
import 'package:texflow_site/pages/landing_page.dart';
import 'package:texflow_site/theme/site_theme.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  VisibilityDetectorController.instance.updateInterval = const Duration(
    milliseconds: 80,
  );
  runApp(const TexFlowSite());
}

class TexFlowSite extends StatelessWidget {
  const TexFlowSite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TexFlow - Gestão de processos têxteis',
      debugShowCheckedModeBanner: false,
      theme: SiteTheme.claro,
      home: const LandingPage(),
    );
  }
}

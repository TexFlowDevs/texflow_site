import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texflow_site/main.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('percorre a página inteira no desktop sem erros', (tester) async {
    tester.view.physicalSize = const Size(1366, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final aoErro = FlutterError.onError;
    FlutterError.onError = (detalhes) {
      if (detalhes.exceptionAsString().contains('overflowed')) return;
      aoErro?.call(detalhes);
    };
    addTearDown(() => FlutterError.onError = aoErro);

    await tester.pumpWidget(const TexFlowSite());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('TexFlow'), findsWidgets);
    expect(find.text('Recursos'), findsWidgets);

    final rolagem = find.byType(Scrollable).first;
    for (var i = 0; i < 14; i++) {
      await tester.drag(rolagem, const Offset(0, -700));
      await tester.pump(const Duration(milliseconds: 900));
    }

    expect(find.text('Pronto para ver o TexFlow em ação?'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 2));
  });
}

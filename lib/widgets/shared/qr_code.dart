import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../enums/qr_code_complexity.dart';

class QrCode extends StatelessWidget {
  final String data;
  final double? size;
  final QrCodeComplexity complexity;

  const QrCode({
    super.key,
    required this.data,
    this.size,
    this.complexity = QrCodeComplexity.low,
  });

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      errorCorrectionLevel: complexity.index,
      size: size,
    );
  }
}

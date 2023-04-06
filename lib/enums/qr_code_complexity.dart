/// This enum is used as a more human-readable format
/// of the official QrErrorCorrectLevel for which the
/// documentation isn't quite clear.  <br>
/// This is used more as styling option. <br>
/// <b>The order is important, DON'T change it.</b>
enum QrCodeComplexity {
  /// Equal to QrErrorCorrectLevel.M
  medium, // 0
  /// Equal to QrErrorCorrectLevel.L
  low, // 1
  /// Equal to QrErrorCorrectLevel.H
  extreme, // 2
  /// Equal to QrErrorCorrectLevel.Q
  high, // 3
}

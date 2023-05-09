import 'dart:convert';
import 'dart:developer';

extension PrettyLogger on Map<String, dynamic> {
  void prettyLog() {
    const encoder = JsonEncoder.withIndent('  ');
    final prettyprint = encoder.convert(this);
    log(prettyprint);
  }
}

class LoggerUtils {
  static String createQuery(Map<String, dynamic>? query) {
    if (query == null || query.keys.isEmpty) return '';

    final keys = query.keys.toList();
    var result = '';

    for (var i = 0; i < keys.length; i++) {
      final keyName = keys[i];
      final value = query[keyName];

      final tmp = '$keyName=$value';
      // ignore: use_string_buffers
      result = '$result$tmp';

      if (i != keys.length - 1) result = '$result,';
    }

    return '?$result';
  }
}

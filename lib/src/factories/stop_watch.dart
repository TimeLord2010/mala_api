import 'dart:async';

class StopWatch {
  final String name;
  final Stopwatch _stopwatch = Stopwatch();

  StopWatch(this.name) {
    _stopwatch.start();
  }

  void lap(String lapName) {
    print('$name:$lapName: ${_stopwatch.elapsedMilliseconds}ms');
  }

  void stop() {
    _stopwatch.stop();
    print('$name: ${_stopwatch.elapsedMilliseconds}ms');
  }

  static Future<T> wrap<T>(
    String name,
    Future<T> Function(StopWatch stopWatch) fn,
  ) async {
    var sw = StopWatch(name);
    try {
      return await fn(sw);
    } finally {
      sw.stop();
    }
  }
}

import 'dart:io';

import 'package:logger/logger.dart';

/// Configuration for the Leia SDK Logger.
class MalaSdkLogger {
  static Set<Pattern>? _includeOnlyTags;

  /// Configure the logger with optional tag filtering.
  ///
  /// [includeOnlyTags]: If provided, only logs with tags matching these patterns will be shown.
  /// Patterns can be strings (exact match) or RegExp. If null or empty, all logs will be shown.
  static void configure({Set<Pattern>? includeOnlyTags}) {
    _includeOnlyTags = includeOnlyTags;
  }

  /// Returns true if the given tag should be logged based on current configuration.
  static bool _shouldLogTag(String tag) {
    if (_includeOnlyTags == null || _includeOnlyTags!.isEmpty) {
      return true;
    }
    return _includeOnlyTags!.any((pattern) {
      if (pattern is String) {
        return tag == pattern;
      } else if (pattern is RegExp) {
        return pattern.hasMatch(tag);
      }
      return false;
    });
  }
}

/// Prints messages with the following format:
/// "tag: MESSAGE".
Logger createSdkLogger(
  String tag, {
  bool addPrefix = true,
  Level level = Level.all,
}) {
  return Logger(
    filter: _TagFilter(tag, level),
    output: ConsoleOutput(),
    level: level,
    printer: MalaSdkTaggedPrinter(tag, addSdkPrefix: addPrefix),
  );
}

class _TagFilter extends LogFilter {
  final String tag;
  @override
  final Level level;

  _TagFilter(this.tag, this.level);

  @override
  bool shouldLog(LogEvent event) {
    // Checks for the minimum level
    if (event.level < level) {
      return false;
    }

    // Checks if the tag is allowed to be printed
    return MalaSdkLogger._shouldLogTag(tag);
  }
}

class MalaSdkTaggedPrinter extends LogPrinter {
  final String tag;
  final SimplePrinter _simplePrinter;
  final bool addSdkPrefix;

  static bool addTime = false;

  MalaSdkTaggedPrinter(this.tag, {this.addSdkPrefix = true})
    : _simplePrinter = SimplePrinter(colors: !Platform.isIOS, printTime: false);

  @override
  List<String> log(LogEvent event) {
    var originalLines = _simplePrinter.log(event);
    String getTimeStr() {
      var dt = DateTime.now();
      return dt.toIso8601String().split('T')[1];
    }

    return originalLines.map((line) {
      String prefix = addSdkPrefix ? 'MalaSDK:$tag' : tag;
      if (addTime) {
        return '($prefix) ${getTimeStr()}: $line';
      } else {
        return '($prefix): $line';
      }
    }).toList();
  }
}

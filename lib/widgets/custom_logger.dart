import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  final bool printTime;
  final DateFormat _dateFormat;

  CustomLogPrinter({
    this.printTime = true,
  }) : _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  static final _levelEmojis = {
    Level.debug: '🐛',
    Level.info: '💡',
    Level.warning: '😱',
    Level.error: '⛔',
  };

  @override
  List<String> log(LogEvent event) {
    final emoji = _levelEmojis[event.level] ?? '📝';
    final timeStr = printTime ? _dateFormat.format(DateTime.now()) : '';
    final prefix = '$timeStr $emoji ${event.level.toString().toUpperCase()}: ';
    final output = <String>['$prefix${event.message}'];

    if (event.error != null) {
      output.add('Error: ${event.error}');
    }

    if (event.stackTrace != null) {
      output.add('StackTrace:');
      output.addAll(event.stackTrace.toString().split('\n'));
    }

    return output;
  }
}

class CustomLogger {
  static final CustomLogger _instance = CustomLogger._internal();
  final Logger _logger;

  factory CustomLogger() => _instance;

  CustomLogger._internal()
      : _logger = Logger(
          printer: CustomLogPrinter(),
          output: ConsoleOutput(),
        );

  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}

class Log {
  static void debug(String message) => CustomLogger().debug(message);
  static void info(String message) => CustomLogger().info(message);
  static void warning(String message) => CustomLogger().warning(message);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    CustomLogger().error(message, error, stackTrace);
  }
}

final logger = CustomLogger();

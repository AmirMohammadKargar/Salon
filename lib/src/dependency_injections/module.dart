import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class Modules {
  @singleton
  Logger get logger => Logger(
        output: ConsoleOutput(),
        printer: PrettyPrinter(
          lineLength: 120,
          methodCount: 3,
          errorMethodCount: 10,
          printEmojis: true,
          printTime: true,
          stackTraceBeginIndex: 0,
        ),
      );
}

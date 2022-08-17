import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    noBoxingByDefault: true,
    excludeBox: const {
      Level.verbose: true,
      Level.debug: true,
      Level.info: true,
      Level.warning: true,
      Level.error: true,
      Level.wtf: true,
    },
    colors: false,
    methodCount: 0,
    printTime: false,
  ),
  filter: ProductionFilter(),
);

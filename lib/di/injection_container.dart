import 'package:api_dio_test/di/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  asExtension: false, // default
  usesNullSafety: true, // default
)
Future<GetIt> initMapsGetIt() async => $initGetIt(getIt);

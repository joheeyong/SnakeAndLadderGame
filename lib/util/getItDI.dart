import 'package:get_it/get_it.dart';
import 'package:snakeandladder/features/game/bloc/game_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => GameBloc());
}

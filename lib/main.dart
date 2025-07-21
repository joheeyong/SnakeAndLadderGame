import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snakeandladder/features/game/widgets/GamePage.dart';
import 'package:snakeandladder/util/getItDI.dart';
import 'features/game/bloc/game_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const SnakeLadderApp());
}

class SnakeLadderApp extends StatelessWidget {
  const SnakeLadderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<GameBloc>(create: (_) => sl<GameBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Snake & Ladder',
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        home: const GamePage(),
      ),
    );
  }
}

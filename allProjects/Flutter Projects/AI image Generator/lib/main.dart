import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:untitled/features/prompt/bloc/prompt_bloc.dart";
import "package:untitled/features/prompt/ui/create_prompt_screen.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PromptBloc(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade900,
              elevation: 0
          ),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: createPromptScreen(),
      ),
    );
  }
}

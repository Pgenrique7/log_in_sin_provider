import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:log_aplication/config/router/app_router.dart';
import 'package:log_aplication/config/theme/app_theme.dart';
import 'package:log_aplication/presentation/provider/LogIn_provider.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuarioProvider()..cargarUsuarios(),
          lazy: false, 
        ),
      ],
      child: MaterialApp.router(
        title: 'Log Application',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 2).getTheme(),
      ),
    );
  }
}

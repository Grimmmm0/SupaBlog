import 'package:blogz/core/router.dart';
import 'package:blogz/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    publishableKey: 'sb_publishable_cfeWgLxQiBkG0YoY4D3zkQ_VxVIAAdd',
    url: 'https://gxpvcrghbxxneqtplhrb.supabase.co',
  );

  final authProvider = AuthProvider();
  final router = buildRouter(authProvider);

  runApp(
    ChangeNotifierProvider.value(
      value: authProvider,
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'blogz',
    );
  }
}

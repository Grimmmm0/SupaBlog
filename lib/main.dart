import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Supabase setup
  await Supabase.initialize(
    publishableKey: "sb_publishable_cfeWgLxQiBkG0YoY4D3zkQ_VxVIAAdd",
    url: "https://gxpvcrghbxxneqtplhrb.supabase.co",
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold());
  }
}

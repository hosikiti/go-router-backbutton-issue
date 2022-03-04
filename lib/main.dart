import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
    ],
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build homepage");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Modal 1"),
          onPressed: () async {
            await showModalFirst(context);
          },
        ),
      ),
    );
  }
}

showModalFirst(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Modal 1"),
      ),
      body: Builder(
        builder: (context) {
          print("build modal 1");
          return Center(
            child: ElevatedButton(
              child: const Text("Open Modal 2"),
              onPressed: () async {
                await showModalSecond(context);
              },
            ),
          );
        },
      ),
    ),
    fullscreenDialog: true,
  ));
}

showModalSecond(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text("Modal 2"),
      ),
      body: Builder(
        builder: (context) {
          print("build modal 2");
          return const Center(
              child: Text(
                  "Please go back with Android's back button and see the logs."));
        },
      ),
    ),
    fullscreenDialog: true,
  ));
}

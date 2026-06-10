import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_learning/provider/age_provider.dart';
import 'package:riverpod_learning/provider/name_provider.dart';
import 'package:riverpod_learning/provider/users_proivder.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final age = ref.watch(ageProvider);
    final users = ref.watch(usersProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$name"),
            Text("Age is $age"),
            Expanded(
              child: SizedBox(
                height: 300,
                width: 250,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Container(
                      height: 40,
                      width: 200,
                      color: Colors.green,
                      child: Text(user),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

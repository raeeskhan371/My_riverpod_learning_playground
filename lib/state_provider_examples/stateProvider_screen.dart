import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_learning/state_provider_examples/counter_provider.dart';
import 'package:riverpod_learning/simple_provider_examples/providers/name_provider.dart';

// this is example of stateProvider for int
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("1st Time Complete UI Rebuild");

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              // this example for int stateProvider
              Container(
                height: 120,
                width: 250,
                color: Colors.orange,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("int StateProvider Example"),
                    Consumer(
                      builder: (context, ref, child) {
                        print("Int (Counter UI) Rebuild StateProvider ");
                        final counter = ref.watch(counterProvider);
                        return Center(
                          child: Text(
                            "Counter: $counter",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                    // this example for int stateProvider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            ref.read(counterProvider.notifier).state++;
                          },
                          child: Text("Increment +"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            ref.read(counterProvider.notifier).state--;
                          },
                          child: Text("decrement -"),
                        ),

                        // this example for string StateProvider
                      ],
                    ),
                  ],
                ),
              ),
              // this is example for String stateProvier
              Container(
                width: 250,
                height: 120,
                color: Colors.green,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("String StateProvider Example"),
                    Consumer(
                      builder: (context, ref, child) {
                        print("String (Hamad UI) Rebuild StateProvider ");
                        final name = ref.watch(nameStateProvider);
                        return Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(nameStateProvider.notifier).state = "Hammad";
                      },
                      child: Text("Update Name"),
                    ),
                  ],
                ),
              ),
              // this is example of List StateProvider with add items
              Container(
                width: 250,
                height: 150,
                color: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("List StateProvider Example"),
                    Consumer(
                      builder: (context, ref, child) {
                        print("List (UserList UI) Rebuild StateProvider ");
                        final userWatch = ref.watch(userListProvider);

                        return Expanded(
                          child: ListView.builder(
                            itemCount: userWatch.length,
                            itemBuilder: (context, index) {
                              final user = userWatch[index];

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final newUser = ref.read(userListProvider);

                            ref.read(userListProvider.notifier).state = [
                              ...newUser,
                              "Hamza",
                              "Saad",
                            ];
                          },
                          child: Text("Update name"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref.read(userListProvider.notifier).state = ref
                                .read(userListProvider)
                                .where((name) => name != "Hamza")
                                .toList();
                          },
                          child: Text("Delete name"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

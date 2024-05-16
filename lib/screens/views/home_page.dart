import 'package:flutter/material.dart';
import 'package:test_rxdart/view_models/home_viewmodel.dart';

import '../../core/app_injections.dart';
import '../../view_models/test_home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final HomeViewModel homeViewModel;
  // late final TestHomeViewModel homeViewModel;

  @override
  void initState() {
    // homeViewModel = TestHomeViewModel();
    homeViewModel = AppInjections.internal.getItInstance<HomeViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    // homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("5666"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: homeViewModel.countBehavior,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  int getState = snapshot.data!;
                  return Text(
                    "$getState",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return const CircularProgressIndicator();
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              // homeViewModel.countDecrease();
            },
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: (){
              homeViewModel.countIncrement();
              // homeViewModel.updateValue();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

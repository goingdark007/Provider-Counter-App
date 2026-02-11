import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class CounterScreen extends StatelessWidget {

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final counter = context.watch<CounterProvider>();

    // Rebuilds selectively shorter version
    final count = context.select<CounterProvider, int>((counter) => counter.count);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Counter App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [

          // Using watch
          Text(counter.count.toString(), style: Theme.of(context).textTheme.displayLarge),

          const SizedBox(height: 15,),

          Row(
            mainAxisAlignment: .center,
            children: [
              FilledButton(onPressed: counter.increment, child: Icon(Icons.add)),
              const SizedBox(width: 5),
              FilledButton(
                  onPressed: counter.decrement,
                style: Theme.of(context).filledButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.red)
                ),
                  child: Icon(Icons.remove),
              ),

              const SizedBox(height: 10,),

              // Rebuilds selectively
              Selector<CounterProvider, int> (
                selector: (context, counter) => counter.count,
                builder: (context, count, child) {
                  return Text(count.toString(), style: Theme.of(context).textTheme.displayLarge);
                }
              ),
              // Shorter version
              Text('$count')

            ]
          )
        ],
      ),
    );

  }
}
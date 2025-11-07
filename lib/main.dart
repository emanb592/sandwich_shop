import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
          child: OrderItemDisplay(5, 'Footlong'),
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    /*return Container(
      alignment: Alignment.center,
      color: Colors.blue[600],
      width: 300.0,
      height: 200.0,
      child: Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
    );
  }
}*/

      return Container(
        color: Colors.amber,
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
                Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
                Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
              ]
            ),
      );
        }
      }
      





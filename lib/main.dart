import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Sandwich Shop App', home: OrderScreen());
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  String _note = '';
  String _selectedSize = 'Six-Inch';
  final TextEditingController _noteController = TextEditingController();

  static const List<String> _sizes = <String>['Six-Inch', 'Footlong'];

  void _increasequantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreasequantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sandwich Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Extra Notes',
                  hintText: 'e.g., no onions, extra pickles',
                ),
                onChanged: (value) => setState(() => _note = value),
              ),
            ),

            // size selector
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DropdownButton<String>(
                value: _selectedSize,
                items: _sizes
                    .map((s) => DropdownMenuItem<String>(value: s, child: Text(s)))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _selectedSize = value);
                },
              ),
            ),

            OrderItemDisplay(_quantity, _selectedSize, _note),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _quantity < widget.maxQuantity ? _increasequantity : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.blueGrey[200],
                    disabledForegroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Add'),
                ),
                const SizedBox(width: 12),
                
                ElevatedButton(
                  onPressed: _quantity > 0 ? _decreasequantity : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.blueGrey[200],
                    disabledForegroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;
  final String note;

  const OrderItemDisplay(this.quantity, this.itemType, this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
          if (note.isNotEmpty)
            Text('Note: $note', style: const TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}

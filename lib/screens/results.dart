import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results(
      {super.key, required this.calculatedTip, required this.totalAmount});

  final double calculatedTip;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text("Resulted Tip"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Calculated Tip:  ₹$calculatedTip",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Amount:  ₹$totalAmount",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

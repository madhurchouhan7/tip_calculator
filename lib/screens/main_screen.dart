import 'package:flutter/material.dart';
import 'package:tip_calculator/screens/results.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //? creating textFields Controller
  TextEditingController amountController = TextEditingController();
  TextEditingController tipController = TextEditingController();

  void calculateTip() {
    double amount = double.parse(amountController.text);
    double tip = double.parse(tipController.text);

    double calculatedTip = (amount / 100) * tip;
    double totalAmount = amount + calculatedTip;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Results(calculatedTip: calculatedTip, totalAmount: totalAmount),
      ),
    );
  }

  //build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text("Tip Calculator"),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        //main column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Amount in ₹',
                          label: Text("Amount"),
                          border: OutlineInputBorder(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: tipController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Tip %',
                          label: Text("Tip %"),
                          border: OutlineInputBorder(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Calculate Button
                          ElevatedButton(
                            onPressed: () {
                              if (amountController.text.isNotEmpty &&
                                  tipController.text.isNotEmpty) {
                                //calculate Tip Function

                                calculateTip();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Please Fill all the Details"),
                                  ),
                                );
                              }
                            },
                            child: const Text("Calculate"),
                          ),

                          // Reset button
                          ElevatedButton(
                            onPressed: () {
                              amountController.clear();
                              tipController.clear();
                            },
                            child: const Text("Reset"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Made with ♥ by Madhur",
                style: TextStyle(color: Colors.blueGrey[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

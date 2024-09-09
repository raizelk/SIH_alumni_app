import 'package:flutter/material.dart';

class Donation3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonationScreen(),
    );
  }
}

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int _selectedAmount = 50;
  TextEditingController _customAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Now'),
        backgroundColor: Color(0xFF297768), // Green color from the image
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAmountOption(10),
            _buildAmountOption(50),
            _buildAmountOption(100),
            _buildAmountOption(200),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _customAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Tap your amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onTap: () {
                setState(() {
                  _selectedAmount = 0;
                });
              },
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String amountToDonate = _customAmountController.text.isEmpty
                      ? _selectedAmount.toString()
                      : _customAmountController.text;
                  print('Amount to donate: $amountToDonate');
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF297768), // Green button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountOption(int amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedAmount = amount;
            _customAmountController.clear(); // Clear custom amount on tap
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: _selectedAmount == amount ? Colors.teal : Colors.grey,
              width: 2,
            ),
            color: _selectedAmount == amount ? Color(0xFFDBF3F0) : null,
          ),
          child: Center(
            child: Text(
              '\$$amount',
              style: TextStyle(
                fontSize: 18,
                color: _selectedAmount == amount ? Colors.teal : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png',
                height: 50, fit: BoxFit.contain),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 4, 0, 255),
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Current Balance",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Nu. 34,000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Targeted Budget",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Nu. 33,000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Income",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Nu. 34,000",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Total Expenses",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Nu. 17,000",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Current Balances",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBalanceCard("NIBL", "Nu. 43,000", "Nu. 2,000 this month"),
                buildBalanceCard("eSewa", "Nu. 8,000", "Nu. 3,200 this month"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // buildTransactionTile(
            //     "Family dinner", "17th Jan, 2024", "Rs. 7,000"),
            // buildTransactionTile("Insurance", "14th Jan, 2024", "Rs. 17,000"),
            // buildTransactionTile("Bike Repair", "12th Jan, 2024", "Rs. 3,000"),
            // buildTransactionTile("Rent", "9th Jan, 2024", "Rs. 500"),
            // buildTransactionTile("Lunch", "9th Jan, 2024", "Rs. 500"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Card buildBalanceCard(String title, String amount, String subtitle) {
    return Card(
      elevation: 2,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
      ),
    );
  }

  ListTile buildTransactionTile(String title, String date, String amount) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/logo.png'),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(amount),
    );
  }
}

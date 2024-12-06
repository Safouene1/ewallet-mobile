import 'package:flutter/material.dart';

import '../widgets/buttonAction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
final List<Map<String, dynamic>> transactions = [
  {
    'type': 'IN',
    'amount': 880.00,
    'description': 'Salaire',
    'time': '10:00',
  },
  {
    'type': 'OUT',
    'amount': 50.00,
    'description': 'Achat de nourriture',
    'time': '14:30',
  },
  {
    'type': 'IN',
    'amount': 150.00,
    'description': 'Vente de produit',
    'time': '16:00',
  },
  {
    'type': 'OUT',
    'amount': 320.00,
    'description': 'Abonnement mensuel',
    'time': '18:00',
  },
  {
    'type': 'IN',
    'amount': 20210.00,
    'description': 'Investissement',
    'time': '11:45',
  },
];

void _showOperationDrawer(BuildContext context, String operation) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)), // Custom border radius
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)), // Same border radius
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              operation,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,

              ),
            ),
            SizedBox(height: 10),

            // Amount display
            Text(
             "Solde : 41,379.00 TND",
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 20),

            // Input fields
            TextField(
              decoration: InputDecoration(
                labelText: 'Montant',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.money),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                labelText: 'Entrez votre description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.description),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Handle saving logic here
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text(operation, style: TextStyle(fontSize: 18,color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor, // Use the primary color from the theme
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(fontSize: 18),
                minimumSize: Size(double.infinity, 50), // Make the button take the full width
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(


      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(

                gradient: const LinearGradient(
                  colors: [Color(0xFF100C30), Color(0xFF1B1662)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "VOTRE SOLDE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isVisible
                          ? const Text(
                        "\ TND 41,379.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          : const Text(
                        "\ TND ** *** ***",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildActionButton(
                        icon: Icons.upload_rounded,
                        label: "Transférez",
                        onTap: () {
                          _showOperationDrawer(
                              context, "Transférez");
                        },
                      ),
                      buildActionButton(
                        icon: Icons.download_rounded,
                        label: "Retirez",
                        onTap: () {
                          _showOperationDrawer(
                              context, "Retirez");
                        },
                      ),

                      buildActionButton(
                        icon: Icons.add_circle_rounded,
                        label: "Rechargez",
                        onTap: () {
                          _showOperationDrawer(
                              context, "Rechargez");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEE5FF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.wallet_rounded,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      "Vérifiez vos dépenses mensuelles",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Transactions récentes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  var transaction = transactions[index];
                  bool isIncome = transaction['type'] == 'IN';

                  String formattedTime = transaction['time'];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    elevation: 0, // Adds shadow for a lifted effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners for the card
                    ),
                    color: Colors.white, // Set background to white
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      leading: CircleAvatar(
                        backgroundColor: isIncome ? Colors.green.shade100 : Colors.red.shade100, // Green for IN, Red for OUT
                        child: Icon(
                          isIncome ? Icons.arrow_upward : Icons.arrow_downward, // Arrow up for IN, arrow down for OUT
                          color: isIncome ? Colors.green.shade700 : Colors.red.shade700, // Green or red icon color
                        ),
                      ),
                      title: Text(
                        '${transaction['description']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:  Theme.of(context).primaryColor // Title in blue
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '${transaction['amount']} TND', // Display amount with Euro symbol
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700, // Subtitle in grey
                            ),
                          ),
                          SizedBox(width: 10), // Add space between amount and time
                          Text(
                            formattedTime, // Display formatted time
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500, // Softer color for time
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:  Theme.of(context).primaryColor, // Trailing icon in a contrasting color
                      ),
                      onTap: () {
                        // Handle tap event here
                      },
                    ),
                  );
                },
              ),
              ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}
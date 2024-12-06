import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../widgets/OverviewCardGradient.dart';
import '../widgets/transactionTile.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Aperçu général de ce mois-ci',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                GradientCard(
                title: 'Solde',
                amount: '12,345',
                gradientColors: [Color(0xFF100C30), Color(0xFF1B1662)],

                ),

                  GradientCard(
                    title: 'Crédit restant',
                    amount: '1,223',
                    gradientColors: [Color(0xFF100C30), Color(0xFF7670BB)],
                  ),

                  GradientCard(
                    title: 'Dépenses',
                    amount: '10,223',
                    gradientColors: [Colors.red, Colors.red.shade900],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Spending Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Catégories de dépenses',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                      Expanded(
                        child:
                         PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                value: 40,
                                color:Theme.of(context).primaryColor,
                                title: '40%',
                                titleStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              PieChartSectionData(
                                value: 30,
                                color: Colors.green,
                                title: '30%',
                                titleStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              PieChartSectionData(
                                value: 20,
                                color: Colors.orange,
                                title: '20%',
                                titleStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              PieChartSectionData(
                                value: 10,
                                color: Colors.red,
                                title: '10%',
                                titleStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            sectionsSpace: 4,
                            centerSpaceRadius: 40,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildLabel(Theme.of(context).primaryColor, "Logement"),
                            _buildLabel(Colors.green, "Transport"),
                            _buildLabel(Colors.orange, "Aliemntation"),
                            _buildLabel(Colors.red, "Shopping"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions récentes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Voir tout'),
            ),
          ],


            ),
            SizedBox(height: 20),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryTile(icon: Icons.shopping_cart, label: 'Shopping'),
                CategoryTile(icon: Icons.fastfood, label: 'Nourriture'),
                CategoryTile(icon: Icons.home, label: 'Factures'),
              ],
            ),
            SizedBox(height: 40),

            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                TransactionTile(
                  title: 'Achat de nourriture',
                  date: 'Dec 4, 2024',
                  amount: '-\ TND 45.20',
                ),
                TransactionTile(
                  title: 'Salaire',
                  date: 'Dec 1, 2024',
                  amount: '+\ TND 1,000.00',
                ),
                TransactionTile(
                  title: 'Electricien',
                  date: 'Nov 29, 2024',
                  amount: '-\ TND 120.75',
                ),
              ],
            ),
            // Spending Categories Section

          ],
        ),
      ),
    );
  }

  Widget _buildLabel(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}



class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryTile({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
            backgroundColor: Theme.of(context).colorScheme.secondary
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final String amount;
  final List<Color> gradientColors;


  const GradientCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.gradientColors,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Optional: Set the elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10), // Matches the card's shape
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white, // Default for contrast
                    ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                 Text('TND', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Text(
                    amount,
                    style:
                        TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Default for visibility
                        ),
                  ),
                ],

              ),

            ],
          ),
        ),
      ),
    );
  }
}
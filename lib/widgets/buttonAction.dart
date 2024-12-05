import 'package:flutter/material.dart';


Widget buildActionButton({required IconData icon, required String label,required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
     ),
    );

}
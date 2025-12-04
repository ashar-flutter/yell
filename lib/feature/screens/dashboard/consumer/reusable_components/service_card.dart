import 'package:flutter/material.dart';
import 'package:yell/core/barrel/barrel.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: isDark ? Colors.grey[800] : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(12), // ✅ Reduced padding
          constraints: BoxConstraints(
            minHeight: 100, // ✅ Minimum height
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // ✅ Changed to min
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48, // ✅ Reduced size
                height: 48,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    icon,
                    style: TextStyle(fontSize: 20), // ✅ Reduced font size
                  ),
                ),
              ),
              SizedBox(height: 8), // ✅ Reduced spacing
              Flexible( // ✅ Added Flexible widget
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black,
                    fontFamily: 'bold',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:jobapp/core/app_colors.dart';
// Import your AppColors file

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 8), // Add margin around AppBar
      decoration: BoxDecoration(
        color: AppColors.primaryBlue, // Background color
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      child: AppBar(
        automaticallyImplyLeading: false, // Prevents the default back button
        backgroundColor:
            Colors.transparent, // Use transparent to keep container styling
        elevation: 0, // Remove AppBar shadow
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Leslie Alexander',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Set height of AppBar
}

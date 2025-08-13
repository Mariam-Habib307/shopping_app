import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in_screen.dart';
import 'package:shopping_app/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isLargeScreen = screenWidth > 650;

    const double imageHeight = 200;
    const double imageWidth = 300;
    const double buttonHeight = 50;
    const double buttonWidth = 170;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667de9), Color(0xFF6969cc), Color(0xFF764da5)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.001),
                  Text(
                    'ShopCraft',
                    style: TextStyle(
                      fontFamily: 'Suwannaphum-Regular',
                      fontSize: isLargeScreen ? 85 : 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),

                  Text(
                    'Your Premium Shopping\nExperience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Suwannaphum-Regular',
                      fontSize: isLargeScreen ? 25 : 18,
                      fontWeight: FontWeight.w100,
                      color: const Color.fromARGB(199, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Images section - changes orientation based on screen size
                  isLargeScreen
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildImageContainer(
                            width: imageWidth,
                            height: imageHeight,
                            child: Image.asset(
                              'assets/images/robot-handshake-human-background-futuristic-digital-age.jpg',
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      _buildImageErrorIcon(Icons.shopping_bag),
                            ),
                          ),
                          _buildImageContainer(
                            width: imageWidth,
                            height: imageHeight,
                            child: Image.network(
                              'data:image/jpeg;base64,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',
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.purple,
                                  ),
                                );
                              },
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      _buildImageErrorIcon(Icons.code),
                            ),
                          ),
                        ],
                      )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildImageContainer(
                            width: imageWidth,
                            height: imageHeight,
                            child: Image.asset(
                              'assets/images/robot-handshake-human-background-futuristic-digital-age.jpg',
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      _buildImageErrorIcon(Icons.shopping_bag),
                            ),
                          ),
                          _buildImageContainer(
                            width: imageWidth,
                            height: imageHeight,
                            child: Image.network(
                              'data:image/jpeg;base64,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',
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.purple,
                                  ),
                                );
                              },
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      _buildImageErrorIcon(Icons.code),
                            ),
                          ),
                        ],
                      ),

                  const SizedBox(height: 30),

                  // Buttons section - orientation changes with screen size
                  isLargeScreen
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                            label: 'Sign Up',
                            width: buttonWidth,
                            height: buttonHeight,
                            backgroundColor: Colors.white,
                            textColor: const Color(0xFF9333EA),
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpScreen(),
                                  ),
                                ),
                          ),
                          const SizedBox(width: 20),
                          _buildOutlinedButton(
                            label: 'Sign In',
                            width: buttonWidth,
                            height: buttonHeight,
                            borderColor: Colors.white,
                            textColor: Colors.white,
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignInScreen(),
                                  ),
                                ),
                          ),
                        ],
                      )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                            label: 'Sign Up',
                            width: buttonWidth,
                            height: buttonHeight,
                            backgroundColor: Colors.white,
                            textColor: const Color(0xFF9333EA),
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpScreen(),
                                  ),
                                ),
                          ),
                          const SizedBox(height: 15),
                          _buildOutlinedButton(
                            label: 'Sign In',
                            width: buttonWidth,
                            height: buttonHeight,
                            borderColor: Colors.white,
                            textColor: Colors.white,
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignInScreen(),
                                  ),
                                ),
                          ),
                        ],
                      ),

                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildImageContainer({
    required double width,
    required double height,
    required Widget child,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(15), child: child),
      ),
    );
  }

  static Widget _buildImageErrorIcon(IconData icon) {
    return Container(
      color: Colors.grey[300],
      child: Icon(icon, size: 80, color: Colors.purple),
    );
  }

  static Widget _buildButton({
    required String label,
    required double width,
    required double height,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Suwannaphum-Regular',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget _buildOutlinedButton({
    required String label,
    required double width,
    required double height,
    required Color borderColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor,
          side: BorderSide(color: borderColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Suwannaphum-Regular',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/components/build_button.dart';
import 'package:shopping_app/components/build_image_container.dart';
import 'package:shopping_app/components/build_image_error_icon.dart';
import 'package:shopping_app/components/build_outlined_button.dart';
import 'package:shopping_app/screens/sign_in_screen.dart';
import 'package:shopping_app/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isLargeScreen = screenWidth > 650;
    final isTablet = screenWidth > 450 && screenWidth <= 650;

    // Fully responsive sizing
    double getImageWidth() {
      if (isLargeScreen) return screenWidth * 0.25;
      if (isTablet) return screenWidth * 0.35;
      return screenWidth * 0.7;
    }

    double getImageHeight() {
      if (isLargeScreen) return screenHeight * 0.2;
      if (isTablet) return screenHeight * 0.15;
      return screenHeight * 0.12;
    }

    double getButtonWidth() {
      if (isLargeScreen) return screenWidth * 0.15;
      if (isTablet) return screenWidth * 0.25;
      return screenWidth * 0.7;
    }

    double getButtonHeight() {
      if (isLargeScreen) return 55.0;
      if (isTablet) return 50.0;
      return 45.0;
    }

    double getTitleFontSize() {
      if (isLargeScreen) return screenWidth * 0.06;
      if (isTablet) return screenWidth * 0.08;
      return screenWidth * 0.12;
    }

    double getSubtitleFontSize() {
      if (isLargeScreen) return screenWidth * 0.018;
      if (isTablet) return screenWidth * 0.025;
      return screenWidth * 0.04;
    }

    final imageWidth = getImageWidth();
    final imageHeight = getImageHeight();
    final buttonWidth = getButtonWidth();
    final buttonHeight = getButtonHeight();

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667de9), Color(0xFF6969cc), Color(0xFF764da5)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.05,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(height: screenHeight * 0.01),
                          ),

                          Text(
                            'ShopCraft',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Suwannaphum-Regular',
                              fontSize: getTitleFontSize(),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.01),

                          Text(
                            'Your Premium Shopping\nExperience',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Suwannaphum-Regular',
                              fontSize: getSubtitleFontSize(),
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(199, 255, 255, 255),
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.04),

                          // Images section - fully responsive layout
                          SizedBox(
                            width: double.infinity,
                            child:
                                isLargeScreen
                                    ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: BuildImageContainer(width: imageWidth, height: imageHeight, child: Image.asset(
                                              'assets/images/robot-handshake-human-background-futuristic-digital-age.jpg',
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => BuildImageErrorIcon(icon: Icons.shopping_bag),
                                            )),
                                        ),
                                        SizedBox(width: screenWidth * 0.03),
                                        Flexible(
                                          child: BuildImageContainer(width: imageWidth, height: imageHeight, child: Image.network(
                                              'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                                              fit: BoxFit.cover,
                                              loadingBuilder: (
                                                context,
                                                child,
                                                loadingProgress,
                                              ) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    color:
                                                        Colors.purple.shade300,
                                                    value:
                                                        loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                  ),
                                                );
                                              },
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => BuildImageErrorIcon(icon: Icons.code),
                                            )),
                                        ),
                                      ],
                                    )
                                    : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BuildImageContainer(width: imageWidth, height: imageHeight, child: Image.asset(
                                            'assets/images/robot-handshake-human-background-futuristic-digital-age.jpg',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    BuildImageErrorIcon(icon: Icons.shopping_bag),
                                          )),
                                        SizedBox(height: screenHeight * 0.02),
                                        BuildImageContainer(width: imageWidth, height: imageHeight, child: Image.network(
                                            'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                                            fit: BoxFit.cover,
                                            loadingBuilder: (
                                              context,
                                              child,
                                              loadingProgress,
                                            ) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  color: Colors.purple.shade300,
                                                  value:
                                                      loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    BuildImageErrorIcon(icon: Icons.code),
                                          )),
                                      ],
                                    ),
                          ),

                          SizedBox(height: screenHeight * 0.04),

                          // Buttons section - fully responsive layout
                          SizedBox(
                            width: double.infinity,
                            child:
                                isLargeScreen
                                    ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: BuidButton(label: 'Sign Up', width: buttonWidth, height: buttonHeight, backgroundColor: Colors.white, textColor: Color(0xFF9333EA), onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (_) => SignUpScreen(),
                                                  ),
                                                )),
                                        ),
                                        SizedBox(width: screenWidth * 0.03),
                                        Flexible(
                                          child: BuildOutlinedButton(label: 'Sign In', width: buttonWidth, height: buttonHeight, borderColor: Colors.white, textColor: Colors.white, onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (_) => SignInScreen(),
                                                  ),
                                                )),
                                        ),
                                      ],
                                    )
                                    : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BuidButton(label: 'Sign Up', width: buttonWidth, height: buttonHeight, backgroundColor: Colors.white, textColor: Color(0xFF9333EA), onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (_) => SignUpScreen(),
                                                ),
                                              )),
                                        SizedBox(height: screenHeight * 0.02),
                                        BuildOutlinedButton(label: 'Sign In', width: buttonWidth, height: buttonHeight, borderColor: Colors.white, textColor: Colors.white, onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (_) => SignInScreen(),
                                                ),
                                              )),
                                      ],
                                    ),
                          ),

                          Flexible(
                            flex: 1,
                            child: SizedBox(height: screenHeight * 0.02),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


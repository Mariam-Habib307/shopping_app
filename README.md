# ShopCraft - Premium Shopping Experience 🛍️

A comprehensive Flutter mobile application that provides a premium shopping experience with smooth animations, user authentication, and interactive product browsing.

## 📱 Project Overview

ShopCraft is a fully functional shopping application built with Flutter that simulates a real-world e-commerce interface. The app guides users through a complete shopping journey from authentication to product exploration, featuring modern UI design, smooth transitions, and responsive layouts.

This project serves as a comprehensive Flutter development guide, covering core Dart programming principles and advancing to professional mobile app development techniques.

## ✨ Features

### 🎨 **1. Aesthetic Welcome Screen**
- **Custom AppBar**: ShopCraft branding with Suwannaphum-Regular font
- **Dual Image Display**: Row layout featuring local and online images
- **Professional Typography**: Custom fonts with bold, colored styling
- **Centered Layout**: Adequate spacing with modern button design
- **Navigation Buttons**: Sign-up and Sign-in options

### 🔐 **2. User Authentication System**

#### **Sign-Up Form**
- **Smart Validation**: 
  - Full Name (automatic first letter capitalization)
  - Email (must include @ symbol)
  - Password (minimum 6 characters)
  - Confirm Password (must match)
- **Success Dialog**: "Account created successfully" message
- **Smooth Navigation**: Direct transition to main shopping screen

#### **Sign-In Form**
- **Streamlined Login**:
  - Email validation (@ required)
  - Password validation (6+ characters)
- **Welcome Message**: "Account sign-in successfully"
- **Seamless Transition**: Fade navigation to shopping area

### 🎬 **3. Smooth Animated Transitions**
- **Fade Animations**: 800ms smooth fade-in/fade-out transitions
- **Professional Navigation**: PageRouteBuilder with custom transitions
- **Visual Continuity**: Seamless user experience between screens

### 🏪 **4. Interactive Shopping Home Screen**

#### **Featured Products Showcase**
- **Auto-Scrolling PageView**: Horizontal product carousel
- **Visual Indicators**: Page dots showing current position
- **Timer-Based Navigation**: 4-second auto-scroll intervals
- **Gradient Overlays**: Professional image presentation
- **High-Quality Images**: Network-loaded product photography

#### **Product Collection Grid**
- **Responsive Layout**: 2-column grid design
- **Interactive Cards**: Each product card includes:
  - High-resolution product images
  - Product titles and pricing
  - Add to Cart functionality
  - Instant feedback via SnackBars
- **Professional Styling**: Elevated shadows and rounded corners
- **Error Handling**: Graceful fallbacks for image loading

#### **Hot Offers Section**
- **Vertical ListView**: 5 scrollable promotional offers
- **Discount Badges**: Visual percentage-off indicators
- **Detailed Descriptions**: Using Expanded widget for proper layout
- **Premium Images**: Professional product photography
- **Special Pricing**: Highlighted discount information

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- Android Studio or VS Code with Flutter extensions
- Android device or emulator / iOS Simulator

### Installation Steps

1. **Clone or Download the Project**
   ```bash
   # If using Git
   git clone [your-repository-url]
   cd shopcraft
   
   # Or download and extract the ZIP file
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Add Custom Font (Suwannaphum-Regular)**
   
   Create the following folder structure:
   ```
   your_project/
   ├── fonts/
   │   └── Suwannaphum-Regular.ttf
   ```
   
   Update your `pubspec.yaml` file:
   ```yaml
   flutter:
     fonts:
       - family: Suwannaphum-Regular
         fonts:
           - asset: fonts/Suwannaphum-Regular.ttf
   ```

4. **Add Local Assets (Optional)**
   
   Create assets folder structure:
   ```
   your_project/
   ├── assets/
   │   └── images/
   │       └── shopping_local.jpg
   ```
   
   Update your `pubspec.yaml` file:
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

5. **Download Font File**
   
   Download Suwannaphum-Regular.ttf from:
   - [Google Fonts](https://fonts.google.com/specimen/Suwannaphum)
   - Or use any similar font and update the font family name in the code

### Running the Application

1. **Connect Device or Start Emulator**
   ```bash
   # Check connected devices
   flutter devices
   ```

2. **Run the Application**
   ```bash
   # Debug mode
   flutter run
   
   # Release mode
   flutter run --release
   ```

3. **Hot Reload During Development**
   - Press `r` in the terminal for hot reload
   - Press `R` for hot restart
   - Press `q` to quit

### Project Structure

```
lib/
├── main.dart                 # Main application entry point
├── models/
│   ├── Product              # Product data model
│   └── HotOffer             # Hot offer data model
├── screens/
│   ├── WelcomeScreen        # Landing page with branding
│   ├── SignUpScreen         # User registration
│   ├── SignInScreen         # User authentication
│   └── ShoppingScreen       # Main shopping interface

```

## 🔧 Configuration Options

### Customizing Colors
Update the primary color scheme in `main.dart`:
```dart
theme: ThemeData(
  primarySwatch: Colors.purple,  
  fontFamily: 'Suwannaphum-Regular',
),
```

### Modifying Auto-Scroll Timing
Adjust the featured products auto-scroll interval:
```dart
Timer.periodic(const Duration(seconds: 4), (timer) {
  
});
```

### Adding More Products
Extend the product lists in `ShoppingScreen`:
```dart
final List<Product> _products = [
  // Add your products here
];

final List<HotOffer> _hotOffers = [
  // Add your offers here
];
```

## 📚 Learning Outcomes

This project covers:
- **Flutter Widgets**: AppBar, PageView, GridView, ListView
- **State Management**: StatefulWidget and setState
- **Animations**: FadeTransition and AnimationController
- **Navigation**: Named routes and custom transitions
- **Form Validation**: TextFormField with validators
- **UI Design**: Material Design principles
- **Image Handling**: Network and asset images
- **Error Handling**: Graceful fallbacks
- **Responsive Design**: Adaptive layouts

## 🎯 Future Enhancements

Potential features to add:
- Shopping cart functionality
- Product detail pages
- User profile management
- Search and filtering
- Payment integration
- Order history
- Push notifications
- Dark mode support

## 📱 Screenshots

The app includes:
- Modern welcome screen with dual images
- Professional authentication forms
- Smooth animated transitions
- Interactive product browsing
- Responsive grid layouts
- Auto-scrolling featured products
- Promotional offers section

## 🤝 Contributing

1. Fork the project
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is created for educational purposes. Feel free to use and modify for learning Flutter development.

## 🆘 Troubleshooting

### Common Issues:

1. **Font not loading**: Ensure the font file is in the correct path and `pubspec.yaml` is properly configured
2. **Images not loading**: Check internet connection for network images and file paths for local assets
3. **Build errors**: Run `flutter clean` and `flutter pub get`
4. **Hot reload not working**: Try hot restart or full restart

### Support

For issues or questions:
- Check Flutter documentation
- Review the code comments
- Test on different devices/emulators

---

**Built with ❤️ using Flutter**

*Transform your mobile development skills with this comprehensive shopping app project!*
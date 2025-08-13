import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/hot_offers_moel.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:intl/intl.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Sample featured products
  final List<Product> _featuredProducts = [
    Product(
      id: '1',
      title: 'Premium Laptop Collection',
      image:
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 1299.99,
      description: 'High-performance laptops for professionals',
    ),
    Product(
      id: '2',
      title: 'Gaming Setup Pro',
      image:
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 899.99,
      description: 'Ultimate gaming experience',
    ),
    Product(
      id: '3',
      title: 'Smart Tech Bundle',
      image:
          'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 599.99,
      description: 'Smart devices for modern living',
    ),
  ];

  // Sample products for grid
  final List<Product> _products = [
    Product(
      id: '4',
      title: 'Wireless Headphones',
      image:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 149.99,
      description: 'Premium sound quality',
    ),
    Product(
      id: '5',
      title: 'Smart Watch',
      image:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 299.99,
      description: 'Track your fitness goals',
    ),
    Product(
      id: '6',
      title: 'Tablet Pro',
      image:
          'https://images.unsplash.com/photo-1561154464-82e9adf32764?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 499.99,
      description: 'Perfect for creativity',
    ),
    Product(
      id: '7',
      title: 'Camera Kit',
      image:
          'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      price: 799.99,
      description: 'Capture every moment',
    ),
  ];

  // Sample hot offers
  final List<HotOffer> _hotOffers = [
    HotOffer(
      id: '1',
      title: 'MacBook Pro Deal',
      image:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description: 'Get 20% off on all MacBook Pro models. Limited time offer!',
      discount: '20% OFF',
    ),
    HotOffer(
      id: '2',
      title: 'Gaming Bundle',
      image:
          'https://images.unsplash.com/photo-1552820728-8b83bb6b773f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description: 'Complete gaming setup with keyboard, mouse, and headset',
      discount: '30% OFF',
    ),
    HotOffer(
      id: '3',
      title: 'Phone Accessories',
      image:
          'https://images.unsplash.com/photo-1512499617640-c74ae3a79d37?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description: 'Premium cases, chargers, and screen protectors',
      discount: '25% OFF',
    ),
    HotOffer(
      id: '4',
      title: 'Smart Home Kit',
      image:
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description: 'Transform your home with smart devices and automation',
      discount: '35% OFF',
    ),
    HotOffer(
      id: '5',
      title: 'Audio Equipment',
      image:
          'https://images.unsplash.com/photo-1487215078519-e21cc028cb29?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
      description: 'Professional microphones and studio equipment',
      discount: '40% OFF',
    ),
  ];

  @override
  void initState() {
    super.initState();

    // Initialize fade animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Start animation
    _fadeController.forward();

    // Auto-scroll featured products
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _featuredProducts.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _addToCart(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Item added to the cart',
          style: TextStyle(fontFamily: 'Suwannaphum-Regular', fontSize: 16),
        ),
        backgroundColor: const Color(0xFF9333EA),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Helper method to get responsive padding
  double _getHorizontalPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return 40;
    if (screenWidth > 800) return 30;
    return 20;
  }

  // Helper method to get responsive font size
  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 350) return baseSize * 0.85;
    if (screenWidth < 400) return baseSize * 0.9;
    if (screenWidth > 800) return baseSize * 1.1;
    return baseSize;
  }

  // Helper method to get grid cross axis count
  int _getGridCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return 4;
    if (screenWidth > 800) return 3;
    if (screenWidth < 350) return 1; // Single column for very small screens
    return 2;
  }

  // Helper method to get featured product height
  double _getFeaturedProductHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 800) return 250;
    return 200;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final horizontalPadding = _getHorizontalPadding(context);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text(
            'Our Products',
            style: TextStyle(
              fontFamily: 'Suwannaphum-Regular',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: _getResponsiveFontSize(context, 22),
            ),
          ),
          backgroundColor: const Color(0xFF9333EA),
          elevation: 0,
          centerTitle: true,
          leading: Container(),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cart feature coming soon!'),
                    backgroundColor: Color(0xFF9333EA),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Products Section
              Container(
                padding: EdgeInsets.all(horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Products',
                      style: TextStyle(
                        fontFamily: 'Suwannaphum-Regular',
                        fontSize: _getResponsiveFontSize(context, 22),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Horizontal PageView for featured products
                    SizedBox(
                      height: _getFeaturedProductHeight(context),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: _featuredProducts.length,
                        itemBuilder: (context, index) {
                          final product = _featuredProducts[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.network(
                                    product.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    right: 20,
                                    child: Text(
                                      product.title,
                                      style: TextStyle(
                                        fontFamily: 'Suwannaphum-Regular',
                                        fontSize: _getResponsiveFontSize(
                                          context,
                                          20,
                                        ),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Page indicator
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          _featuredProducts.asMap().entries.map((entry) {
                            return Container(
                              width: _currentPage == entry.key ? 12 : 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color:
                                    _currentPage == entry.key
                                        ? const Color(0xFF9333EA)
                                        : Colors.grey[300],
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),

              // Shop Our Collection Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop Our Collection',
                      style: TextStyle(
                        fontFamily: 'Suwannaphum-Regular',
                        fontSize: _getResponsiveFontSize(context, 22),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Products Grid (responsive columns)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = _getGridCrossAxisCount(context);
                        final spacing =
                            constraints.maxWidth > 600 ? 20.0 : 12.0;
                        final screenWidth = MediaQuery.of(context).size.width;

                        // Adjust aspect ratio based on screen size and columns
                        double aspectRatio;
                        if (crossAxisCount == 1) {
                          aspectRatio = 1.2; // Wider cards for single column
                        } else if (screenWidth < 350) {
                          aspectRatio =
                              0.75; // Taller cards for very small screens
                        } else if (screenWidth < 400) {
                          aspectRatio = 0.8; // Standard mobile
                        } else {
                          aspectRatio =
                              constraints.maxWidth > 600 ? 0.85 : 0.82;
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: spacing,
                                mainAxisSpacing: spacing,
                                childAspectRatio: aspectRatio,
                              ),
                          itemCount: _products.length,
                          itemBuilder: (context, index) {
                            final product = _products[index];
                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Image
                                  Expanded(
                                    flex: crossAxisCount == 1 ? 2 : 3,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              size: 40,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  // Product Info
                                  Expanded(
                                    flex: crossAxisCount == 1 ? 1 : 2,
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(
                                        screenWidth < 350
                                            ? 8
                                            : (isTablet ? 16 : 12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              product.title,
                                              style: TextStyle(
                                                fontFamily:
                                                    'Suwannaphum-Regular',
                                                fontSize:
                                                    _getResponsiveFontSize(
                                                      context,
                                                      crossAxisCount == 1
                                                          ? 16
                                                          : 13,
                                                    ),
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  product.description,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Suwannaphum-Regular',
                                                    fontSize:
                                                        _getResponsiveFontSize(
                                                          context,
                                                          crossAxisCount == 1
                                                              ? 15
                                                              : 13,
                                                        ),
                                                    color: Colors.grey[600],
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  NumberFormat.currency(
                                                    symbol: '\$',
                                                    decimalDigits: 2,
                                                  ).format(product.price),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Suwannaphum-Regular',
                                                    fontSize:
                                                        _getResponsiveFontSize(
                                                          context,
                                                          crossAxisCount == 1
                                                              ? 18
                                                              : 15,
                                                        ),
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(
                                                      0xFF9333EA,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap:
                                                    () => _addToCart(product),
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                    screenWidth < 350
                                                        ? 6
                                                        : (isTablet ? 10 : 8),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: const Color(
                                                      0xFF9333EA,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.white,
                                                    size:
                                                        screenWidth < 350
                                                            ? 16
                                                            : (isTablet
                                                                ? 22
                                                                : 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Hot Offers Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hot Offers',
                      style: TextStyle(
                        fontFamily: 'Suwannaphum-Regular',
                        fontSize: _getResponsiveFontSize(context, 22),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Hot Offers ListView (responsive layout)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (isTablet && constraints.maxWidth > 800) {
                          // For tablets and larger screens, show in 2 columns
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 3.5,
                                ),
                            itemCount: _hotOffers.length,
                            itemBuilder: (context, index) {
                              return _buildHotOfferCard(
                                _hotOffers[index],
                                isTablet,
                              );
                            },
                          );
                        } else {
                          // For mobile screens, show as vertical list
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _hotOffers.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: _buildHotOfferCard(
                                    _hotOffers[index],
                                    isTablet,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotOfferCard(HotOffer offer, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          // Offer Image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(15),
            ),
            child: Image.network(
              offer.image,
              width: isTablet ? 120 : 90,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: isTablet ? 120 : 90,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.local_offer, color: Colors.grey),
                );
              },
            ),
          ),

          // Offer Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 16 : 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          offer.title,
                          style: TextStyle(
                            fontFamily: 'Suwannaphum-Regular',
                            fontSize: _getResponsiveFontSize(context, 15),
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 10 : 6,
                          vertical: isTablet ? 6 : 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          offer.discount,
                          style: TextStyle(
                            fontFamily: 'Suwannaphum-Regular',
                            fontSize: _getResponsiveFontSize(context, 10),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    offer.description,
                    style: TextStyle(
                      fontFamily: 'Suwannaphum-Regular',
                      fontSize: _getResponsiveFontSize(context, 11),
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

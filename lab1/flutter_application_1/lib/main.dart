import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothing Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: MyHomePage(title: '213243'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final List<Map<String, String>> clothes = [
    {
      'name': 'T-shirt',
      'image':
          'https://media.boohoo.com/i/boohoo/bmm50576_ecru_xl?w=900&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit',
      'description': 'A comfortable short-sleeved t-shirt.',
      'price': '500 MKD',
    },
    {
      'name': 'Jeans',
      'image':
          'https://img01.ztat.net/article/spp-media-p1/ded965c1750440a2be9229d6e9e16858/ce9de77daace44e4ad9550e9c7dd6964.jpg?imwidth=600',
      'description': 'Classic denim jeans.',
      'price': '1500 MKD',
    },
    {
      'name': 'Winter Jacket',
      'image':
          'https://cdn.shopify.com/s/files/1/0218/9988/products/m_nordic_jacket_ob_01.jpg?v=1673482816&width=1024&height=1331&crop=center',
      'description': 'A warm jacket for cold weather.',
      'price': '3000 MKD',
    },
    {
      'name': 'Sneakers',
      'image':
          'https://img01.ztat.net/article/spp-media-p1/3d17b2809383389b866ce7ce0346fbc0/cb4773bc42444dde9a37bfe269a1c13c.jpg?imwidth=600',
      'description': 'Comfortable sneakers for everyday use.',
      'price': '2000 MKD',
    },
    {
      'name': 'Sunglasses',
      'image':
          'https://vincerocollective.com/cdn/shop/products/VinceromatteBlackVIla.jpg?crop=center&v=1709882336&width=800',
      'description': 'Stylish sunglasses to protect your eyes.',
      'price': '800 MKD',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600
                ? 3
                : 2, // Adjust columns based on screen width
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenWidth * 0.02,
          ),
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            final item = clothes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(item: item),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.network(
                        item['image']!,
                        height: screenHeight * 0.2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Text(
                        item['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      item['price']!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, String> item;

  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                item['image']!,
                height: screenHeight * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              item['name']!,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              item['description']!,
              style: TextStyle(fontSize: screenWidth * 0.045),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Price: ${item['price']}',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

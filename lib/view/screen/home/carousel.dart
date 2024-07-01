import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ommu/core/constant/app_color.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400, // Adjusted height
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.8, // Increased to show more of non-centered items
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return const EventCard(
              image: 'images/sample_image.jpg',
              title: 'Mural',
              subtitle: '(CIV 5+)',
              slots: '5 slots',
              time: '6:00-7:00 pm',
              price: 'BSP 150',
              location: 'Pioneer Ave., Poblacion',
              isNew: true,
            );
          },
        );
      }).toList(),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String slots;
  final String time;
  final String price;
  final String location;
  final bool isNew;

  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.slots,
    required this.time,
    required this.price,
    required this.location,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
                if (isNew)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 3),
                      child: const Text('New',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.person_add_alt_1, slots),
                  _buildInfoRow(Icons.access_time, time),
                  _buildInfoRow(Icons.attach_money, price),
                  _buildInfoRow(Icons.location_on, location),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.brown,
                  elevation: 3,
                  minimumSize: const Size(double.infinity, 36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'TAKE',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 12, right: 12),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 6),
          Flexible(
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800))),
        ],
      ),
    );
  }
}

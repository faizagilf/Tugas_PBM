// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tugas3/utilities/category_card.dart';
import 'package:tugas3/utilities/doctor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18, 
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Faiz Agil F',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.person), 
                      ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20), 
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(12),
                    ),
                  child: Row(
                    children: [
                      Container(
                        height: 100, 
                        width: 100,
                        child: Lottie.network(
                          'https://assets1.lottiefiles.com/packages/lf20_tutvdkg0.json'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Apa yang kamu rasakan?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Mohon isi data sekarang',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(color: Colors.white),
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

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                    ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'Apa yang bisa kami bantu?',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      categoryName: 'Dokter Gigi',
                      iconImagePath: 'lib/icons/tooth.png',
                    ),
                    CategoryCard(
                      categoryName: 'Dokter Bedah',
                      iconImagePath: 'lib/icons/surgeon.png',
                    ),
                    CategoryCard(
                      categoryName: 'Apoteker',
                      iconImagePath: 'lib/icons/drugs.png',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'List dokter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DoctorCard(
                      doctorImagePath: 'lib/images/doctor1.png',
                      rating: '4.9',
                      doctorName: 'Dr. Arfan Ryo',
                      doctorProfession: 'Therapist',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/images/doctor2.png',
                      rating: '4.5',
                      doctorName: 'Dr. Irna Purnahasanah',
                      doctorProfession: 'Psychologist',
                    ),
                    DoctorCard(
                      doctorImagePath: 'lib/images/doctor3.png',
                      rating: '5.0',
                      doctorName: 'Dr. Steve Jobs',
                      doctorProfession: 'Surgeon',
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
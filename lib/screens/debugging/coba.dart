import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Course {
  final String title;
  final String imageUrl;
  final double price;
  final double rating;

  Course(
      {required this.title,
      required this.imageUrl,
      required this.price,
      required this.rating});
}

class CobaCourseGrid extends StatelessWidget {
  final List<Course> courses = [
    Course(
        title: 'Course 1',
        imageUrl:
            'https://img-c.udemycdn.com/course/750x422/1736426_5cc3_4.jpg',
        price: 29.99,
        rating: 4.5),
    Course(
        title: 'Course 2',
        imageUrl:
            'https://img-c.udemycdn.com/course/750x422/1736426_5cc3_4.jpg',
        price: 19.99,
        rating: 4.2),
    Course(
        title: 'Course 3',
        imageUrl:
            'https://img-c.udemycdn.com/course/750x422/1736426_5cc3_4.jpg',
        price: 24.99,
        rating: 4.7),
    Course(
        title: 'Course 4',
        imageUrl:
            'https://img-c.udemycdn.com/course/750x422/1736426_5cc3_4.jpg',
        price: 34.99,
        rating: 4.8),
    Course(
        title: 'Course 5',
        imageUrl:
            'https://img-c.udemycdn.com/course/750x422/1736426_5cc3_4.jpg',
        price: 39.99,
        rating: 4.6),
    Course(
        title: 'Course 6',
        imageUrl:
            'https://img-c.udemycdn.com/course/750x422/1736426_5cc3_4.jpg',
        price: 14.99,
        rating: 4.3),
  ];

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double spacing = 15.0;
    int numberOfColumns = 2;
    // double itemAspectRatio = 1.0;

    // double totalWidthAvailableForItems =
    // screenWidth - (numberOfColumns - 1) * spacing;
    // double widthOfEachItem =
    // (totalWidthAvailableForItems - (numberOfColumns - 1) * spacing) /
    numberOfColumns;
    // double totalWidthOfGrid = widthOfEachItem * numberOfColumns;

    // double distanceOfLeftEdgeOffScreen = (screenWidth - totalWidthOfGrid) / 2;
    // double distanceOfRightEdgeOffScreen = distanceOfLeftEdgeOffScreen;

    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        return CourseCard(course: courses[index]);
      },
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Image.network(
                course.imageUrl,
                width: double.infinity,
                height: 180.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${course.price.toString()}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Color.fromARGB(255, 210, 172, 35)),
                          const SizedBox(width: 5),
                          Text(
                            course.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
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

class CourseScreens extends StatelessWidget {
  const CourseScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = 7.0; // Adjust this based on your layout
    int numberOfColumns = 2; // Number of columns in your grid
    double itemWidth =
        (screenWidth - (numberOfColumns - 1) * spacing) / numberOfColumns;
    double totalGridWidth = itemWidth * numberOfColumns;
    double horizontalPadding = (screenWidth - totalGridWidth) / 2;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: CobaCourseGrid(),
      ),
    );
  }
}

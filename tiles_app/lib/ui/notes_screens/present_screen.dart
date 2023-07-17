import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/carousel_widget/carousel_present_screen.dart';

class PresentatationPage extends StatefulWidget {
  const PresentatationPage({Key? key}) : super(key: key);

  @override
  State<PresentatationPage> createState() => _PresentatationPageState();
}

class _PresentatationPageState extends State<PresentatationPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
          ),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 0.8,
                    height: MediaQuery.of(context).size.height / 1.2,
                    initialPage: 0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() => activeIndex = index);
                    }),
                items: [
                  CarouselWidget(
                      size: size,
                      artboard: "buddy_illustration1",
                      text:
                          "Buddy, your ultimate companion in managing tasks. Stay organized and smash your goals with ease!"),
                  CarouselWidget(
                      size: size,
                      artboard: "buddy_illustration2",
                      text:
                          "Group all your tasks into projects and tackle them with focus and determination.'"),
                  CarouselWidget(
                      size: size,
                      artboard: "buddy_illustration3",
                      text:
                          'Stay updated and effectively keep tabs on your progress across multiple projects with TaskBuddy! '
                          'Set deadlines and create reminders.')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.navigate_next_outlined),
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/drawer_screen'); //TODO: Сделать анимацию перехода к новой странице как открытие приложения
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

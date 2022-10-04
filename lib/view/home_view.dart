import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../data/destination_model.dart';
import '../data/hotel_model.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/destination_card.dart';
import '../widgets/hotel_card.dart';
import 'destination_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String title = "What would you like to find?";
  final String topDestinations = "Top Destinations";
  final String topHotels = "Exclusive Hotels";
  final String seeAll = "see all";
  int currentIndex = 0;
  int navBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: navBarIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: kDisabledIconColor,
          onTap: (index) {
            setState(() {
              navBarIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("User"),
            ),
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 65,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              _getTransportsIconButtons(),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    topDestinations,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    seeAll,
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              _getDestinationsSection(),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    topHotels,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    seeAll,
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              _getHotelsSection(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTransportsIconButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomIconButton(
          index: 0,
          currentIndex: currentIndex,
          iconName: kPlane,
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
        ),
        CustomIconButton(
          index: 1,
          currentIndex: currentIndex,
          iconName: kYacht,
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          },
        ),
        CustomIconButton(
          index: 2,
          currentIndex: currentIndex,
          iconName: kCar,
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
        ),
        CustomIconButton(
          index: 3,
          currentIndex: currentIndex,
          iconName: kBike,
          onPressed: () {
            setState(() {
              currentIndex = 3;
            });
          },
        ),
      ],
    );
  }

  Widget _getDestinationsSection() {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return DestinationCard(
            destination: destinations[index],
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DestinationView(destination: destinations[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getHotelsSection() {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(
            hotel: hotels[index],
          );
        },
      ),
    );
  }
}

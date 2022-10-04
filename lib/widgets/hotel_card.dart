import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/icons.dart';
import '../data/hotel_model.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  double _imageHeight;
  double _imageWidth;

  HotelCard({this.hotel});

  @override
  Widget build(BuildContext context) {
    _imageHeight = 180;
    _imageWidth = 300;
    return _getImageContainer();
  }

  Widget _getImageContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: _imageHeight,
        width: _imageWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(
            image: AssetImage(hotel.imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.01,
                  0.3,
                ],
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hotel.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: <Widget>[
                    ImageIcon(
                      AssetImage(kLocation),
                      color: Colors.white,
                      size: 12,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      hotel.address,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${hotel.price} a night",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

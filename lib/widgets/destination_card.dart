import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../data/destination_model.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final Function onTap;
  double _imageHeight;
  double _imageWidth;
  double _descriptionHeight;
  double _descriptionWidth;

  DestinationCard({@required this.destination, this.onTap});

  @override
  Widget build(BuildContext context) {
    _imageHeight = 180;
    _imageWidth = 180;
    _descriptionHeight = _imageHeight - 30;
    _descriptionWidth = _imageWidth + 20;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          _getDescriptionContainer(),
          _getImageContainer(),
        ],
      ),
    );
  }

  Widget _getDescriptionContainer() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: _descriptionHeight - 20,
        ),
        Container(
          height: _descriptionHeight,
          width: _descriptionWidth,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${destination.activities.length.toString()} activities",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                destination.description,
                style: TextStyle(color: kDisabledIconColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getImageContainer() {
    return Stack(
      children: <Widget>[
        Hero(
          tag: destination.city,
          child: Container(
            height: _imageHeight,
            width: _imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              image: DecorationImage(
                image: AssetImage(destination.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                destination.city,
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
                    destination.country,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

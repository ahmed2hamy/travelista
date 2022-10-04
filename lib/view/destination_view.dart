import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../data/activity_model.dart';
import '../data/destination_model.dart';

class DestinationView extends StatelessWidget {
  final Destination destination;

  DestinationView({@required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: true,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.333),
              child: Container(),
            ),
            flexibleSpace: _getImageContainer(),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          _getActivitiesList(),
        ],
      ),
    );
  }

  Widget _getImageContainer() {
    return Stack(
      children: <Widget>[
        Hero(
          tag: destination.city,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              image: DecorationImage(
                image: AssetImage(destination.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
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

  Widget _getActivitiesList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return _getActivitesCard(index);
      },
      childCount: destination.activities.length,
    ));
  }

  Widget _getActivitesCard(int index) {
    Activity activity = destination.activities[index];
    double height = 180;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: height - 20,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  image: DecorationImage(
                    image: AssetImage(destination.activities[index].imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              _getActivityDetails(activity),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getActivityDetails(Activity activity) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        activity.name,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        activity.type,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      SmoothStarRating(
                        allowHalfRating: false,
                        rating: activity.rating.toDouble(),
                        starCount: 5,
                        color: Colors.yellow,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "\$${activity.price}",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Per Pax",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _getStartTimesList(activity),
          ],
        ),
      ),
    );
  }

  Widget _getStartTimesList(Activity activity) {
    return Row(
      children: <Widget>[
        Chip(
          label: Text(activity.startTimes[0]),
          backgroundColor: kEnapledIconColor,
        ),
        SizedBox(
          width: 4,
        ),
        Chip(
          label: Text(activity.startTimes[1]),
          backgroundColor: kEnapledIconColor,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/pescadito.jpg", "Varuna Yasas", "1 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/pescadito2.jpg", "Anahí Salgado", "2 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/señor.jpg", "Gissele Thomas", "2 review · 2 photos", "There is an amazing place in Sri Lanka"),

      ],
    );
  }

}
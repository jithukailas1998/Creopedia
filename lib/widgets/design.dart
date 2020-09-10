import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.black45,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.transparent,
      blurRadius: 10.0,
      offset: Offset(2, 2),
    ),
  ],
);
import 'package:flutter/material.dart';
import 'package:photos_real_estate/data/models/object_model.dart';
import 'package:photos_real_estate/presentation/screens/objects_list/cart_object.dart';

Widget customSliverList(List<ObjectModel> objectList) {
  return SliverList.builder(
    itemCount: objectList.length,
    itemBuilder: (context, index) {
      return CartObject(
        objectData: objectList[index],
      );
    },
  );
}

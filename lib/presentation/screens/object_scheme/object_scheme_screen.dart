import 'package:flutter/material.dart';
import 'package:photos_real_estate/data/models/object_model.dart';

class ObjectSchemeScreen extends StatelessWidget {
  const ObjectSchemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final objectModel =
        ModalRoute.of(context)!.settings.arguments as ObjectModel;
    final points = objectModel.points;
    return Scaffold(
      appBar: AppBar(
        title: Text(objectModel.title),
      ),
      body: InteractiveViewer(
        constrained: false,
        minScale: 0.1,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/layout_plan_1.png",
            ),
            ...List.generate(
              points.length,
              (index) => Positioned(
                right: double.parse("${points[index].x}"), // X
                bottom: double.parse("${points[index].y}"), // Y
                child: (points[index].status == "completed")
                    ? Image.asset(
                        "assets/images/completed.png",
                        scale: 0.8,
                      )
                    : Image.asset(
                        "assets/images/incompleted.png",
                        scale: 0.8,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

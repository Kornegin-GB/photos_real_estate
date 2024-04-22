import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_real_estate/data/models/object_model.dart';
import 'package:photos_real_estate/domain/bloc/device_data/device_data_bloc.dart';

class CartObject extends StatelessWidget {
  const CartObject({super.key, required this.objectData});

  final ObjectModel objectData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final busyMemory = objectData.totalPointsCount * 5;
    return Card(
      color: Colors.white,
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/scheme', arguments: objectData);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                objectData.title,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Отснято сегодня:",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${objectData.remainingPoints} / ${objectData.totalPointsCount} доступно",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.hintColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Съемка займет:",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      BlocBuilder<DeviceDataBloc, DeviceDataState>(
                        builder: (context, state) {
                          return (state is DeviceDataLoaded)
                              ? Text(
                                  "$busyMemory ГБ / ${state.deviceTotalMemory} ГБ доступно",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.hintColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Text(
                                  "$busyMemory ГБ / 0.0 ГБ доступно",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.hintColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                );
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

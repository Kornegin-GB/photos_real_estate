import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_real_estate/domain/bloc/device_data/device_data_bloc.dart';
import 'package:photos_real_estate/domain/bloc/object_list/object_list_bloc.dart';
import 'package:photos_real_estate/presentation/screens/objects_list/custom_app_bar.dart';
import 'package:photos_real_estate/presentation/widgets/build_sliver_list.dart';

class ObjectsListScreen extends StatefulWidget {
  const ObjectsListScreen({super.key});

  @override
  State<ObjectsListScreen> createState() => _ObjectsListScreenState();
}

class _ObjectsListScreenState extends State<ObjectsListScreen> {
  @override
  void initState() {
    BlocProvider.of<ObjectListBloc>(context).add(LoadObjectList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            BlocConsumer<ObjectListBloc, ObjectListState>(
              listener: (context, state) {
                if (state is ObjectListLoaded) {
                  BlocProvider.of<DeviceDataBloc>(context)
                      .add(LoadDeviceData());
                }
              },
              builder: (context, state) {
                if (state is ObjectListLoaded) {
                  return customSliverList(state.objectList);
                }
                if (state is SearchObjectListLoaded) {
                  return customSliverList(state.searchObjectList);
                }
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

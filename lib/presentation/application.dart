import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_real_estate/core/theme/app_theme_color.dart';
import 'package:photos_real_estate/data/api/get_data_objects.dart';
import 'package:photos_real_estate/data/device_data/get_free_memory.dart';
import 'package:photos_real_estate/domain/bloc/device_data/device_data_bloc.dart';
import 'package:photos_real_estate/domain/bloc/object_list/object_list_bloc.dart';
import 'package:photos_real_estate/presentation/main_page_app.dart';
import 'package:photos_real_estate/presentation/screens/object_scheme/object_scheme_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ObjectListBloc(GetDataObjects()),
        ),
        BlocProvider(
          create: (context) => DeviceDataBloc(GetFreeMemory()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Photos real estate",
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppThemeColor.primaryColor,
          hoverColor: AppThemeColor.hoverColor,
          scaffoldBackgroundColor: AppThemeColor.primaryColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppThemeColor.primaryColor,
            brightness: Brightness.light,
            surfaceTint: Colors.transparent,
          ),
          fontFamily: "Roboto",
        ),
        routes: {
          "/": (context) => const MainPageApp(),
          "/scheme": (context) => const ObjectSchemeScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}

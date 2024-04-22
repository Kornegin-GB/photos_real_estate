import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_real_estate/domain/bloc/object_list/object_list_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      onChanged: (value) {
        context.read<ObjectListBloc>().add(SearchObjectList(value));
      },
      textAlignVertical: TextAlignVertical.center,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        border: InputBorder.none,
        isCollapsed: true,
        hintText: "Найти...",
        hintStyle: TextStyle(
          color: theme.hintColor.withOpacity(0.3),
        ),
      ),
    );
  }
}

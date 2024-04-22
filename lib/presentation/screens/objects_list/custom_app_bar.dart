import 'package:flutter/material.dart';
import 'package:photos_real_estate/presentation/widgets/custom_text_form_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const titleText = "Объекты"; // Заголовок экрана
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      forceElevated: true,
      expandedHeight: 140,
      backgroundColor: theme.cardColor,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          bool isExpanded = constraints.maxHeight >
              kToolbarHeight + MediaQuery.of(context).padding.top;
          return FlexibleSpaceBar(
            background: Container(
              color: isExpanded ? theme.primaryColor : Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(titleText, style: theme.textTheme.headlineLarge),
                  const Icon(Icons.info_outline)
                ],
              ),
            ),
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            title: SizedBox(
              height: isExpanded ? 40 : 50,
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(left: 8.0),
                margin: isExpanded
                    ? const EdgeInsets.symmetric(horizontal: 12.0)
                        .copyWith(bottom: 8.0)
                    : const EdgeInsets.symmetric(horizontal: 12.0)
                        .copyWith(bottom: 16.0),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search_rounded),
                    const SizedBox(width: 8.0),
                    isExpanded
                        ? const Expanded(
                            child: CustomTextFormField(),
                          )
                        : Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                titleText,
                                style: theme.textTheme.headlineLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                    isExpanded
                        ? Image.asset(
                            "assets/images/trailing-icon.png",
                          )
                        : Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            child: const Icon(Icons.info_outline),
                          )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

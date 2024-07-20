import 'package:burningbros/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.not_interested, size: 40.0),
          const SizedBox(height: 8.0),
          Text(
            S.of(context).noDataFoundHere,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

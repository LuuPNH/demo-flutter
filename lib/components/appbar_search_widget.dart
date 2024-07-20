import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class AppBarSearchWidget extends StatelessWidget {
  const AppBarSearchWidget({
    super.key,
    required this.controller,
    this.loadingWidget,
  });

  final TextEditingController controller;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, size: 27),
        ),
        Expanded(
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              controller: controller,
              decoration: _inputDecoration(context),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: S.of(context).searchProduct,
      border: InputBorder.none,
      prefixIcon: const Icon(Icons.search, size: 24.0),
      suffixIcon: loadingWidget,
    );
  }


}

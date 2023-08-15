import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';

class all_custom_btn extends StatelessWidget {
  const all_custom_btn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.circular(30),
          border:
              Border.all(color: Theme.of(context).hintColor.withOpacity(0.2))),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            radius: 15,
            child: Icon(
              Icons.grid_view_rounded,
              size: 15,
              color: Theme.of(context).hintColor,
            ),
          ).pOnly(right: 3),
          Text(
            'all'.tr,
            style: TextStyle(
              color: Theme.of(context).cardColor,
            ),
          ).pOnly(right: 5),
        ],
      ).px(4).py(3),
    );
  }
}

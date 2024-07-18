import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class nameText extends StatefulWidget {
  String? text;
  double? money;
  Color? bordercolor;
  double? bordersize;
  TextStyle? textStyle;
  double? width;
  double? hegiht;
  bool IsItHaveMethod;
  VoidCallback? ontap;
  nameText(
      {required this.IsItHaveMethod,
      super.key,
      this.ontap,
      this.bordercolor,
      this.bordersize,
      this.textStyle,
      this.hegiht,
      this.width,
      this.money,
      this.text});

  @override
  State<nameText> createState() => _nameTextState();
}

class _nameTextState extends State<nameText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('it tap');
        if (widget.IsItHaveMethod) {
          widget.ontap!();
          
        } else {}
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
          decoration: BoxDecoration(
            border: Border.all(
                color: widget.bordercolor ?? colorManager.mainorange,
                width: widget.bordersize ?? 1),
            borderRadius: BorderRadius.circular(16),
          ),
          width: widget.width?.w ?? 160.w,
          height: widget.hegiht?.h ?? 70.h,
          alignment: Alignment.center,
          child: Text(
            widget.text ?? '${widget.money.toString()} ₺',
            style: styles.item36BoldBlack,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}

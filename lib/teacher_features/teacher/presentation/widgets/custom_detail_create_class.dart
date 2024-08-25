import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/styles.dart';

class CustomDetailsForCreateClass extends StatefulWidget {
  const CustomDetailsForCreateClass({
    super.key,
    required this.name,
    required this.hint,
    required this.indx,
    required this.selectedItem,
    required this.onSelected,
    required this.listItemBuilder,
  });

  final String name;
  final String hint;
  final int indx;
  final String selectedItem;
  final void Function(String) onSelected;
  final List<String> listItemBuilder;

  @override
  State<CustomDetailsForCreateClass> createState() =>
      _CustomDetailsForCreateClassState();
}

class _CustomDetailsForCreateClassState
    extends State<CustomDetailsForCreateClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.name,
          textDirection: TextDirection.rtl,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7.h),
        Container(
          height: 55.h,
          decoration: BoxDecoration(
              color: kSplashColor, borderRadius: BorderRadius.circular(4.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.expand_more,
                    color: kPrimaryColor,
                    size: 32,
                  ),
                  onSelected: widget.onSelected,
                  itemBuilder: (BuildContext bc) {
                    return widget.listItemBuilder.map((String item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList();
                  }),
              //
              SizedBox(width: 5.w),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  widget.selectedItem,
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

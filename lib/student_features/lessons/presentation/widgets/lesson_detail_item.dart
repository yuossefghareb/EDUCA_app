import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonDetailItem extends StatelessWidget {
  const LessonDetailItem({super.key, required this.type, required this.name, required this.ontap});
  final String type;
  final String name;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            type == 'PDF'
                ? Image.asset(
                    'assets/images/pdf.png',
                    width: 65,
                  )
                : type == 'image'
                    ? Image.asset(
                        'assets/images/image.png',
                        width: 65,
                      )
                    : Image.asset(
                        'assets/images/doc.png',
                        width: 65,
                      ),
            SizedBox(height: 12.h),
            name.length > 20
                ? Text(
                    '${name.substring(0, 16)}...',
                    textAlign: TextAlign.center,
                  )
                : Text(
                    name,
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}

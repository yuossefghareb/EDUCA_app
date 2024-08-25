import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../auth/presentation/view_model/governorate_cubit.dart';
import 'search_list_view.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchType});
  final String searchType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<GovernorateSelectCubit, String>(
        builder: (context, governateState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20.h),
              SearchTextFormField(
                searchType: searchType,
                governateState: governateState,
              ),
              searchType == "governate"
                  ? SizedBox(height: 16.h)
                  : const SizedBox.shrink(),
              searchType == "governate"
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: kPrimaryColor),
                      ),
                      child: DropdownButton(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        borderRadius: BorderRadius.circular(6),
                        underline: Container(color: Colors.transparent),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded,
                            color: kPrimaryColor, size: 30),
                        alignment: Alignment.centerRight,
                        style: Styles.textStyle16.copyWith(color: Colors.black),
                        elevation: 1,
                        hint: Text(
                          governateState,
                          style: GoogleFonts.tajawal(fontSize: 14.sp),
                        ),
                        onChanged: (val) {
                          context
                              .read<GovernorateSelectCubit>()
                              .changeState(val.toString());
                        },
                        isExpanded: true,
                        items: governorates.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.centerRight,
                              value: value,
                              child: Text(value, style: GoogleFonts.tajawal()),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: 25.h),
              Text(
                "نتائج البحث",
                style: Styles.textStyle14,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: SearchListView(searchType: searchType),
              ),
            ],
          );
        },
      ),
    );
  }
}

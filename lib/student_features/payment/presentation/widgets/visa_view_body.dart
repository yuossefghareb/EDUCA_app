import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/enrollment/presentation/view_model/cubit/enrollment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import '../../../../Core/widgets/custom_cherry_toast.dart';

class VisaViewBody extends StatefulWidget {
  const VisaViewBody({super.key, required this.url, required this.subjectID});
  final String url;
  final int subjectID;

  @override
  VisaViewBodyState createState() => VisaViewBodyState();
}

class VisaViewBodyState extends State<VisaViewBody> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            if (request.url.contains("success=true")) {
              context.read<EnrollmentCubit>().studentEnrollment(
                    CacheHelper.getData(key: ApiKey.id),
                    widget.subjectID,
                  );
              successCherryToast(
                  context, 'عملية دفع ناجحة', 'تم تسجيل المادة بنجاح');
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.customBottomBarViewRoute, (route) => false);

              return NavigationDecision.navigate;
            } else if (request.url.contains("success=false")) {
              errorCherryToast(context, 'حدث خطأ', 'فشلت عملية الدفع');
              return NavigationDecision.navigate;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
    );
  }
}

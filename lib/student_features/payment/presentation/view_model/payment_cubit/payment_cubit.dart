import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/payment_api_services.dart';
import 'package:field_training_app/Core/utils/payment_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentApiServices) : super(PaymentInitial());
  final PaymentApiServices paymentApiServices;
  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    paymentApiServices
        .post(endPoint: PaymentConstants.getAuthTokenEndpoint, data: {
      'api_key': PaymentConstants.paymentApiKey,
    }).then((value) {
      PaymentConstants.paymentAuthToken = value['token'];
      emit(PaymentAuthSuccessState());
    }).catchError((error) {
      emit(PaymentAuthErrorState(error.toString()));
    });
  }

  Future getOrderRegistrationID({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentOrderIdLoadingState());
    paymentApiServices
        .post(endPoint: PaymentConstants.getOrderIDEndpoint, data: {
      'auth_token': PaymentConstants.paymentAuthToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      PaymentConstants.paymentOrderID = value['id'].toString();
      getPaymentRequest(price, firstName, lastName, email, phone);
      emit(PaymentOrderIdSuccessState());
    }).catchError((error) {
      emit(PaymentOrderIdErrorState(error.toString()));
    });
  }

  // for final request token

  Future<void> getPaymentRequest(
    String priceOrder,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    emit(PaymentRequestTokenLoadingState());
    paymentApiServices.post(
      endPoint: PaymentConstants.getPaymentIDEndpoint,
      data: {
        "auth_token": PaymentConstants.paymentAuthToken,
        "amount_cents": priceOrder,
        "expiration": 3600,
        "order_id": PaymentConstants.paymentOrderID,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": PaymentConstants.integrationOnlineCardID,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentConstants.paymentFinalToken = value['token'];
      emit(PaymentRequestTokenSuccessState());
    }).catchError((error) {
      emit(PaymentRequestTokenErrorState(error.toString()));
    });
  }

  Future getRefCode() async {
    paymentApiServices.post(
      endPoint: PaymentConstants.getRefCodeEndpoint,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": PaymentConstants.paymentFinalToken,
      },
    ).then((value) {
      PaymentConstants.paymentRefCode = value['id'].toString();
      emit(PaymentRefCodeSuccessState());
    }).catchError((error) {
      emit(PaymentRefCodeErrorState(error.toString()));
    });
  }
}

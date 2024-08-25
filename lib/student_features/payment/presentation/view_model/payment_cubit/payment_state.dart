part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

//! for Auth token
class PaymentInitialState extends PaymentState {}

class PaymentAuthLoadingState extends PaymentState {}

class PaymentAuthSuccessState extends PaymentState {}

class PaymentAuthErrorState extends PaymentState {
  final String error;
  const PaymentAuthErrorState(this.error);
}

//! for order id
class PaymentOrderIdLoadingState extends PaymentState {}

class PaymentOrderIdSuccessState extends PaymentState {}

class PaymentOrderIdErrorState extends PaymentState {
  final String error;
  const PaymentOrderIdErrorState(this.error);
}

//! for request token
class PaymentRequestTokenLoadingState extends PaymentState {}

class PaymentRequestTokenSuccessState extends PaymentState {}

class PaymentRequestTokenErrorState extends PaymentState {
  final String error;
  const PaymentRequestTokenErrorState(this.error);
}

//! for ref code
class PaymentRefCodeLoadingState extends PaymentState {}

class PaymentRefCodeSuccessState extends PaymentState {}

class PaymentRefCodeErrorState extends PaymentState {
  final String error;
  const PaymentRefCodeErrorState(this.error);
}

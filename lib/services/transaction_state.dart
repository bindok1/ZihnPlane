part of '../cubit/transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

//langkah membuat consume api dengan cubit
//buat state
class TransactionInitial extends TransactionState {}

//buat loading
class TransactionLoading extends TransactionState {}

//loading baru
class TransactionSucces extends TransactionState {
  final List<TransactionModel> transactions;
  TransactionSucces(this.transactions);
  @override
  // TODO: implement props
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  //isi error
  final String error;
  TransactionFailed(this.error);

//mereturn error
  @override
  List<Object> get props => [error];
}

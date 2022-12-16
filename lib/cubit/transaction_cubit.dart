import 'dart:io';
import 'dart:math';

import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part '../services/transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  //buat method

  void createTransaction(TransactionModel transaction) async {
    try {
      //buat spt ini

      //buat loadin
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      //perintah loading succes
      emit(TransactionSucces([]));

      //buat state loading baru di transactionstate

    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
  //method baru

  void fetchTransactions() async {
    try {
      emit(TransactionLoading());
      //buat atribut baru di list transaction state
      List<TransactionModel> transactions =
          await TransactionService().fetchTransactions();
      emit(TransactionSucces(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}

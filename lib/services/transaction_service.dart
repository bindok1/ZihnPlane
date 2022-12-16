import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/destination_model.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');
//pergi ke firebae buat user collection

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        //memanggil json
        'destination': transaction.destination.toJson(),
        'amountOfTraveller': transaction.AmountOfTraveler,
        'selectedSeats': transaction.selectedSeat,
        'insurance': transaction.insurance,
        'refundable': transaction.refund,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

//menambahkan method fetch transaction
  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return transactions;
    } catch (e) {
      throw e;
    }
  }
  //setelah method fetch transaction tmbh json di transaction model

}
  //ubah data destination model ke json

//untuk menambahkan user jadi dinamis

import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int? AmountOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refund;
  final double vat;
  final int? price;
  final int? grandTotal;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.AmountOfTraveler = 0,
    this.selectedSeat = '',
    this.refund = false,
    this.insurance = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  //buat dsini json nya
  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        destination : DestinationModel.fromJson(json['destination']['id'], json['destination']),
        id: id,
        AmountOfTraveler: json['amountOfTraveler'],
        selectedSeat: json['selectedSeats'],
        insurance: json['insurance'],
        refund: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

      // setelah buat json pergi ke transaction cubit buat method 

  @override
  // TODO: implement props
  List<Object?> get props => [
        destination,
        AmountOfTraveler,
        selectedSeat,
        insurance,
        vat,
        price,
        grandTotal,
      ];
}

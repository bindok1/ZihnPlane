import 'package:equatable/equatable.dart';

class NewDestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;


  NewDestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
  });

  factory NewDestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      NewDestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
  
      );

  @override
  List<Object?> get props => [id, name, city, imageUrl, rating];
}

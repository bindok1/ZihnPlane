import 'dart:ffi';

import 'package:airplane/cubit/seat_cubit_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
//Note : 0 = available, 1 = selected, 2 = unselected
  final bool isAvailable;
  final String id;

  const SeatItem({
    Key? key,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //watch kebalikan read untuk menampilkan perubahan tanpa di save
    bool isSelected = context.watch<SeatCubitCubit>().isSelected(id);
    backgrroundColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
            child: Text('YOU',
                style: whiteTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)));
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubitCubit>().selectseat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: backgrroundColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: borderColor(),
              width: 2,
            )),
        child: child(),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
          builder: (context, state) {
        if (state is AgesLoading)
          return Center(child: CircularProgressIndicator());
        if (state is AgesLoaded) {
          return _ages(state.ages);
        }
        if (state is AgesFailure) {
          return Text(state.messenger);
        }
        return SizedBox.shrink();
      }),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context
                        .read<AgeSelectionCubit>()
                        .selectAge(ages[index].data()['value']);


                  },
                  child: Text(
                    ages[index].data()['value'],
                    style: TextStyle(fontSize: 20),
                  )),
              Divider()
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: ages.length);
  }
}

import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_app_button.dart';
import 'package:ecommerce_app/common/widgets/buttons/basic_reactive_button.dart';
import 'package:ecommerce_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/domain/auth/usecases/signup.dart';
import 'package:ecommerce_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:ecommerce_app/presentation/auth/widgets/ages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/age_selection_cubit.dart';
import '../bloc/ages_display_cubit.dart';

class GenderAndAgeSelection extends StatelessWidget {
  final UserCreationReq userCreationReq;

  const GenderAndAgeSelection({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonCubit()),
        ],
        child: Padding(
          padding: EdgeInsets.all(20),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating));
              }
              if (state is ButtonSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Đăng ký thành công"),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating));

                AppNavigator().pushAndRemoveUntil(context, SigninPage());
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _tellUs(),
                SizedBox(
                  height: 20,
                ),
                _gender(context),
                SizedBox(
                  height: 20,
                ),
                _howOld(),
                SizedBox(
                  height: 20,
                ),
                _age(),
                Spacer(),
                _finishButton(context)
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _tellUs() {
    return Text(
      "Thông tin của bạn",
      style: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _howOld() {
    return Text(
      "Bạn bao nhiêu tuổi?",
      style: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _gender(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _genderTile(context, 1, "Nam"),
            SizedBox(
              width: 20,
            ),
            _genderTile(context, 0, "Nữ"),
          ],
        );
      },
    );
  }

  Widget _genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.read<GenderSelectionCubit>().selectedIndex ==
                      genderIndex
                  ? AppColors.darkPrimary
                  : AppColors.darkSecondBackground),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                  BlocProvider.value(
                      value: context.read<AgesDisplayCubit>()..displayAges())
                ],
                child: Ages(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.darkSecondBackground,
              borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.all(20),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.read<AgeSelectionCubit>().selectedAge,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
        ),
      );
    });
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      child: Center(child: Builder(builder: (context) {
        return BasicReactiveButton(() {
          userCreationReq.gender =
              context.read<GenderSelectionCubit>().selectedIndex;
          userCreationReq.age = context.read<AgeSelectionCubit>().selectedAge;
          context
              .read<ButtonCubit>()
              .execute(usecase: SignupUseCase(), params: userCreationReq);
        }, "Hoàn tất", null);
      })),
    );
  }
}

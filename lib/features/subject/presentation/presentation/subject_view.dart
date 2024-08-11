import 'package:block_demo_dharmesh/core/utils/utility.dart';
import 'package:block_demo_dharmesh/export.dart';
import 'package:block_demo_dharmesh/models/home_res_model.dart';
import 'package:block_demo_dharmesh/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/common.dart';
import '../../../home/presentation/bloc/cubit/video_select_cubit.dart';
import '../../../standard/presentation/widget/card_grid.dart';
import '../bloc/bloc/subject_bloc.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({super.key});

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  StandardRes ? std ;
//standard
  getArgument() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = GetNav.getArguments(context);
      if (args != null ) {
        std = args['standard'] as StandardRes?;
        final videoIndex = context.read<VideoSelectionCubit>().state;
        context.read<SubjectBloc>().add( FetchSubjectBookData(
          standardId: std!.id!,
          index: videoIndex
        ));
      }

    });
  }

  @override
  void initState() {
    getArgument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: BlocBuilder<SubjectBloc, SubjectState>(
        builder: (context, state) {
          if (state is SubjectListLoading) {
            return  Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Utility.loader(),
            );
          } else if (state is SubjectSuccess) {
            return SafeArea(
              bottom: true,
              top: true,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            5.verticalSpace,
                            CardGridCustomAnimation(
                              widgetList: List.generate(
                                state.subjectList.length,
                                    (index) {
                                  var standard = state.subjectList[index] ;
                                  return _gridItemView(standard);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SubjectListEmpty) {
            return Center(child: Text(state.message));
          } else if (state is SubjectFailure) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }

  Widget _gridItemView(Subject standard) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        color: AppColors.white.withOpacity(0.1),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Common.bookCardNetworkImg(standard.image!),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.navyBlue.withOpacity(0.5),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: 5.h,
                      vertical: 5.h),
                  child: Text(
                    standard.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: poppinsSemiBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

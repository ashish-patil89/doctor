import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/l10n/l10n.dart';
import 'package:user_repository/user_repository.dart';

import '../cubit/set_schedule_cubit.dart';

class SetSchedulePage extends StatelessWidget {
  const SetSchedulePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SetScheduleCubit(
        userRepository: context.read<UserRepository>(),
      ),
      child: const SetScheduleView(),
    );
    ;
  }
}

class SetScheduleView extends StatefulWidget {
  const SetScheduleView({
    super.key,
  });

  @override
  State<SetScheduleView> createState() => _SetScheduleViewState();
}

class _SetScheduleViewState extends State<SetScheduleView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      child: Text(
                        context.l10n.addMoreTime,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.callout
                            .copyWith(color: AppColors.primaryGreen),
                      ),
                    ),
                    Gap(
                      AppSpacing.smd,
                    ),
                  ],
                );
              },
              childCount: 7, //TODO check from length
            ),
          ),
        ],
      ),
    );
  }
}

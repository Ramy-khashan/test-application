import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/core/utils/size_config.dart';

import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => HomeCubit()..getSavedColor(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final controller = HomeCubit.get(context);
          return GestureDetector(
            onTap: () {
              controller.playAuto ? null : controller.getRandomColor();
            },
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: controller.color,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        controller.changeColorAuto();
                      },
                      child: Text(controller.playAuto ? "Manual" : "Auto"))
                ],
              ),
              body: Center(
                child: Text(
                  "Hello there",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: getFont(30)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

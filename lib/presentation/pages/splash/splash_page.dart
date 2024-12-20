import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/constant/app_colors.dart';
import '../../../core/theme/constant/app_icons.dart';
import '../../routes/routes_name.dart';

//TODO 로그인 bloc
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => context.goNamed(RoutesName.MAIN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 하드코딩 된 값 변경할 것
      body: Center(child: SvgPicture.asset(AppIcons.mainLogo)),
      backgroundColor: AppColors.primary,
    );
  }
}

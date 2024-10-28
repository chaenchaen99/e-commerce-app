import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../core/theme/constant/app_colors.dart';
import '../../../../../../core/theme/custom/custom_font_weight.dart';

class TimerWidget extends StatefulWidget {
  final DateTime endTime;

  const TimerWidget({super.key, required this.endTime});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late Duration remainTime;

  @override
  void initState() {
    super.initState();

    remainTime = widget.endTime.difference(DateTime.now());

    if (remainTime > Duration.zero) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        remainTime = widget.endTime.difference(DateTime.now());

        if (remainTime <= Duration.zero) {
          _timer?.cancel();
        }

        setState(() {});
      });
    }
  }

  String _printDuration(Duration duration) {
    if (duration <= Duration.zero) {
      return 'TIME OUT';
    }

    //전달된 숫자 n을 두 자리 숫자로 문자열로 변환
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _printDuration(remainTime),
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(
            color: AppColors.contentPrimary,
          )
          .semiBold,
    );
  }
}

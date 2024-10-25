import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../domain/model/display/product_info/product_info.model.dart';
import '../../../../../domain/model/display/view_module/view_module.model.dart';
import 'factory/view_module_widget.dart';

class CarouselViewModule extends StatefulWidget with ViewModuleWidget {
  final ViewModule info;
  const CarouselViewModule({required this.info, super.key});

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  int _currentPage = 1;
  late PageController _pageController;
  late Timer _timer;

  Timer periodicTimer() {
    _pageController = PageController();
    return Timer.periodic(Duration(seconds: 4), (timer) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();

    _timer = periodicTimer();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = widget.info.products;

    return AspectRatio(
      aspectRatio: 375 / 340,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page % products.length + 1;
              });
            },
            itemBuilder: (_, index) {
              String src = products[index % products.length].imageUrl;
              return Image.network(
                src,
                fit: BoxFit.fill,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PageCountWidget(
                currentPage: _currentPage,
                totalPage: products.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PageCountWidget extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const PageCountWidget({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inverseSurface.withOpacity(0.74),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        child: Text(
          '$currentPage / $totalPage',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}

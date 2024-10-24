import 'package:flutter/material.dart';

import 'view_module_factory/view_module_widget.dart';

class ViewModuleE extends StatelessWidget with ViewModuleWidget {
  const ViewModuleE({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      height: 200,
      child: Center(
        child: Text('ViewModuleE'),
      ),
    );
  }
}

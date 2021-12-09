/*=============== Owned packages ===================*/
import 'package:citydanger/view_models/startup_view_model.dart';
/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
        viewModelBuilder: () => StartupViewModel(),
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) => const SizedBox());
  }
}

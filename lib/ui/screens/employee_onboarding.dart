import 'package:flutter/material.dart';
import 'package:grtts/data/providers/main_provider.dart';
import 'package:grtts/ui/layouts/main_layout.dart';
import 'package:grtts/ui/theme/colors.dart';
import 'package:grtts/ui/theme/typography.dart';
import 'package:grtts/ui/widgets/buttons/elevated_button_wrapper.dart';
import 'package:grtts/ui/widgets/inputs/outlined_input.dart';
import 'package:grtts/utils/strings.dart';
import 'package:provider/provider.dart';

class EmployeeOnboardingScreen extends StatefulWidget {
  const EmployeeOnboardingScreen({super.key});

  @override
  State<EmployeeOnboardingScreen> createState() =>
      _EmployeeOnboardingScreenState();
}

class _EmployeeOnboardingScreenState extends State<EmployeeOnboardingScreen> {
  get _mainProvider => context.read<MainProvider>();

  final continueBtnStateController = MaterialStatesController();
  final employeeIdTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      // INITIALIZING STATE OF CONTINUE BTN
      // continueBtnStateController.update(
      //     MaterialState.disabled, _mainProvider.loading);
    });
    super.initState();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO SUBMIT EMPLOYEE ONBOARDING FORM
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Consumer<MainProvider>(
          builder: (context, provider, __) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  OutlinedInput(
                    label: "employee_id".get(),
                    hint: "employee_id_hint".get(),
                    controller: employeeIdTextController,
                    // enabled: !provider.loading,
                    // initialValue: provider.employeeId,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButtonWrapper(
                      onPressed: () {},
                      // loading: provider.loading,
                      statesController: continueBtnStateController,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "continue".get(),
                          style: AppTypography.bodyBold(
                              color: AppColors.onSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

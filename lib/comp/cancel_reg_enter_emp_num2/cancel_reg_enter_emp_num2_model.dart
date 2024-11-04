import '/comp/cancel_reg_enter_emp_num2/cancel_reg_enter_emp_num2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cancel_reg_enter_emp_num2_widget.dart' show CancelRegEnterEmpNum2Widget;
import 'package:flutter/material.dart';

class CancelRegEnterEmpNum2Model
    extends FlutterFlowModel<CancelRegEnterEmpNum2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EmployeeNumberCancelation widget.
  FocusNode? employeeNumberCancelationFocusNode;
  TextEditingController? employeeNumberCancelationTextController;
  String? Function(BuildContext, String?)?
      employeeNumberCancelationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    employeeNumberCancelationFocusNode?.dispose();
    employeeNumberCancelationTextController?.dispose();
  }
}

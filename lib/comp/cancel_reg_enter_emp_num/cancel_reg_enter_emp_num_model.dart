import '/flutter_flow/flutter_flow_util.dart';
import 'cancel_reg_enter_emp_num_widget.dart' show CancelRegEnterEmpNumWidget;
import 'package:flutter/material.dart';

class CancelRegEnterEmpNumModel
    extends FlutterFlowModel<CancelRegEnterEmpNumWidget> {
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

import '/flutter_flow/flutter_flow_util.dart';
import 'login_event_manager_o_t_p_widget.dart' show LoginEventManagerOTPWidget;
import 'package:flutter/material.dart';

class LoginEventManagerOTPModel
    extends FlutterFlowModel<LoginEventManagerOTPWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}

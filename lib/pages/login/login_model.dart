import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddressGuest widget.
  FocusNode? emailAddressGuestFocusNode;
  TextEditingController? emailAddressGuestTextController;
  String? Function(BuildContext, String?)?
      emailAddressGuestTextControllerValidator;
  String? _emailAddressGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Write correct email';
    }
    return null;
  }

  // State field(s) for passwordGuest widget.
  FocusNode? passwordGuestFocusNode;
  TextEditingController? passwordGuestTextController;
  late bool passwordGuestVisibility;
  String? Function(BuildContext, String?)? passwordGuestTextControllerValidator;
  String? _passwordGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressGuestTextControllerValidator =
        _emailAddressGuestTextControllerValidator;
    passwordGuestVisibility = false;
    passwordGuestTextControllerValidator =
        _passwordGuestTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressGuestFocusNode?.dispose();
    emailAddressGuestTextController?.dispose();

    passwordGuestFocusNode?.dispose();
    passwordGuestTextController?.dispose();
  }
}

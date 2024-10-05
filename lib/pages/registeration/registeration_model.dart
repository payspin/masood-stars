import '/flutter_flow/flutter_flow_util.dart';
import 'registeration_widget.dart' show RegisterationWidget;
import 'package:flutter/material.dart';

class RegisterationModel extends FlutterFlowModel<RegisterationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstNameGuest widget.
  FocusNode? firstNameGuestFocusNode;
  TextEditingController? firstNameGuestTextController;
  String? Function(BuildContext, String?)?
      firstNameGuestTextControllerValidator;
  String? _firstNameGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for LastNameGuest widget.
  FocusNode? lastNameGuestFocusNode;
  TextEditingController? lastNameGuestTextController;
  String? Function(BuildContext, String?)? lastNameGuestTextControllerValidator;
  String? _lastNameGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for IDnumberGuest widget.
  FocusNode? iDnumberGuestFocusNode;
  TextEditingController? iDnumberGuestTextController;
  String? Function(BuildContext, String?)? iDnumberGuestTextControllerValidator;
  String? _iDnumberGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for emailAddressGuest widget.
  FocusNode? emailAddressGuestFocusNode;
  TextEditingController? emailAddressGuestTextController;
  String? Function(BuildContext, String?)?
      emailAddressGuestTextControllerValidator;
  String? _emailAddressGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Write correct email';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for CreatepasswordGuest widget.
  FocusNode? createpasswordGuestFocusNode;
  TextEditingController? createpasswordGuestTextController;
  late bool createpasswordGuestVisibility;
  String? Function(BuildContext, String?)?
      createpasswordGuestTextControllerValidator;
  String? _createpasswordGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for ConfirmpasswordGuest widget.
  FocusNode? confirmpasswordGuestFocusNode;
  TextEditingController? confirmpasswordGuestTextController;
  late bool confirmpasswordGuestVisibility;
  String? Function(BuildContext, String?)?
      confirmpasswordGuestTextControllerValidator;
  String? _confirmpasswordGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    firstNameGuestTextControllerValidator =
        _firstNameGuestTextControllerValidator;
    lastNameGuestTextControllerValidator =
        _lastNameGuestTextControllerValidator;
    iDnumberGuestTextControllerValidator =
        _iDnumberGuestTextControllerValidator;
    emailAddressGuestTextControllerValidator =
        _emailAddressGuestTextControllerValidator;
    createpasswordGuestVisibility = false;
    createpasswordGuestTextControllerValidator =
        _createpasswordGuestTextControllerValidator;
    confirmpasswordGuestVisibility = false;
    confirmpasswordGuestTextControllerValidator =
        _confirmpasswordGuestTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameGuestFocusNode?.dispose();
    firstNameGuestTextController?.dispose();

    lastNameGuestFocusNode?.dispose();
    lastNameGuestTextController?.dispose();

    iDnumberGuestFocusNode?.dispose();
    iDnumberGuestTextController?.dispose();

    emailAddressGuestFocusNode?.dispose();
    emailAddressGuestTextController?.dispose();

    createpasswordGuestFocusNode?.dispose();
    createpasswordGuestTextController?.dispose();

    confirmpasswordGuestFocusNode?.dispose();
    confirmpasswordGuestTextController?.dispose();
  }
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'email_registeration_widget.dart' show EmailRegisterationWidget;
import 'package:flutter/material.dart';

class EmailRegisterationModel
    extends FlutterFlowModel<EmailRegisterationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstNameGuest widget.
  FocusNode? firstNameGuestFocusNode;
  TextEditingController? firstNameGuestTextController;
  String? Function(BuildContext, String?)?
      firstNameGuestTextControllerValidator;
  // State field(s) for emailAddressGuest widget.
  FocusNode? emailAddressGuestFocusNode;
  TextEditingController? emailAddressGuestTextController;
  String? Function(BuildContext, String?)?
      emailAddressGuestTextControllerValidator;
  // State field(s) for employeeNumberGuest widget.
  FocusNode? employeeNumberGuestFocusNode;
  TextEditingController? employeeNumberGuestTextController;
  String? Function(BuildContext, String?)?
      employeeNumberGuestTextControllerValidator;
  String? _employeeNumberGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CreateNewPasswordGuest widget.
  FocusNode? createNewPasswordGuestFocusNode;
  TextEditingController? createNewPasswordGuestTextController;
  late bool createNewPasswordGuestVisibility;
  String? Function(BuildContext, String?)?
      createNewPasswordGuestTextControllerValidator;
  String? _createNewPasswordGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for ConfirmNewpasswordGuest widget.
  FocusNode? confirmNewpasswordGuestFocusNode;
  TextEditingController? confirmNewpasswordGuestTextController;
  late bool confirmNewpasswordGuestVisibility;
  String? Function(BuildContext, String?)?
      confirmNewpasswordGuestTextControllerValidator;
  String? _confirmNewpasswordGuestTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? o3;

  @override
  void initState(BuildContext context) {
    employeeNumberGuestTextControllerValidator =
        _employeeNumberGuestTextControllerValidator;
    createNewPasswordGuestVisibility = false;
    createNewPasswordGuestTextControllerValidator =
        _createNewPasswordGuestTextControllerValidator;
    confirmNewpasswordGuestVisibility = false;
    confirmNewpasswordGuestTextControllerValidator =
        _confirmNewpasswordGuestTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameGuestFocusNode?.dispose();
    firstNameGuestTextController?.dispose();

    emailAddressGuestFocusNode?.dispose();
    emailAddressGuestTextController?.dispose();

    employeeNumberGuestFocusNode?.dispose();
    employeeNumberGuestTextController?.dispose();

    createNewPasswordGuestFocusNode?.dispose();
    createNewPasswordGuestTextController?.dispose();

    confirmNewpasswordGuestFocusNode?.dispose();
    confirmNewpasswordGuestTextController?.dispose();
  }
}

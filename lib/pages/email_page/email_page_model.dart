import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'email_page_widget.dart' show EmailPageWidget;
import 'package:flutter/material.dart';

class EmailPageModel extends FlutterFlowModel<EmailPageWidget> {
  ///  Local state fields for this page.

  DocumentReference? dbSV;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddressGuest widget.
  FocusNode? emailAddressGuestFocusNode;
  TextEditingController? emailAddressGuestTextController;
  String? Function(BuildContext, String?)?
      emailAddressGuestTextControllerValidator;
  // State field(s) for employeeNumTXT widget.
  FocusNode? employeeNumTXTFocusNode;
  TextEditingController? employeeNumTXTTextController;
  String? Function(BuildContext, String?)?
      employeeNumTXTTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? outputQueryUserDB;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? howManyRegistered;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MasaoodDBRecord>? outputQueryDB;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressGuestFocusNode?.dispose();
    emailAddressGuestTextController?.dispose();

    employeeNumTXTFocusNode?.dispose();
    employeeNumTXTTextController?.dispose();
  }
}

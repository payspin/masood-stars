import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ticket_event_manager_widget.dart' show TicketEventManagerWidget;
import 'package:flutter/material.dart';

class TicketEventManagerModel
    extends FlutterFlowModel<TicketEventManagerWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Send an email)] action in ButtonSendemail widget.
  ApiCallResponse? apiResultyk2;
  // Stores action output result for [Custom Action - downloadQrCodePDF] action in Button widget.
  List<dynamic>? emailPdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

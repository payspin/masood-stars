import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/comp/tap_bar_mob_view/tap_bar_mob_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_page_widget.dart' show EventPageWidget;
import 'package:flutter/material.dart';

class EventPageModel extends FlutterFlowModel<EventPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<MasaoodDBRecord>? totalGuestsOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<UsersRecord>? outputUsers;
  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<UsersRecord>? outputUserArrived;
  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<UsersRecord>? outputNotArr;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - API (Send an email)] action in ButtonSendemail widget.
  ApiCallResponse? apiResultyk2;
  // Stores action output result for [Custom Action - downloadQrCodePDF] action in Button widget.
  List<dynamic>? emailPdf;
  // Model for TapBarMobView component.
  late TapBarMobViewModel tapBarMobViewModel;

  @override
  void initState(BuildContext context) {
    tapBarMobViewModel = createModel(context, () => TapBarMobViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    tapBarMobViewModel.dispose();
  }
}

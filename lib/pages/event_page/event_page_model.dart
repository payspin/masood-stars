import '/backend/backend.dart';
import '/comp/tap_bar_mob_view/tap_bar_mob_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_page_widget.dart' show EventPageWidget;
import 'package:flutter/material.dart';

class EventPageModel extends FlutterFlowModel<EventPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<UsersRecord>? queryregisterationTotal;
  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<UsersRecord>? queryArrived;
  // Stores action output result for [Firestore Query - Query a collection] action in EventPage widget.
  List<MasaoodDBRecord>? queryGuestsTotal;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Model for TapBarMobView component.
  late TapBarMobViewModel tapBarMobViewModel;

  @override
  void initState(BuildContext context) {
    tapBarMobViewModel = createModel(context, () => TapBarMobViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tapBarMobViewModel.dispose();
  }
}

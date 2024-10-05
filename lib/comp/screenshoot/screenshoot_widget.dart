import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'screenshoot_model.dart';
export 'screenshoot_model.dart';

class ScreenshootWidget extends StatefulWidget {
  const ScreenshootWidget({super.key});

  @override
  State<ScreenshootWidget> createState() => _ScreenshootWidgetState();
}

class _ScreenshootWidgetState extends State<ScreenshootWidget> {
  late ScreenshootModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenshootModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

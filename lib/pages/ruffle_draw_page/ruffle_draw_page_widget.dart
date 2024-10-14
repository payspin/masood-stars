import '/backend/backend.dart';
import '/components/ruffle_draw_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'ruffle_draw_page_model.dart';
export 'ruffle_draw_page_model.dart';

class RuffleDrawPageWidget extends StatefulWidget {
  const RuffleDrawPageWidget({super.key});

  @override
  State<RuffleDrawPageWidget> createState() => _RuffleDrawPageWidgetState();
}

class _RuffleDrawPageWidgetState extends State<RuffleDrawPageWidget> {
  late RuffleDrawPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RuffleDrawPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.drawList = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'UserStateStatus',
              isEqualTo: 'Registered',
            )
            .where(
              'RuffleDraw',
              isNotEqualTo: true,
            ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF15161E),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'RuffleDraw',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: GradientText(
                  '',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Space Grotesk',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                      ),
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: wrapWithModel(
          model: _model.ruffleDrawComponentModel,
          updateCallback: () => safeSetState(() {}),
          child: const RuffleDrawComponentWidget(),
        ),
      ),
    );
  }
}

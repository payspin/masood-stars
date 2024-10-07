import '/components/dropdown_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tap_bar_mob_view_model.dart';
export 'tap_bar_mob_view_model.dart';

class TapBarMobViewWidget extends StatefulWidget {
  const TapBarMobViewWidget({super.key});

  @override
  State<TapBarMobViewWidget> createState() => _TapBarMobViewWidgetState();
}

class _TapBarMobViewWidgetState extends State<TapBarMobViewWidget> {
  late TapBarMobViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TapBarMobViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tablet: false,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/footer-logo-white.png',
                width: 130.0,
                height: 55.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'EventPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: '',
                  icon: const Icon(
                    Icons.space_dashboard,
                    size: 30.0,
                  ),
                  options: FFButtonOptions(
                    width: 40.0,
                    height: 40.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Space Grotesk',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 15.0,
                    borderRadius: BorderRadius.circular(100.0),
                    hoverTextColor: FlutterFlowTheme.of(context).logoOr1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 6.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'QRcodeScanPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: '',
                  icon: const Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 30.0,
                  ),
                  options: FFButtonOptions(
                    width: 40.0,
                    height: 40.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Space Grotesk',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 15.0,
                    borderRadius: BorderRadius.circular(100.0),
                    hoverTextColor: FlutterFlowTheme.of(context).logoOr1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 6.0),
                child: FFButtonWidget(
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
                  text: '',
                  icon: const FaIcon(
                    FontAwesomeIcons.spinner,
                    size: 30.0,
                  ),
                  options: FFButtonOptions(
                    width: 40.0,
                    height: 40.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 1.0, 0.0, 0.0),
                    color: const Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Space Grotesk',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 15.0,
                    borderRadius: BorderRadius.circular(100.0),
                    hoverTextColor: FlutterFlowTheme.of(context).logoOr1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 6.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      enableDrag: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const DropdownWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: '',
                  icon: const Icon(
                    Icons.menu_outlined,
                    size: 30.0,
                  ),
                  options: FFButtonOptions(
                    width: 40.0,
                    height: 40.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Space Grotesk',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

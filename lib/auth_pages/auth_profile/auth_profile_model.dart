import '/components/languages/languages_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auth_profile_widget.dart' show AuthProfileWidget;
import 'package:flutter/material.dart';

class AuthProfileModel extends FlutterFlowModel<AuthProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for languages component.
  late LanguagesModel languagesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    languagesModel = createModel(context, () => LanguagesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    languagesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

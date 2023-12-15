import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'languages_model.dart';
export 'languages_model.dart';

class LanguagesWidget extends StatefulWidget {
  const LanguagesWidget({super.key});

  @override
  _LanguagesWidgetState createState() => _LanguagesWidgetState();
}

class _LanguagesWidgetState extends State<LanguagesWidget> {
  late LanguagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowLanguageSelector(
              width: 200.0,
              height: 60.0,
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              borderColor: Colors.transparent,
              dropdownColor: FlutterFlowTheme.of(context).primaryText,
              dropdownIconColor: const Color(0xFF232327),
              borderRadius: 8.0,
              textStyle: GoogleFonts.getFont(
                'Poppins',
                color: const Color(0xFF232327),
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
              hideFlags: false,
              flagSize: 27.0,
              flagTextGap: 15.0,
              currentLanguage: FFLocalizations.of(context).languageCode,
              languages: FFLocalizations.languages(),
              onChanged: (lang) => setAppLanguage(context, lang),
            ),
          ),
        ],
      ),
    );
  }
}

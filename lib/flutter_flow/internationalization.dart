import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_Signup
  {
    'xrq2j3eh': {
      'en': 'Get Started',
      'es': 'Empezar',
    },
    '6wwrvnec': {
      'en': 'Create an account by using the form below.',
      'es': 'Cree una cuenta utilizando el siguiente formulario.',
    },
    'jzvd7m5d': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'dlogllhg': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'vsg6biz0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    '7acf55t2': {
      'en': 'Or sign up with',
      'es': 'O regístrate con',
    },
    'd8qwgowq': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'wk2w4ojk': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
    },
    'os3j1pin': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
    },
    '6tmtoqz1': {
      'en': 'Sign in here',
      'es': 'Firme aquí',
    },
    '0p057upt': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // auth_2_Login
  {
    '17nhnkdz': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
    },
    '5npa4tyh': {
      'en': 'Fill out the information below in order to access your account.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
    },
    'jiku9boa': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'uuf61ori': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'e18rppm6': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    'mopylxq4': {
      'en': 'Or sign in with',
      'es': 'O inicia sesión con',
    },
    '5bmnyzax': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'mymw72vz': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
    },
    'c78m49wi': {
      'en': 'Don\'t have an account?  ',
      'es': '¿No tienes una cuenta?',
    },
    's6fttluv': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'zfporiyx': {
      'en': 'Forgot password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'kl427ey0': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // auth_2_ForgotPassword
  {
    'mnz0t0y3': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    '07yw4eg6': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'es':
          'Complete su correo electrónico a continuación para recibir un enlace para restablecer la contraseña.',
    },
    'wy11g00d': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'y3awsujj': {
      'en': 'Send Reset Link',
      'es': 'Enviar enlace de reinicio',
    },
    'w9hk5ohc': {
      'en': 'Forgotten Password',
      'es': 'Contraseña olvidada',
    },
  },
  // auth_CreateProfile
  {
    'ktyfm6zn': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // auth_Profile
  {
    '395luf9g': {
      'en': 'Your Account',
      'es': 'Su cuenta',
    },
    'efr5o1dj': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'a4li9yza': {
      'en': 'App Settings',
      'es': 'Ajustes de Aplicacion',
    },
    'ren1fqjg': {
      'en': 'Support',
      'es': 'Apoyo',
    },
    'jlq6fvtp': {
      'en': 'Terms of Service',
      'es': 'Términos de servicio',
    },
    '1zcyll3a': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    '3ezofvot': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // auth_EditProfile
  {
    '45wjrkgu': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
  },
  // chat_2_Details
  {
    'wtyw7mku': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // chat_2_main
  {
    'bjb0cp99': {
      'en': 'Your Chats',
      'es': 'Tus charlas',
    },
    'vweu6jlp': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    'pifdcezb': {
      'en': '__',
      'es': '__',
    },
  },
  // chat_2_InviteUsers
  {
    'b8ck0ybg': {
      'en': 'Selected',
      'es': 'Seleccionado',
    },
    'o3u6n7ra': {
      'en': 'Invite Friends',
      'es': 'Invitar a amigos',
    },
    'songbpnl': {
      'en': 'Select users from below to start a chat.',
      'es': 'Seleccione usuarios de abajo para iniciar un chat.',
    },
    'tjgxow1i': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // image_Details
  {
    'zjrnd46z': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // editProfile_auth_2
  {
    '7n4tx88y': {
      'en': 'Adjust the content below to update your profile.',
      'es': 'Ajuste el contenido a continuación para actualizar su perfil.',
    },
    'kj9ky4sb': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
    },
    '28hy0ym7': {
      'en': 'Your full name...',
      'es': 'Tu nombre completo...',
    },
    '9zispj3n': {
      'en': 'Tell us about yourself...',
      'es': 'Cuéntanos acerca de tí...',
    },
  },
  // chat_threadUpdate
  {
    'xlgar6ld': {
      'en': 'Me ',
      'es': '',
    },
  },
  // chat_DetailsOverlay
  {
    'ijvxi3lb': {
      'en': 'Chat Details',
      'es': 'Detalles del chat',
    },
    'ou1gqdoq': {
      'en': 'Group Chat ID: ',
      'es': 'ID de chat grupal:',
    },
    '3pfta4wv': {
      'en': 'In this chat',
      'es': 'en esta charla',
    },
    '0a1ndn89': {
      'en': 'Close',
      'es': 'Cerca',
    },
  },
  // chat_ThreadComponent
  {
    'bo7jp08j': {
      'en': 'Start typing here...',
      'es': 'Empieza a escribir aquí...',
    },
    'qniaaqkt': {
      'en': 'You must enter a message...',
      'es': 'Debes ingresar un mensaje...',
    },
    'd2v9f12s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // user_ListSmall
  {
    '0a2qspqt': {
      'en': 'ME',
      'es': 'A MÍ',
    },
  },
  // deleteDialog
  {
    '18x3na1q': {
      'en': 'Options',
      'es': 'Opciones',
    },
    'pjr46t88': {
      'en': 'Invite Users',
      'es': 'Invitar usuarios',
    },
    '3p7vxrb8': {
      'en': 'Delete Chat',
      'es': 'Eliminar chat',
    },
    'gh05h749': {
      'en': 'Confirm Delete',
      'es': 'Confirmar eliminación',
    },
    'leax9wel': {
      'en': 'You can\'t undo this action.',
      'es': 'No puedes deshacer esta acción.',
    },
    '7sqxtvn0': {
      'en': 'Delete',
      'es': 'Borrar',
    },
  },
  // Miscellaneous
  {
    'djh6f0ot': {
      'en': '',
      'es': '',
    },
    'p3jeeujt': {
      'en': '',
      'es': '',
    },
    'unatwype': {
      'en': '',
      'es': '',
    },
    '2o6lto0g': {
      'en': '',
      'es': '',
    },
    '9dx9ryoa': {
      'en': '',
      'es': '',
    },
    'k6z71lt9': {
      'en': '',
      'es': '',
    },
    'ihjaa3fn': {
      'en': '',
      'es': '',
    },
    '3jj48ovb': {
      'en': '',
      'es': '',
    },
    'i4m4j8hm': {
      'en': '',
      'es': '',
    },
    'zhfat73o': {
      'en': '',
      'es': '',
    },
    'i5uq6u04': {
      'en': '',
      'es': '',
    },
    'mocyp86x': {
      'en': '',
      'es': '',
    },
    '1q4tkrt0': {
      'en': '',
      'es': '',
    },
    'rms99cz9': {
      'en': '',
      'es': '',
    },
    'y7lw2dkh': {
      'en': '',
      'es': '',
    },
    'agc9c15i': {
      'en': '',
      'es': '',
    },
    'ze4v8j97': {
      'en': '',
      'es': '',
    },
    'u9ki8mkd': {
      'en': '',
      'es': '',
    },
    'r3ldwm6b': {
      'en': '',
      'es': '',
    },
    '0weru6fb': {
      'en': '',
      'es': '',
    },
    'jnz8mks9': {
      'en': '',
      'es': '',
    },
    'gwu7lf7s': {
      'en': '',
      'es': '',
    },
    'im7z2kju': {
      'en': '',
      'es': '',
    },
    '41pvpbbr': {
      'en': '',
      'es': '',
    },
    'uvnhcyyn': {
      'en': '',
      'es': '',
    },
    '71eea3ks': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));

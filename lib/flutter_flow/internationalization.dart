import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

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
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

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
      'fr': 'Commencer',
    },
    '6wwrvnec': {
      'en': 'Create an account by using the form below.',
      'es': 'Cree una cuenta utilizando el siguiente formulario.',
      'fr': 'Créez un compte en utilisant le formulaire ci-dessous.',
    },
    'jzvd7m5d': {
      'en': '',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'u6jsv4d3': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'dlogllhg': {
      'en': '',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'uanyllu4': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    'vsg6biz0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '7acf55t2': {
      'en': 'Or sign up with',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
    },
    'd8qwgowq': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
    },
    'wk2w4ojk': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
    },
    '4qsca0pe': {
      'en': 'Continue with Facebook',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
    },
    'os3j1pin': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte?',
    },
    '6tmtoqz1': {
      'en': 'Sign in here',
      'es': 'Firme aquí',
      'fr': 'Se connecter ici',
    },
    '0p057upt': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // auth_Login
  {
    '17nhnkdz': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
      'fr': 'Content de te revoir',
    },
    '5npa4tyh': {
      'en': 'Fill out the information below in order to access your account.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'fr':
          'Remplissez les informations ci-dessous afin d\'accéder à votre compte.',
    },
    'jiku9boa': {
      'en': '',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'j8zhu1f4': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'uuf61ori': {
      'en': '',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '3gj64asq': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    'e18rppm6': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'mopylxq4': {
      'en': 'Or sign in with',
      'es': 'O inicia sesión con',
      'fr': 'Ou connectez-vous avec',
    },
    '5bmnyzax': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
    },
    'mymw72vz': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
    },
    'xa3ovsnk': {
      'en': 'Continue with Facebook',
      'es': 'Continuar con Apple',
      'fr': 'Continuer avec Apple',
    },
    'c78m49wi': {
      'en': 'Don\'t have an account?  ',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    's6fttluv': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'zfporiyx': {
      'en': 'Forgot password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    'kl427ey0': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // auth_ForgotPassword
  {
    'mnz0t0y3': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    '07yw4eg6': {
      'en':
          'Please fill out your email below in order to recieve a reset password link.',
      'es':
          'Complete su correo electrónico a continuación para recibir un enlace para restablecer la contraseña.',
      'fr':
          'Veuillez remplir votre e-mail ci-dessous afin de recevoir un lien de réinitialisation du mot de passe.',
    },
    'wy11g00d': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'y3awsujj': {
      'en': 'Send Reset Link',
      'es': 'Enviar enlace de reinicio',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'w9hk5ohc': {
      'en': 'Forgotten Password',
      'es': 'Contraseña olvidada',
      'fr': 'mot de passe oublié',
    },
  },
  // auth_CreateProfile
  {
    'ktyfm6zn': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // auth_Profile
  {
    '395luf9g': {
      'en': 'Your Account',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
    },
    'efr5o1dj': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'a4li9yza': {
      'en': 'App Settings',
      'es': 'Ajustes de Aplicacion',
      'fr': 'Paramètres de l\'application',
    },
    'ren1fqjg': {
      'en': 'Support',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'jlq6fvtp': {
      'en': 'Terms of Service',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
    },
    '1zcyll3a': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '3ezofvot': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // auth_EditProfile
  {
    '45wjrkgu': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
  },
  // chat_Details
  {
    'wtyw7mku': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // chat_main
  {
    'bjb0cp99': {
      'en': 'Chats',
      'es': 'Tus charlas',
      'fr': 'Vos discussions',
    },
    'n1agorm9': {
      'en': 'Group Chat',
      'es': '',
      'fr': '',
    },
    '18hrhwg6': {
      'en': 'Group Chat',
      'es': '',
      'fr': '',
    },
    'vweu6jlp': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'pifdcezb': {
      'en': '__',
      'es': '__',
      'fr': '__',
    },
  },
  // chat_InviteUsers
  {
    'b8ck0ybg': {
      'en': 'Selected',
      'es': 'Seleccionado',
      'fr': 'Choisi',
    },
    'o3u6n7ra': {
      'en': 'Invite Friends',
      'es': 'Invitar a amigos',
      'fr': 'Inviter des amis',
    },
    'songbpnl': {
      'en': 'Select users from below to start a chat.',
      'es': 'Seleccione usuarios de abajo para iniciar un chat.',
      'fr':
          'Sélectionnez les utilisateurs ci-dessous pour démarrer une discussion.',
    },
    'tjgxow1i': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // image_Details
  {
    'zjrnd46z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // editProfile_auth_2
  {
    '7n4tx88y': {
      'en': 'Adjust the content below to update your profile.',
      'es': 'Ajuste el contenido a continuación para actualizar su perfil.',
      'fr': 'Ajustez le contenu ci-dessous pour mettre à jour votre profil.',
    },
    'kj9ky4sb': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
      'fr': 'Changer la photo',
    },
    '28hy0ym7': {
      'en': 'Your full name...',
      'es': 'Tu nombre completo...',
      'fr': 'Ton nom complet...',
    },
    '9zispj3n': {
      'en': 'Tell us about yourself...',
      'es': 'Cuéntanos acerca de tí...',
      'fr': 'Parlez nous de vous...',
    },
  },
  // chat_threadUpdate
  {
    '7i1dwsbz': {
      'en': 'Me ',
      'es': 'A mí',
      'fr': 'Moi',
    },
  },
  // chat_DetailsOverlay
  {
    'ijvxi3lb': {
      'en': 'Chat Details',
      'es': 'Detalles del chat',
      'fr': 'Détails du chat',
    },
    'ou1gqdoq': {
      'en': 'Group Chat ID: ',
      'es': 'ID de chat grupal:',
      'fr': 'Identifiant de discussion de groupe :',
    },
    '3pfta4wv': {
      'en': 'In this chat',
      'es': 'en esta charla',
      'fr': 'Dans cette discussion',
    },
    '0a1ndn89': {
      'en': 'Close',
      'es': 'Cerca',
      'fr': 'Fermer',
    },
  },
  // chat_ThreadComponent
  {
    'bo7jp08j': {
      'en': 'Start typing here...',
      'es': 'Empieza a escribir aquí...',
      'fr': 'Commencez à taper ici...',
    },
    'qniaaqkt': {
      'en': 'You must enter a message...',
      'es': 'Debes ingresar un mensaje...',
      'fr': 'Vous devez saisir un message...',
    },
    'd2v9f12s': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // user_ListSmall
  {
    '0a2qspqt': {
      'en': 'ME',
      'es': 'A MÍ',
      'fr': 'MOI',
    },
  },
  // deleteDialog
  {
    '18x3na1q': {
      'en': 'Options',
      'es': 'Opciones',
      'fr': 'Possibilités',
    },
    'pjr46t88': {
      'en': 'Invite Users',
      'es': 'Invitar usuarios',
      'fr': 'Inviter des utilisateurs',
    },
    '3p7vxrb8': {
      'en': 'Delete Chat',
      'es': 'Eliminar chat',
      'fr': 'Supprimer le chat',
    },
    'gh05h749': {
      'en': 'Confirm Delete',
      'es': 'Confirmar eliminación',
      'fr': 'Confirmation de la suppression',
    },
    'leax9wel': {
      'en': 'You can\'t undo this action.',
      'es': 'No puedes deshacer esta acción.',
      'fr': 'Vous ne pouvez pas annuler cette action.',
    },
    '7sqxtvn0': {
      'en': 'Delete',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
  },
  // Miscellaneous
  {
    'djh6f0ot': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'p3jeeujt': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'unatwype': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '2o6lto0g': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '9dx9ryoa': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'k6z71lt9': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ihjaa3fn': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '3jj48ovb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'i4m4j8hm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zhfat73o': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'i5uq6u04': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'mocyp86x': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '1q4tkrt0': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rms99cz9': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'y7lw2dkh': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'agc9c15i': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ze4v8j97': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'u9ki8mkd': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'r3ldwm6b': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0weru6fb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jnz8mks9': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'gwu7lf7s': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'im7z2kju': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '41pvpbbr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'uvnhcyyn': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '71eea3ks': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

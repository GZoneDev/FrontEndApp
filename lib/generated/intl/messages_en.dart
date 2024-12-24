// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountQuestion":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create now"),
        "emailOrPhonePlaceholder":
            MessageLookupByLibrary.simpleMessage("Email/Phone"),
        "forgottenPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "loginButton": MessageLookupByLibrary.simpleMessage("Sign in"),
        "loginLink": MessageLookupByLibrary.simpleMessage("Sign in"),
        "loginSubtitle":
            MessageLookupByLibrary.simpleMessage("Log in to your account"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Sign in"),
        "namePlaceholder": MessageLookupByLibrary.simpleMessage("Name"),
        "noAccountQuestion":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "passwordPlaceholder": MessageLookupByLibrary.simpleMessage("Password"),
        "registerButton": MessageLookupByLibrary.simpleMessage("Sign up"),
        "registerLink": MessageLookupByLibrary.simpleMessage("Sign up"),
        "registerSubtitle":
            MessageLookupByLibrary.simpleMessage("Create a new account"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Sign up"),
        "wantToCookQuestion": MessageLookupByLibrary.simpleMessage(
            "Do you want to cook something?")
      };
}

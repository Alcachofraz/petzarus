import 'dart:developer' show log;

const String _tag = '+';
int _debugId = 0;

dynamic print(var msg, {String prefix = 'DEBUG', bool isError = false}) {
  if (isError) prefix = '{ERROR} ' + prefix;
  //debugPrint('$_tag[${prefix.toUpperCase()} (${_debugId++})] $msg');
  log('$msg', name: '$_tag ${prefix.toUpperCase()} (${_debugId++})');
  return msg;
}

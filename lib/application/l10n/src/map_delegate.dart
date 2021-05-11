import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

class MapDelegate<T> extends LocalizationsDelegate<T> {
  MapDelegate(this._mapFrom);

  final T Function(AppLocalizations) _mapFrom;

  @override
  Future<T> load(Locale locale) async {
    final appLocalizations = await AppLocalizations.delegate.load(locale);
    return SynchronousFuture(_mapFrom(appLocalizations));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<T> old) => false;

  @override
  bool isSupported(Locale locale) => AppLocalizations.delegate.isSupported(locale);
}

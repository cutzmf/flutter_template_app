import '../../../home/home.dart';
import '../src/app_localizations.dart';

class HomeMappedStrings implements Strings {
  final AppLocalizations appLocalizations;

  HomeMappedStrings(this.appLocalizations);

  @override
  String get hiThere => appLocalizations.hiThere;
}

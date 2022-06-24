import '../../../home/home.dart';
import '../l10n.dart';

class HomeL10nDelegate extends MapDelegate<Strings> {
  HomeL10nDelegate() : super(_Strings.new);
}

class _Strings implements Strings {
  _Strings(this.appLocalizations);

  final AppLocalizations appLocalizations;

  @override
  String get hiThere => appLocalizations.hiThere;
}

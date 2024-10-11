// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeliveryController on DeliveryControllerBase, Store {
  late final _$racesAtom =
      Atom(name: 'DeliveryControllerBase.races', context: context);

  @override
  ObservableList<OptionModel> get races {
    _$racesAtom.reportRead();
    return super.races;
  }

  @override
  set races(ObservableList<OptionModel> value) {
    _$racesAtom.reportWrite(value, super.races, () {
      super.races = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: 'DeliveryControllerBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: 'DeliveryControllerBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$documentControllerAtom =
      Atom(name: 'DeliveryControllerBase.documentController', context: context);

  @override
  TextEditingController get documentController {
    _$documentControllerAtom.reportRead();
    return super.documentController;
  }

  @override
  set documentController(TextEditingController value) {
    _$documentControllerAtom.reportWrite(value, super.documentController, () {
      super.documentController = value;
    });
  }

  late final _$birthDayControllerAtom =
      Atom(name: 'DeliveryControllerBase.birthDayController', context: context);

  @override
  TextEditingController get birthDayController {
    _$birthDayControllerAtom.reportRead();
    return super.birthDayController;
  }

  @override
  set birthDayController(TextEditingController value) {
    _$birthDayControllerAtom.reportWrite(value, super.birthDayController, () {
      super.birthDayController = value;
    });
  }

  late final _$nationalityControllerAtom = Atom(
      name: 'DeliveryControllerBase.nationalityController', context: context);

  @override
  TextEditingController get nationalityController {
    _$nationalityControllerAtom.reportRead();
    return super.nationalityController;
  }

  @override
  set nationalityController(TextEditingController value) {
    _$nationalityControllerAtom.reportWrite(value, super.nationalityController,
        () {
      super.nationalityController = value;
    });
  }

  late final _$contactControllerAtom =
      Atom(name: 'DeliveryControllerBase.contactController', context: context);

  @override
  TextEditingController get contactController {
    _$contactControllerAtom.reportRead();
    return super.contactController;
  }

  @override
  set contactController(TextEditingController value) {
    _$contactControllerAtom.reportWrite(value, super.contactController, () {
      super.contactController = value;
    });
  }

  late final _$cepControllerAtom =
      Atom(name: 'DeliveryControllerBase.cepController', context: context);

  @override
  TextEditingController get cepController {
    _$cepControllerAtom.reportRead();
    return super.cepController;
  }

  @override
  set cepController(TextEditingController value) {
    _$cepControllerAtom.reportWrite(value, super.cepController, () {
      super.cepController = value;
    });
  }

  late final _$cityControllerAtom =
      Atom(name: 'DeliveryControllerBase.cityController', context: context);

  @override
  TextEditingController get cityController {
    _$cityControllerAtom.reportRead();
    return super.cityController;
  }

  @override
  set cityController(TextEditingController value) {
    _$cityControllerAtom.reportWrite(value, super.cityController, () {
      super.cityController = value;
    });
  }

  late final _$neighborhoodControllerAtom = Atom(
      name: 'DeliveryControllerBase.neighborhoodController', context: context);

  @override
  TextEditingController get neighborhoodController {
    _$neighborhoodControllerAtom.reportRead();
    return super.neighborhoodController;
  }

  @override
  set neighborhoodController(TextEditingController value) {
    _$neighborhoodControllerAtom
        .reportWrite(value, super.neighborhoodController, () {
      super.neighborhoodController = value;
    });
  }

  late final _$addressControllerAtom =
      Atom(name: 'DeliveryControllerBase.addressController', context: context);

  @override
  TextEditingController get addressController {
    _$addressControllerAtom.reportRead();
    return super.addressController;
  }

  @override
  set addressController(TextEditingController value) {
    _$addressControllerAtom.reportWrite(value, super.addressController, () {
      super.addressController = value;
    });
  }

  late final _$raceAtom =
      Atom(name: 'DeliveryControllerBase.race', context: context);

  @override
  OptionModel? get race {
    _$raceAtom.reportRead();
    return super.race;
  }

  @override
  set race(OptionModel? value) {
    _$raceAtom.reportWrite(value, super.race, () {
      super.race = value;
    });
  }

  late final _$loadRacesAsyncAction =
      AsyncAction('DeliveryControllerBase.loadRaces', context: context);

  @override
  Future<void> loadRaces() {
    return _$loadRacesAsyncAction.run(() => super.loadRaces());
  }

  late final _$DeliveryControllerBaseActionController =
      ActionController(name: 'DeliveryControllerBase', context: context);

  @override
  void setRace(OptionModel? value) {
    final _$actionInfo = _$DeliveryControllerBaseActionController.startAction(
        name: 'DeliveryControllerBase.setRace');
    try {
      return super.setRace(value);
    } finally {
      _$DeliveryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
races: ${races},
pageController: ${pageController},
nameController: ${nameController},
documentController: ${documentController},
birthDayController: ${birthDayController},
nationalityController: ${nationalityController},
contactController: ${contactController},
cepController: ${cepController},
cityController: ${cityController},
neighborhoodController: ${neighborhoodController},
addressController: ${addressController},
race: ${race}
    ''';
  }
}

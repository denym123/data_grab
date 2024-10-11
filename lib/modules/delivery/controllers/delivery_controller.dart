import 'package:data_grab/core/json/json.dart';
import 'package:data_grab/modules/delivery/delivery.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../models/models.dart';

part 'delivery_controller.g.dart';

class DeliveryController = DeliveryControllerBase with _$DeliveryController;

abstract class DeliveryControllerBase with Store, ControllerLifeCycle {
  final DeliveryRepository _deliveryRepository;

  DeliveryControllerBase({required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;


  //id INTEGER
  // name TEXT
  // document TEXT
  // birth_day
  // nacinality TEXT
  // marital_status TEXT
  // race TEXT
  // contact TEXT
  // comunity TEXT

  @override
  void onInit([Map<String, dynamic>? params]) {
    loadRaces();
  }


  @observable
  ObservableList<OptionModel> races = ObservableList<OptionModel>();

  @observable
  PageController pageController = PageController();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController documentController = TextEditingController();

  @observable
  TextEditingController birthDayController = TextEditingController();

  @observable
  TextEditingController nationalityController = TextEditingController();

  @observable
  TextEditingController contactController = TextEditingController();

  @observable
  TextEditingController cepController = TextEditingController();

  @observable
  TextEditingController cityController = TextEditingController();

  @observable
  TextEditingController neighborhoodController = TextEditingController();

  @observable
  TextEditingController addressController = TextEditingController();


  @observable
  OptionModel? race;

  @action
  void setRace(OptionModel? value) {
    race = value;
  }

  @action
  Future<void> loadRaces() async {
    var list = RaceMap().data().map(
      (e) {
        return OptionModel(name: e['ethnicity'], id: e['id']);
      },
    );
    races.addAll(list);
  }
}

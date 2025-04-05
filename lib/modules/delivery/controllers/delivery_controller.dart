import 'package:data_grab/core/json/json.dart';
import 'package:data_grab/modules/delivery/delivery.dart';
import 'package:data_grab/modules/delivery/dtos/save_family_request_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../home/controllers/home_controller.dart';
import '../models/models.dart';

part 'delivery_controller.g.dart';

class DeliveryController = DeliveryControllerBase with _$DeliveryController;

abstract class DeliveryControllerBase with Store, ControllerLifeCycle {
  final DeliveryRepository _deliveryRepository;
  final UserStore _userStore = Modular.get<UserStore>();

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
  ObservableList<OptionModel> cities = ObservableList<OptionModel>.of(
    [
      OptionModel(id: 0, name: "Boa Vista"),
      OptionModel(id: 1, name: "Alto Alegre"),
      OptionModel(id: 2, name: "Amajari"),
      OptionModel(id: 3, name: "Bonfim"),
      OptionModel(id: 4, name: "Cantá"),
      OptionModel(id: 5, name: "Caracaraí"),
      OptionModel(id: 6, name: "Caroebe"),
      OptionModel(id: 7, name: "Iracema"),
      OptionModel(id: 8, name: "Mucajaí"),
      OptionModel(id: 9, name: "Normandia"),
      OptionModel(id: 10, name: "Pacaraima"),
      OptionModel(id: 11, name: "Rorainópolis"),
      OptionModel(id: 12, name: "São João da Baliza"),
      OptionModel(id: 13, name: "São Luiz"),
      OptionModel(id: 14, name: "Uiramutã"),
    ],
  );

  @observable
  ObservableList<OptionModel> nationalities = ObservableList<OptionModel>.of(
    [
      OptionModel(id: 0, name: "Brasileiro"),
      OptionModel(id: 1, name: "Venezuelano"),
      OptionModel(id: 2, name: "Haitiano"),
      OptionModel(id: 3, name: "Colombiano"),
      OptionModel(id: 4, name: "Outros"),
    ],
  );

  @observable
  OptionModel? city;

  @observable
  OptionModel? nationality;

  @observable
  ObservableList<DependentModel> dependents = ObservableList<DependentModel>();

  @observable
  PageController pageController = PageController();

  @observable
  OptionModel? sex;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController documentController = TextEditingController();

  @observable
  TextEditingController personNumberController = TextEditingController();

  @observable
  TextEditingController birthDayController = TextEditingController();

  @observable
  TextEditingController numberController = TextEditingController();

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
  OptionModel? community;

  @action
  void setRace(OptionModel? value) {
    community = value;
  }

  @action
  Future<void> saveFamily() async {
    SaveFamilyRequestDto saveFamilyRequestDto = SaveFamilyRequestDto(
      responsible: ResponsibleModel(
        interviewerName: _userStore.userModel!.name,
        interviewerDocument: _userStore.userModel!.document,
        personNumber: personNumberController.text,
        sex: sex?.name ?? '',
        birthday: birthDayController.text,
        city: city?.name ?? '',
        community: community?.name ?? '',
        document: documentController.text,
        name: nameController.text,
        neighbourhood: neighborhoodController.text,
        nationality: nationality?.name ?? '',
        street: addressController.text,
        zip: cepController.text,
        number: numberController.text,
      ),
    );

    await _deliveryRepository
        .saveOnlyResponsible(saveFamilyRequestDto)
        .then((_) {
      Modular.get<HomeController>().fetchDeliveries();
      Modular.to.pop();
    });
    //await _deliveryRepository.saveFamily(interviewer).then(
    //  (familyId) {
    //    for (DependentModel dependent in saveFamilyRequestDto.dependent!) {
    //      dependent.familyId = familyId;
    //    }
    //    saveFamilyRequestDto.responsible?.familyId = familyId;
//
    //    _deliveryRepository
    //        .saveResponsibleAndDependents(saveFamilyRequestDto, familyId)
    //        .then(
    //      (value) {
    //        Modular.get<HomeController>().fetchDeliveries();
    //        Modular.to.pop();
    //      },
    //    );
    //  },
    //);
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
